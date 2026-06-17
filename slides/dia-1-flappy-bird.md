---
marp: true
theme: default
paginate: true
header: 'Taller: Crea el teu primer videojoc — CITM·UPC'
---

<!-- _paginate: false -->
<!-- _header: '' -->

# Dia 1 🐦
## Flappy Bird amb Unity

Avui farem el nostre primer joc... i funcionarà de veritat!

<!-- Benvinguda. Recordeu: cap pregunta és estúpida. Avui sortireu amb un joc jugable. -->

---

# Què farem aquests 2 dies?

- **Dia 1:** muntar el Flappy Bird → l'ocell salta, hi ha canonades i pots puntuar o morir.
- **Dia 2:** fer-lo **teu** → dibuixos, sons, efectes i dificultat.

> El joc ja està quasi fet. Tu ompliràs els trossos que falten (els `TODO`).

<!-- Expliqueu el format "omplir buits": no s'escriu tot de zero, es completen peces concretes amb pistes. -->

---

# Primer, Unity 🧩

Un **motor de videojocs**: el programa on muntem el joc.

- **Escena:** el "món" del joc (com un escenari de teatre).
- **GameObject:** cada cosa de l'escena (l'ocell, una canonada...).
- **Inspector:** on canviem les propietats d'un objecte.
- **▶️ Play:** prova el joc a l'instant.

<!-- Ensenyeu l'editor en directe 5 min: escena, jerarquia, inspector, botó Play. -->

---

# Com obrim el projecte?

1. Obre **Unity Hub**.
2. *Add project from disk* → carpeta `FlappyBirdWorkshop`.
3. Obre l'escena `Assets/Scenes/SampleScene`.
4. Prem ▶️ **Play**: encara no funciona del tot. Ara ho arreglem!

<!-- Tots a l'hora. Assegureu-vos que tothom obre l'escena correcta abans de continuar. -->

---

# Què és un `TODO`?

Un comentari al codi que vol dir **"aquí falta feina"**.

```csharp
// TODO 1: Quan es premi el botó, fes saltar l'ocell
```

- Els trobaràs amb la cerca del teu editor escrivint `TODO`.
- N'hi ha **7**, de l'1 al 7. Els farem **en ordre**.
- Cada un té una **pista** amb el codi quasi escrit.

<!-- Ensenyeu com cercar "TODO" a Visual Studio / Rider. -->

---

# El cor del joc: l'ocell 🐤

**TODO 1 — Saltar** (`Bird.cs`)

Quan premem la tecla, l'ocell ha de pujar.

```csharp
if (Input.GetButtonDown("Jump"))
{
    _rigidbody2D.velocity = Vector2.zero;
    _rigidbody2D.AddForce(Vector2.up * force, ForceMode2D.Impulse);
}
```

<!-- "velocity = 0" oblida la caiguda; AddForce dona l'empenta amunt. Proveu Play després de cada TODO. -->

---

# Puntuar i morir

**TODO 2 — Punt** / **TODO 3 — Morir** (`Bird.cs`)

- Si l'ocell toca un objecte amb etiqueta `Point` → suma punt.
- Si toca un amb etiqueta `Obstacle` → s'acaba la partida.

> 💡 Les **etiquetes (tags)** ens diuen "què" és cada objecte.

<!-- Concepte clau: tags + col·lisions. AddPoint() i GameOver() ja existeixen. -->

---

# Les canonades 🟩

**TODO 4 i 5** (`Pipe.cs`)

- **Moure-les** cap a l'esquerra cada fotograma.
- **Esborrar-les** quan surten de la pantalla (per no acumular-ne).

**TODO 6** (`PipeSpawner.cs`)

- **Crear-ne** de noves cada cert temps, a una alçada a l'atzar.

<!-- Aquí apareix Time.deltaTime (moviment igual a tots els ordinadors) i Instantiate (crear còpies). -->

---

# El marcador 🔢

**TODO 7** (`GameManager.cs`)

Cada punt suma 1 i ho ensenyem per pantalla.

```csharp
_score += 1;
scoreText.text = _score.ToString();
```

✅ Amb això... **ja tens un Flappy Bird que funciona!**

<!-- Celebreu-ho. Que tothom el provi i compari puntuacions. -->

---

# Ara et toca a tu 🎮

- Acaba els **7 TODO** en ordre.
- Prova amb ▶️ **Play** després de cada un.
- Guia completa amb el codi: `GUIA.md`.

**Si t'encalles:** llegeix el missatge vermell de la *Console*, revisa les claus `{ }` i el `;`, i aixeca la mà. 🙋

<!-- Volteu per l'aula. Errors típics: falta ; , claus mal tancades, tag mal escrit. -->

---

<!-- _paginate: false -->

# Demà... 🎨

Farem que cada Flappy Bird sigui **diferent**:
dibuixos nous, sons, efectes i més dificultat.

### Bona feina! 👏
