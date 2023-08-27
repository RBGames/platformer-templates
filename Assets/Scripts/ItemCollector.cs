using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class ItemCollector : MonoBehaviour
{

    private int watermelons = 0;
    [SerializeField] private Text watermelonsText;
    [SerializeField] private AudioSource collectSoundEffect; 

    private void OnTriggerEnter2D(Collider2D collision) 
    {
        if(collision.gameObject.CompareTag("Watermelon")) 
        {
            Destroy(collision.gameObject);
            watermelons++;
            watermelonsText.text = "Watermelons: " + watermelons; 
            collectSoundEffect.Play();
        }
    } 
}
