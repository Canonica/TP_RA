using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.UI;
public class TextManager : MonoBehaviour {
    public static TextManager instance;
    public Text text;

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
    void Start () {
        text.DOFade(0, 0);
        text.transform.DOScale(0, 0);
    }
	
	// Update is called once per frame
	void Update () {

	}

    public void FadeInAndOut(string parText, float fadeInDuration, float timeDuration, float fadeOutDuration, Color color)
    {
        text.text = parText;
        text.color = color;
        text.transform.DOScale(0, 0);
        text.transform.DOScale(1, fadeInDuration);
        text.DOFade(1, fadeInDuration);
        text.DOFade(0, fadeOutDuration).SetDelay(timeDuration);
        text.transform.DOScale(0, fadeOutDuration).SetDelay(timeDuration);
    }

    public void ShakeScaleUI(Transform objectToShake, float strength, float duration, int vibration, float randomness)
    {
        Vector3 initialPosition = objectToShake.transform.position;
        objectToShake.DOKill(true);
        objectToShake.transform.DOShakeScale(duration, strength, vibration, randomness)
            .OnComplete(() => objectToShake.DOKill(true))
            .OnComplete(() => objectToShake.transform.position = initialPosition);
    }
}
