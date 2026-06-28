# 🐦 Guia del Flappy Bird (Unity)

Benvingut/da! En aquest taller de **2 dies** faràs el teu propi Flappy Bird amb **Unity**.

---

## Com ens organitzarem:

* **Dia 1: Joc des de zero** 🏗️
  Comencem amb un projecte net (només amb els dibuixos preparats). Crearem l'escena, afegirem la física i programarem des de zero el moviment de l'ocell, de les canonades i la creació automàtica d'obstacles.
* **Dia 2: Plantilla, TODOs i Personalització** 🎨
  Descarregarem una plantilla completa (`FlappyBird-Dia2.zip`) amb la interfície gràfica, el marcador i el menú a punt. Completarem ràpidament els codis que hi falten (marcats com a **`TODO`**) com a repàs del Dia 1, i dedicarem la resta del temps a afegir funcions extra (escuts, monedes, dificultat) i a personalitzar-lo completament amb els teus propis dibuixos i sons.

---

## 🏗️ DIA 1 — Creem el joc des de zero

Avui obrirem la carpeta del projecte `FlappyBird-2026` (que conté els dibuixos / *sprites*, però cap codi, prefab o escena). Farem el següent pas a pas amb el professor:

### 1. Fer saltar l'ocell (`Bird.cs`)
Crearem un objecte per a l'ocell, li afegirem un component `Rigidbody2D` (per a la gravetat) i un script anomenat `Bird.cs`. El codi per fer-lo saltar quan premem l'espai és:
```csharp
if (Input.GetButtonDown("Jump"))
{
    _rigidbody2D.velocity = Vector2.zero; // Atura la velocitat de caiguda anterior
    _rigidbody2D.AddForce(Vector2.up * force, ForceMode2D.Impulse); // Empenta cap amunt
}
```

### 2. Moure les canonades (`Pipe.cs`)
Crearem un script `Pipe.cs` i l'afegirem a les canonades per fer que es moguin cap a l'esquerra:
```csharp
transform.position += Vector3.left * (speed * Time.deltaTime);
```
I per evitar que s'acumulin a l'infinit, les destruirem quan surtin per l'esquerra de la pantalla:
```csharp
if (transform.position.x < destroyPoint)
{
    Destroy(gameObject);
}
```

### 3. Generar canonades infinites (`PipeSpawner.cs`)
Crearem un script `PipeSpawner.cs` en un objecte generador perquè creï còpies dels prefabs de les canonades a una alçada aleatòria cada cert temps:
```csharp
if (_timer > spawnRate)
{
    _timer = 0f;
    Vector2 spawnPosition = new Vector2(start.position.x, Random.Range(start.position.y, end.position.y));
    Instantiate(pipesPrefab, spawnPosition, Quaternion.identity); // Crea una canonada nova
}
```

---

## 🎨 DIA 2 — La plantilla i personalització

Avui tothom descarrega la plantilla de seguretat **`FlappyBird-Dia2.zip`** i l'obre amb Unity Hub. Aquest projecte ja té tots els menús, escenes, col·lisions i el marcador completament dissenyats. 

Per fer que funcioni, només has d'obrir els scripts i reomplir els **`TODO`** del 1 al 7 (el codi és exactament el mateix que vam fer el Dia 1!).

### 🟢 TODO 1 — Fer saltar l'ocell (`Bird.cs`)
Quan premis la tecla de salt (barra espaiadora), l'ocell ha de pujar.
```csharp
if (Input.GetButtonDown("Jump"))
{
    _rigidbody2D.velocity = Vector2.zero;
    _rigidbody2D.AddForce(Vector2.up * force, ForceMode2D.Impulse);
}
```

### 🟢 TODO 2 — Sumar un punt (`Bird.cs`)
Quan l'ocell passa entre les canonades, toca un sensor invisible amb el tag `Point`.
```csharp
if (other.CompareTag("Point"))
{
    GameManager.Instance.AddPoint();
}
```

### 🟢 TODO 3 — Morir en xocar (`Bird.cs`)
Si l'ocell toca una canonada o el terra (tag `Obstacle`), s'acaba la partida.
```csharp
if (other.CompareTag("Obstacle"))
{
    _animator.SetTrigger("Dead");
    GameManager.Instance.GameOver();
}
```

### 🟢 TODO 4 — Moure les canonades (`Pipe.cs`)
Les canonades s'han de moure cap a l'esquerra.
```csharp
transform.position += Vector3.left * (speed * Time.deltaTime);
```

### 🟢 TODO 5 — Esborrar canonades (`Pipe.cs`)
Quan surtin de la pantalla (x < destroyPoint), les eliminem.
```csharp
if (transform.position.x < destroyPoint)
{
    Destroy(gameObject);
}
```

### 🟢 TODO 6 — Crear canonades (`PipeSpawner.cs`)
Creem una canonada nova a una alçada aleatòria cada vegada que el temporitzador supera el `spawnRate`.
```csharp
if (_timer > spawnRate)
{
    _timer = 0f;
    Vector2 spawnPosition = new Vector2(start.position.x, Random.Range(start.position.y, end.position.y));
    Instantiate(pipesPrefab, spawnPosition, Quaternion.identity);
}
```

### 🟢 TODO 7 — El marcador (`GameManager.cs`)
Cada vegada que sumem un punt, actualitzem el número de la pantalla.
```csharp
_score += 1;
scoreText.text = _score.ToString();
```

---

## 🛠️ Afegim funcions noves (Junts a classe)

El professor triarà **1 o 2 funcions de la guia de `FUNCIONS.md`** i les programarem junts a la pissarra:
* 🔥 **Dificultat creixent** (les canonades van més ràpid a mesura que sumes punts).
* 🛡️ **Power-up d'escut** (xoca una vegada sense morir).
* 🪙 **Monedes** que donen punts extra.
* 🐢 **Mode lent (bullet time)** quan prems Shift.
* 🏅 **Medalles** d'or, plata i bronze a la pantalla de Game Over.

---

## 🎨 Fes-lo teu (Al teu ritme!)

Aquí tens llibertat total per personalitzar el joc:
* **Canvia el dibuix de l'ocell:** Arrossega una imatge nova a la carpeta `Assets/Sprites` i posa-la al *Sprite Renderer* del teu ocell.
* **Canvia el fons o el color de les canonades.**
* **Ajusta la gravetat i el salt:** Canvia el valor `force` de l'script `Bird` des de l'Inspector d'Unity.
* **Canvia la velocitat de les canonades:** Ajusta el valor `speed` de l'script `Pipe`.
* **Afegeix efectes:** Sons al saltar, música de fons, partícules en guanyar punts, etc.

> 🏆 **Showcase final:** Al final del taller, cadascú ensenyarà el seu joc a la classe. Fes que sigui uniquíssim!
