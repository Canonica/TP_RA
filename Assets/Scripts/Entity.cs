using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Entity : MonoBehaviour
{
    //Ce script gère chaque entité avec ses caractéristiques, ses animations et sa mort.
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
    protected float initCritChance;
    protected float initCritMultiplier;
    protected float initEsquiveChance;

    public Image lifeImage;

    // Use this for initialization
    void Start()
    {
        animator = GetComponent<Animator>();
        currentLife = maxLife;
        initAttack = attackPower;
        initCritChance = critChance;
        initCritMultiplier = critMultiplier;
        initEsquiveChance = esquiveChance;
    }

    private void OnEnable()
    {
        Debug.Log("Enabled");
    }

    private void Update()
    {
        if (target)
        {
            transform.LookAt(target.transform.position);
        }
    }

    public void InitStats()
    {
        currentLife = maxLife;
        attackPower = initAttack;
        critChance = initCritChance;
        critMultiplier = initCritMultiplier;
        esquiveChance = initEsquiveChance;
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

    public void EnableDisableMesh(bool enable)
    {
        foreach(SkinnedMeshRenderer renderer in GetComponentsInChildren<SkinnedMeshRenderer>())
        {
            renderer.enabled = enable;
        }
    }

    //Method for passive
    public virtual void TurnBeginning()
    {

    }

    public void SubstractLife(float amount, bool isCrit)
    {
        if(Random.Range(0, 100) <= esquiveChance)
        {
            animator.SetTrigger(esquiveTriggerString);
            Instantiate(VFXManager.instance.GetVFX("VFX_AirDash"), transform.position, Quaternion.identity);
        }
        else
        {
            currentLife -= amount;
            currentLife = Mathf.Max(0, currentLife);
            animator.SetTrigger(getHitTriggerString);
            lifeImage.DOFillAmount(currentLife / maxLife, 0.2f).SetEase(Ease.InOutSine);
            TextManager.instance.ShakeScaleUI(lifeImage.transform.parent.transform, 1, 1, 10, 90);

            if (!isCrit)
            {
                Instantiate(VFXManager.instance.GetVFX("VFX_HitLava"), transform.position, Quaternion.identity);
            }
            else
            {
                Instantiate(VFXManager.instance.GetVFX("VFX_MegaExplosion"), transform.position, Quaternion.identity);
            }
            
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

    //Method to init UILife
    public void InitLifeUI()
    {
        lifeImage.DOFillAmount(1, 0.2f).SetEase(Ease.InOutSine);
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

            target.SubstractLife(cC ? attackPower * critMultiplier : attackPower, cC);
        }
    }
}
