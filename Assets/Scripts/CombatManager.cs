using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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
        player1Entity = null;
        player2Entity = null;
        targetLister.canDetect = true;
        StartCoroutine(WaitForPlayers());
    }

    IEnumerator WaitForPlayers()
    {
        while (!player1Entity || !player2Entity)
        {
            yield return new WaitForEndOfFrame();
        }
        AffectTargets();
        NewTurn(TurnState.player1);
    }

    public void EntityFound(Entity entity)
    {
        if (player1Entity == null)
        {
            player1Entity = entity;
        }
        else if (player2Entity == null && entity.GetInstanceID() != player1Entity.GetInstanceID())
        {
            player2Entity = entity;
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
        if (entity == player1Entity)
        {
            player2Score++;
        }
        else if (entity == player2Entity)
        {
            player1Score++;
        }
        NewRound();
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

