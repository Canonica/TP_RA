using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CombatManager : MonoBehaviour
{
    public static CombatManager instance;

    public Entity player1Entity;
    public Entity player2Entity;

    public enum TurnState
    {
        player1,
        player2,
        Nobody
    }

    public TurnState currentTurnState;
    public TurnState previousTurnState;
    public float timeBetweenTurns;
    bool isChangingTurn;

    public int player1Score;
    public int player2Score;
    public int nbOfRounds;

    TargetLister targetLister;

    void Awake()
    {
        if (instance == null)
        {
            //DontDestroyOnLoad(this.gameObject);
            instance = this;
        }
        else if (instance != this)
        {
            Destroy(this.gameObject);
        }
    }
    // Use this for initialization
    void Start()
    {
        targetLister = FindObjectOfType<TargetLister>();
        NewRound();
    }

    public void NewRound()
    {
        targetLister.canDetect = true;
        StartCoroutine(WaitForPlayers());
    }

    IEnumerator WaitForPlayers()
    {
        Debug.Log("Show player 1 card");
        while (!player1Entity)
        {
            yield return new WaitForEndOfFrame();
        }
        
        Debug.Log("Show player 2 card");
        while (!player2Entity)
        {
            yield return new WaitForEndOfFrame();
        }

        AffectTargets();

        targetLister.canDetect = false;

        NewTurn(TurnState.player1);
    }

    public void EntityFound(Entity entity)
    {
        if (player1Entity == null)
        {
            player1Entity = entity;
            player1Entity.currentLife = player1Entity.maxLife;
            player1Entity.InitAnim();
        }
        else if (player2Entity == null && entity.GetInstanceID() != player1Entity.GetInstanceID())
        {
            player2Entity = entity;
            player2Entity.currentLife = player2Entity.maxLife;
            player2Entity.InitAnim();
        }
    }

    public void ChangeTurn()
    {
        isChangingTurn = false;
        if (previousTurnState == TurnState.player1)
        {
            NewTurn(TurnState.player2);
        }
        else if (previousTurnState == TurnState.player2)
        {
            NewTurn(TurnState.player1);
        }
    }

    void NewTurn(TurnState state)
    {
        currentTurnState = state;
        previousTurnState = state;
        if (currentTurnState == TurnState.player1)
        {
            player1Entity.TurnBeginning();
        }
        else if (currentTurnState == TurnState.player2)
        {
            player2Entity.TurnBeginning();
        }
    }

    IEnumerator WaitBetweenTurns(float duration)
    {
        currentTurnState = TurnState.Nobody;
        isChangingTurn = true;
        yield return new WaitForSeconds(duration);
        ChangeTurn();
    }

    public void EndTurn()
    {
        StartCoroutine(WaitBetweenTurns(timeBetweenTurns));
    }

    public void EndRound(Entity entity)
    {
        bool gameEnd = false;

        if (entity == player1Entity)
        {
            player2Score++;
            if (player2Score >= nbOfRounds / 2 + 1)
            {
                EndGame(TurnState.player2);
                gameEnd = true;
            }
        }
        else if (entity == player2Entity)
        {
            player1Score++;
            if (player1Score >= nbOfRounds / 2 + 1)
            {
                EndGame(TurnState.player1);
                gameEnd = true;
            }
        }

        if (!gameEnd)
        {
            StartCoroutine(StartNewRound());
        }
    }

    IEnumerator StartNewRound()
    {
        player1Entity = null;
        player2Entity = null;
        currentTurnState = TurnState.Nobody;

        Debug.Log("No card must be visible ! " + targetLister.nbTrackable);

        while (targetLister.nbTrackable > 0)
        {
            yield return new WaitForEndOfFrame();
        }

        NewRound();
    }

    void EndGame(TurnState winner)
    {
        Debug.Log(winner + " is the winner !");

        StartCoroutine(WaitForClick());
    }

    IEnumerator WaitForClick()
    {
        while (!Input.GetMouseButtonUp(0))
        {
            yield return new WaitForEndOfFrame();
        }

        SceneManager.LoadScene(0);
    }

    public void AffectTargets()
    {
        if (player1Entity && player2Entity)
        {
            player1Entity.target = player2Entity;
            player2Entity.target = player1Entity;
        }
    }

    public bool CanAttack(Entity entity)
    {
        return (entity == player1Entity && currentTurnState == TurnState.player1) || (entity == player2Entity && currentTurnState == TurnState.player2);
    }
}

