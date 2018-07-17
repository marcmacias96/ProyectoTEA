using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class AnimalSelected : MonoBehaviour {

	public GameObject kinectcontrol;
	public Text texto;
	string activeobjname="";
	GrabDropScript sc;
	GenerarAnimal gen;
	bool ok=false;
	int puntos=-1;



	// Use this for initialization
	void Start () {
		sc=kinectcontrol.GetComponent<GrabDropScript>();
		gen=kinectcontrol.GetComponent<GenerarAnimal>();

	}
	
	// Update is called once per frame
	void Update () {	
		activeobjname=sc.objname;
		if(activeobjname.Equals(gen.nombreactivo) ){
			puntos++;
			texto.text="Puntos: "+puntos;
			print("nombre activo: "+activeobjname+" puntos: "+puntos);
			sc.objname="";
			gen.CambiarAnimal();
		}else if(!activeobjname.Equals(gen.nombreactivo) && !activeobjname.Equals("")){
			gen.CambiarAnimal();
			sc.objname="";
		}
	}
}
