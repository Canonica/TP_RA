using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity : MonoBehaviour
{

    Animator animator;
    public float maxLife;
    public float currentLife;
    public float range = 10f;
    public float attackPower;
    public Entity target;

    public string attackTriggerString;
    public string getHitTriggerString;
    public string esquiveTriggerString;

    public float critChance;
    public float critMultiplier;
    public float esquiveChance;

    protected float initAttack;

    // Use this for initialization
    void Start()
    {
        animator = GetComponent<Animator>();
        currentLife = maxLife;
        initAttack = attackPower;
    }

    private void Update()
    {
        if (target)
        {
            transform.LookAt(target.transform.position);
        }
    }

    public void InitAnim()
    {
        animator.SetTrigger("Revive1Trigger");
    }

    void OnMouseDown()
    {
        target.LaunchAttack();
    }

    public void AddLife(float amount)
    {
        currentLife += amount;
        currentLife = Mathf.Min(currentLife, maxLife);
    }

    public virtual void TurnBeginning()
    {

    }

    public void SubstractLife(float amount)
    {
        if(Random.Range(0, 100) <= esquiveChance)
        {
            animator.SetTrigger(esquiveTriggerString);
            Debug.Log("Esquive");
        }
        else
        {
            currentLife -= amount;
            currentLife = Mathf.Max(0, currentLife);
            animator.SetTrigger(getHitTriggerString);
        }
        
        if (currentLife <= 0)
        {
            animator.SetTrigger("Death1Trigger");
            CombatManager.instance.EndRound(this);
        }
        else
        {
            CombatManager.instance.EndTurn();
        }
    }

    public void LaunchAttack()
    {
        if (Vector3.Distance(target.transform.position, transform.position) < range && CombatManager.instance.CanAttack(this))
        {
            animator.SetTrigger(attackTriggerString);

            bool cC = Random.Range(0, 100) <= critChance;
            if (cC)
            {
                Debug.Log("Coup critique ! (x" +critMultiplier+")" );
            }

            target.SubstractLife(cC ? attackPower * critMultiplier : attackPower);
        }
    }
}
