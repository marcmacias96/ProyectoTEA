using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CambioEscena : MonoBehaviour {
    private AsyncOperation asyncLoad;

    public void E1()
    {
        SceneManager.LoadScene(2);
    }
    public void E2()
    {
        SceneManager.LoadScene(3);
    }
    public void E3()
    {
        SceneManager.LoadScene(4);
    }
    public void E4()
    {
        SceneManager.LoadScene(5);
    }
    public void E5()
    {
        SceneManager.LoadScene(6);
    }
    public void E6()
    {
        SceneManager.LoadScene(7);
    }
    public void E7()
    {
        SceneManager.LoadScene(8);
    }
    public void E8()
    {
        SceneManager.LoadScene(9);
    }
    public void E9()
    {
        SceneManager.LoadScene(10);
    }
    public void Regresar()
    {
       StartCoroutine(LoadSceneSlider());
    }

    IEnumerator LoadSceneSlider()
    {
        asyncLoad = SceneManager.LoadSceneAsync(1);
        while (!asyncLoad.isDone)
        {
           
            yield return null;
        }
    }

}
