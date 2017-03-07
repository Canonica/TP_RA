using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;
public class TargetLister : MonoBehaviour
{
    public bool canDetect;

    public int nbTrackable;

    // Use this for initialization
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        nbTrackable = 0;

        StateManager sm = TrackerManager.Instance.GetStateManager();
        IEnumerable<TrackableBehaviour> tbs = sm.GetActiveTrackableBehaviours();
        foreach (TrackableBehaviour tb in tbs)
        {
            string name = tb.TrackableName;
            ImageTarget it = tb.Trackable as ImageTarget;
            Vector2 size = it.GetSize();

            if (canDetect)
            {
                SendData(tb.gameObject);
            }

            nbTrackable++;
        }
    }


    void SendData(GameObject entity)
    {
        if (entity.GetComponentInChildren<Entity>())
        {
            CombatManager.instance.EntityFound(entity.GetComponentInChildren<Entity>());
        }
        
    }
}