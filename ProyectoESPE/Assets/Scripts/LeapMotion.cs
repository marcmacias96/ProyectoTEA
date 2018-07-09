using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap;
using Leap.Unity;

public class LeapMotion : MonoBehaviour {
	float HandPalmPich;
	float HandPalmYam;
	float HandPalmRoll;
	float HandWristRot;
	Controller controller;
    Transform transform;
    // Use this for initialization
    private void Awake()
    {
        transform = GetComponent<Transform>();
    }

    // Update is called once per frame
    void Update () {
		controller = new Controller();
        Frame frame = controller.Frame();
		List<Hand> hands = frame.Hands;
		if (frame.Hands.Count  > 0) {

			Hand firstHand = hands [0];
		}

		HandPalmPich = hands [0].PalmNormal.Pitch;
		HandPalmRoll = hands [0].PalmNormal.Roll;
		HandPalmYam = hands [0].PalmNormal.Yaw;
		HandWristRot = hands [0].WristPosition.Pitch;
		

        // Movimieto 
        if(HandPalmYam > -2f && HandPalmYam < 3.5f)
        {
            transform.Translate(new Vector3(0, 0, 1 * Time.deltaTime));
            Debug.Log("Adelate"+ HandPalmYam);
        }
        else if(HandPalmYam<-2.2f)
        {
            transform.Translate(new Vector3(0, 0, -1 * Time.deltaTime));
            Debug.Log("Atras");
        }
        if (HandPalmRoll > 1.2)
        {
            transform.Translate(new Vector3(1 * Time.deltaTime, 0,0 ));
            Debug.Log("derecha" + HandPalmRoll);
        }
        else if (HandPalmRoll < -1.2)
        {
            transform.Translate(new Vector3(-1 * Time.deltaTime, 0,0));
            Debug.Log("izquierda");
        }
    }
}
