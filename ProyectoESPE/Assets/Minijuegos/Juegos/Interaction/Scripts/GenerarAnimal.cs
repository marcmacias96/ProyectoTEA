using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GenerarAnimal : MonoBehaviour {

	//public GameObject sheep, pig, duck, cow, chicken;
	public Text texto;
	//GameObject[] animals;
	string[] nombres=new string[5];
	int animal=-1;
	public string nombreactivo="";
	public AudioSource sheep, pig, duck, cow, chicken;

	AudioSource[] animals=new AudioSource[5];

	// Use this for initialization
	void Start () {
		animal=Random.Range(0,4);
		animals[0]=sheep;
		nombres[0]="oveja";
		animals[1]=pig;
		nombres[1]="cerdo";
		animals[2]=duck;
		nombres[2]="pato";
		animals[3]=cow;
		nombres[3]="vaca";
		animals[4]=chicken;
		nombres[4]="gallina";
		texto.text=nombres[animal];
	}
	
	public void CambiarAnimal(){
		animal=Random.Range(0,4);
		nombreactivo=nombres[animal];
		texto.text=nombres[animal];
		animals[animal].Play();
	}
}
