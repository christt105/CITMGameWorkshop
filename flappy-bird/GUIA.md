# 🐦 Guia del Flappy Bird (Unity)

Benvingut/da! En aquests **2 dies** faràs el teu propi Flappy Bird amb **Unity**.
El projecte ja està quasi fet: només has d'omplir uns quants **`TODO`** (trossos de codi que falten). Cada `TODO` té una **pista** amb el codi gairebé escrit.

> 💡 Un `TODO` és un comentari que vol dir "aquí falta feina". Els trobaràs escrivint `TODO` a la barra de cerca del teu editor de codi.

---

## Què faràs

- **Dia 1:** muntar el joc → l'ocell salta, les canonades es mouen i pots morir o puntuar.
- **Dia 2:** fer-lo **teu** → canviar dibuixos, afegir sons, efectes i dificultat.

---

## Abans de començar

1. Obre **Unity Hub** i obre el projecte de la carpeta `FlappyBird/FlappyBirdWorkshop`.
2. A baix, a la finestra **Project**, obre `Assets/Scenes/SampleScene`.
3. Dalt de tot, prem el botó ▶️ **Play** per provar. Encara no funcionarà del tot: ara ho arreglarem!
4. Els scripts (el codi) són a `Assets/Scripts`. Fes doble clic per obrir-los.

---

## DIA 1 — Fem que funcioni

Fes els `TODO` **en ordre**, de l'1 al 7. Després de cada un, prem ▶️ **Play** per veure el canvi.

### 🟢 TODO 1 — Fer saltar l'ocell  (`Bird.cs`)

Volem que, quan premis la tecla de salt (barra espaiadora), l'ocell pugi.

```csharp
if (Input.GetButtonDown("Jump"))
{
    _rigidbody2D.velocity = Vector2.zero;
    _rigidbody2D.AddForce(Vector2.up * force, ForceMode2D.Impulse);
}
```

**Què fa?**
- `Input.GetButtonDown("Jump")` → comprova si has premut el botó de saltar.
- `velocity = Vector2.zero` → atura l'ocell (oblida la velocitat d'abans).
- `AddForce(... up ...)` → li dona una empenta cap amunt. ⬆️

### 🟢 TODO 2 — Sumar un punt  (`Bird.cs`)

Quan l'ocell passa entre dues canonades, toca un objecte invisible amb l'etiqueta `Point`.

```csharp
if (other.CompareTag("Point"))
{
    GameManager.Instance.AddPoint();
}
```

### 🟢 TODO 3 — Morir en xocar  (`Bird.cs`)

Si l'ocell toca una canonada o el terra (etiqueta `Obstacle`), s'acaba la partida.

```csharp
if (other.CompareTag("Obstacle"))
{
    _animator.SetTrigger("Dead");
    GameManager.Instance.GameOver();
}
```

### 🟢 TODO 4 — Moure les canonades  (`Pipe.cs`)

Les canonades han d'anar cap a l'esquerra perquè sembli que l'ocell avança.

```csharp
transform.position += Vector3.left * (speed * Time.deltaTime);
```

> 💡 `Time.deltaTime` fa que el moviment vagi igual de ràpid a tots els ordinadors.

### 🟢 TODO 5 — Esborrar canonades  (`Pipe.cs`)

Quan una canonada surt per l'esquerra de la pantalla, l'eliminem perquè no s'acumulin.

```csharp
if (transform.position.x < destroyPoint)
{
    Destroy(gameObject);
}
```

### 🟢 TODO 6 — Crear canonades  (`PipeSpawner.cs`)

Cada cert temps creem una canonada nova a una alçada a l'atzar.

```csharp
if (_timer > spawnRate)
{
    _timer = 0f;
    Vector2 spawnPosition = new Vector2(start.position.x, Random.Range(start.position.y, end.position.y));
    Instantiate(pipesPrefab, spawnPosition, Quaternion.identity);
}
```

**Què fa?**
- `Random.Range(...)` → tria una alçada a l'atzar entre dos punts (`start` i `end`).
- `Instantiate(...)` → crea una còpia nova de la canonada al joc.

### 🟢 TODO 7 — El marcador  (`GameManager.cs`)

Cada vegada que sumem un punt, actualitzem el número de la pantalla.

```csharp
_score += 1;
scoreText.text = _score.ToString();
```

✅ **Felicitats!** Ja tens un Flappy Bird que funciona. Prova'l!

---

## DIA 2 — Fes-lo teu 🎨

Ara toca experimentar. Tria les idees que més t'agradin (no cal fer-les totes):

### Fàcil
- **Canvia el dibuix de l'ocell:** porta una imatge nova a `Assets` i posa-la al `Sprite Renderer` de l'ocell.
- **Canvia el fons i el color de les canonades.**
- **Fes l'ocell més lleuger o més pesat:** canvia el valor `force` de l'script `Bird` (a l'Inspector).
- **Canvia la velocitat de les canonades:** valor `speed` de l'script `Pipe`.

### Mitjà
- **Més difícil amb el temps:** fes que `spawnRate` (al `PipeSpawner`) baixi una mica cada vegada que sumes punts.
- **Sons:** afegeix un `AudioSource` i fes sonar un efecte al saltar i un altre al morir.
- **Partícules:** afegeix un efecte de partícules quan sumes un punt.

### Repte
- **Power-up d'escut:** un objecte que, si el agafes, et deixa xocar una vegada sense morir.
- **Mode lent:** una tecla que baixi `Time.timeScale` un moment.

> 🏆 Al final del dia 2 ensenyarem els jocs a la classe. Cada Flappy Bird serà diferent!

---

## Si et quedes encallat/da

1. Llegeix el missatge vermell de la **Console** (a baix). Sol dir la línia de l'error.
2. Comprova que has copiat el codi **dins** de les claus `{ }` correctes.
3. A C# cada línia acaba amb **`;`** (punt i coma).
4. Pregunta al professor 🙋
