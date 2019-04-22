﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hand : MonoBehaviour
{
    public  Transform mHandMesh;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        mHandMesh.position = Vector3.Lerp(mHandMesh.position, transform.position, Time.deltaTime * 15.0f);

        
    }

    private void OnTriggerEnter2D(Collider2D collision){
        if(!collision.gameObject.CompareTag("Bubble")){
            return;
        }

        collision.gameObject.SetActive(false);
    }
}
