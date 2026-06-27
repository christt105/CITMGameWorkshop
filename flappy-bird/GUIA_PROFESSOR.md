# 🎓 Guia del Professor — Funcions Extra (Flappy Bird)

Aquesta guia conté les instruccions de configuració a l'editor d'Unity i el codi complet per a cadascuna de les 7 funcions extra de **`FUNCIONS.md`**. Fes-la servir de referència ràpida durant la classe del Dia 2.

---

## 1. 🔥 Dificultat creixent (Velocitat de creació)
*Com més punts té el jugador, més ràpid apareixen les canonades (reduïm el `spawnRate` del generador).*

### Configuració a Unity:
1. A **`GameManager.cs`** necessitem una referència al `PipeSpawner` per poder canviar el seu `spawnRate`. (L'script base ja té la variable `public PipeSpawner pipeSpawner;` definida i enllaçada).

### Codi a `GameManager.cs`:
Dins del mètode `AddPoint()`, afegeix el següent codi:
```csharp
public void AddPoint()
{
    // <SOL>
    _score += 1;
    scoreText.text = _score.ToString();

    // DIFICULTAT: Redueix el temps de spawn en 0.05s per cada punt, amb un límit mínim de 0.8s
    if (pipeSpawner != null)
    {
        pipeSpawner.spawnRate = Mathf.Max(0.8f, pipeSpawner.spawnRate - 0.05f);
    }
    // </SOL>
}
```

---

## 2. 🛡️ Power-up d'escut
*Un escut que es recull a la pantalla i et permet sobreviure a un sol xoc contra una canonada o el terra.*

### Configuració a Unity:
1. Crea un nou tag anomenat **`Shield`** (a l'inspector, *Tag -> Add Tag*).
2. Arrossega un gràfic d'escut o estrella a l'escena.
3. Afegeix-li un **`BoxCollider2D`** o **`CircleCollider2D`**.
4. Activa la casella **`Is Trigger`** al collider.
5. Assigna-li el tag **`Shield`**.
6. Converteix-lo en un Prefab (arrossegant-lo a la carpeta `Prefabs`) per poder col·locar-lo en l'escenari o fer que aparegui aleatòriament.

### Codi a `Bird.cs`:
Afegeix una variable pública per controlar si tenim l'escut actiu:
```csharp
public bool hasShield = false;
```

Dins de `CheckCollision(Collider2D other)`:
```csharp
private void CheckCollision(Collider2D other)
{
    // Codi per recollir l'escut
    if (other.CompareTag("Shield"))
    {
        hasShield = true;
        Destroy(other.gameObject); // Destrueix l'escut de la pantalla
        return;
    }

    if (other.CompareTag("Obstacle"))
    {
        if (hasShield)
        {
            hasShield = false; // El gastem i sobrevivim
            // OPCIONAL: Llançar algun so o partícules de trencament d'escut aquí
            return;
        }
        
        _animator.SetTrigger("Dead");
        GameManager.Instance.GameOver();
    }
}
```

---

## 3. 🐢 Mode lent (Bullet Time)
*Prement la tecla Shift l'esquerra, el temps s'alenteix durant 1.5 segons de temps real per ajudar a passar un tram difícil.*

### Codi a `Bird.cs`:
Dins del mètode `LateUpdate()`, comprova si es prem la tecla:
```csharp
if (Input.GetKeyDown(KeyCode.LeftShift))
{
    StartCoroutine(SlowMotion());
}
```

Afegeix la corutina al final de l'script:
```csharp
private System.Collections.IEnumerator SlowMotion()
{
    Time.timeScale = 0.4f; // Alenteix el joc al 40% de la velocitat
    Time.fixedDeltaTime = 0.02f * Time.timeScale; // Ajusta la física per evitar parpelleigs

    // WaitForSeconds no funciona correctament si timeScale és molt baix. 
    // Cal fer servir WaitForSecondsRealtime:
    yield return new WaitForSecondsRealtime(1.5f); 

    Time.timeScale = 1.2f; // Breu impuls de tornada (opcional) o directament 1f
    Time.timeScale = 1f; 
    Time.fixedDeltaTime = 0.02f;
}
```

---

## 4. 🪙 Monedes (Punts extra)
*Monedes col·locades per l'escenari que donen punts immediats al recollir-les.*

### Configuració a Unity:
1. Crea un nou tag anomenat **`Coin`**.
2. Crea un GameObject amb la imatge de la moneda.
3. Afegeix-li un **`CircleCollider2D`** amb **`Is Trigger`** activat.
4. Assigna-li el tag **`Coin`**.

### Codi a `Bird.cs`:
Dins de `CheckCollision(Collider2D other)`:
```csharp
if (other.CompareTag("Coin"))
{
    GameManager.Instance.AddPoint(); // O un mètode de punts diferent
    Destroy(other.gameObject); // Esborra la moneda de la pantalla
}
```

---

## 5. 🏅 Medalles al final de la partida
*Mostra una medalla diferent (Or, Plata, Bronze) a la pantalla de Game Over segons els punts obtinguts.*

### Configuració a Unity:
1. A la jerarquia, dins del Canvas del Game Over, crea un nou component de text de TextMeshPro (nom: `MedalText`).
2. A **`GameManager.cs`**, afegeix la variable de referència:
   ```csharp
   public TextMeshProUGUI medalText;
   ```
3. Arrossega el text `MedalText` a la nova casella de l'script `GameManager` a l'inspector.

### Codi a `GameManager.cs`:
Dins del mètode `GameOver()`:
```csharp
public void GameOver()
{
    state = State.GameOver;
    gameOver.enabled = true;
    pipeSpawner.enabled = false;

    // Càlcul i visualització de medalles
    if (medalText != null)
    {
        if (_score >= 30)      medalText.text = "🏅 MEDALLA D'OR!";
        else if (_score >= 15) medalText.text = "🥈 MEDALLA DE PLATA!";
        else if (_score >= 5)  medalText.text = "🥉 MEDALLA DE BRONZE!";
        else                   medalText.text = "Segueix provant!";
    }

    if (_score > _bestScore)
    {
        _bestScore = _score;
        PlayerPrefs.SetInt("best", _bestScore);
    }
}
```

---

## 6. 🌄 Fons amb moviment (Parallax)
*El fons i el terra es desplacen a diferents velocitats per donar sensació de profunditat en 2D.*

### Configuració a Unity:
1. Crea un script anomenat `Parallax.cs`.
2. Assigna'l al GameObject del Fons (`Background`).
3. Ajusta el valor de la velocitat a l'inspector (el fons ha d'anar molt més lent que el terra, per exemple `speed = 0.5f`).

### Codi a `Parallax.cs`:
```csharp
using UnityEngine;

public class Parallax : MonoBehaviour
{
    public float speed = 0.5f;

    void Update()
    {
        // Només es mou si s'està jugant
        if (GameManager.Instance.state == GameManager.State.Playing)
        {
            transform.position += Vector3.left * (speed * Time.deltaTime);
        }
    }
}
```
*Consell:* Perquè el fons no s'acabi, pots duplicar l'objecte del fons i col·locar-lo un al costat de l'altre, o utilitzar un script de repetició infinita similar al de `Ground.cs`.

---

## 7. ✨ Juice (Sons i Partícules)

### A. Sons (Àudio)
1. A l'ocell (`Bird`), afegeix un component **`AudioSource`**.
2. Afegeix les variables a `Bird.cs` per emmagatzemar els sons (audioclips):
   ```csharp
   public AudioClip jumpSound;
   public AudioClip scoreSound;
   public AudioClip hitSound;
   private AudioSource _audioSource;
   ```
3. A `Awake()`, inicialitza'l: `_audioSource = GetComponent<AudioSource>();`
4. Executa els sons en els moments oportuns amb `_audioSource.PlayOneShot(nomDelSo);`

### B. Partícules en sumar punts
1. Crea un **`Particle System`** a Unity amb un efecte d'explosió d'estrelles o espurnes.
2. A `GameManager.cs` (o al sensor de punts), afegeix una referència al Particle System:
   ```csharp
   public ParticleSystem scoreParticles;
   ```
3. A `AddPoint()`, crida a:
   ```csharp
   if (scoreParticles != null) scoreParticles.Play();
   ```
