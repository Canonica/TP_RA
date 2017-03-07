using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity : MonoBehaviour
{

    Animator animator;
    public float maxLife;
    float currentLife;
    public float range = 10f;
    public float attackPower;
    public Entity target;

    public string attackTriggerString;
    public string getHitTriggerString;

    public float critChance;
    public float critMultiplier;
    // Use this for initialization
    void Start()
    {
        animator = GetComponent<Animator>();
        currentLife = maxLife;
    }

    private void Update()
    {
        if (target)
        {
            transform.LookAt(target.transform.position);
        }
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
        currentLife -= amount;
        currentLife = Mathf.Max(0, currentLife);
        animator.SetTrigger(getHitTriggerString);
        if (currentLife <= 0)
        {
            Debug.Log("DEAD");
            /*bool allPlayertrue = CombatManager.instance.listOfPlayer1.TrueForAll(b => b.GetComponent<Life>().currentLife <= 0);
            bool allMonsterTrue = CombatManager.instance.listOfPlayer2.TrueForAll(b => b.GetComponent<Life>().currentLife <= 0);
            
            if (allPlayertrue || allMonsterTrue)
            {
                StartCoroutine("WaitForEndCombat", 2.0f);
            }*/
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
            target.SubstractLife(attackPower);
        }
    }
}
