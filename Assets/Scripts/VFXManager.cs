using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class VFXManager : MonoBehaviour {

    public static VFXManager instance;

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
        FillList();
    }

    public List<GameObject> listOfVFX;
    public List<string> listOfVFXNames;

    public List<GameObject> listOfCurrentVFX;


    void FillList()
    {
        Object[] allVFX = Resources.LoadAll("VFX/", typeof(GameObject));
        foreach(Object parObject in allVFX)
        {
            listOfVFX.Add((GameObject)parObject);
            listOfVFXNames.Add(parObject.name);
        }
    }

    public GameObject GetVFX(string parString)
    {
        GameObject VFX = listOfVFX.Find(x => x.name == parString);
        if(VFX == null)
        {
            Debug.Log("Resources/VFX/" + parString + " does not exist");
            return null;
        }
        else
        {
            return VFX;
        }
        
    }
}
