# 🛠️ Funcions extra del Flappy Bird (Dia 2)

Funcions "de veritat" per afegir el **dia 2**, abans de la part de personalització.
El **profe en triarà 1 o 2** i les farem **junts** amb tota la classe (no es deixen per fer en solitari: la programació costa massa per anar pel seu compte). La resta queden aquí per si algú vol provar-ne més. Cada recepta diu **on** va i porta el codi.

> Treballarem sobre la plantilla del **Dia 2** (`FlappyBird-Dia2.zip`) un cop hàgim completat els TODOs inicials.

---

## 🔥 1. Dificultat creixent

Que el joc es faci més difícil com més punts tens.

A `GameManager.cs`, dins de `AddPoint()`, després de sumar el punt:

```csharp
// Cada punt, les canonades apareixen una mica més de pressa (amb un límit)
pipeSpawner.spawnRate = Mathf.Max(0.8f, pipeSpawner.spawnRate - 0.03f);
```

> Variant: en comptes del `spawnRate`, puja la velocitat de les canonades.

---

## 🛡️ 2. Power-up d'escut

Et deixa xocar **una vegada** sense morir.

A `Bird.cs`, afegeix una variable:

```csharp
public bool hasShield = false;
```

A `CheckCollision`, abans de morir per l'`Obstacle`:

```csharp
if (other.CompareTag("Obstacle"))
{
    if (hasShield)
    {
        hasShield = false;   // gasta l'escut i sobreviu
        return;
    }
    _animator.SetTrigger("Dead");
    GameManager.Instance.GameOver();
}
```

Per aconseguir-lo: un objecte amb tag `Shield` que, en tocar-lo, faci `hasShield = true`.

---

## 🐢 3. Mode lent (bullet time)

Una tecla que alenteix el temps un moment.

A `Bird.cs` (o on vulguis), dins d'`Update`/`LateUpdate`:

```csharp
if (Input.GetKeyDown(KeyCode.LeftShift))
    StartCoroutine(SlowMotion());
```

I la corutina:

```csharp
private System.Collections.IEnumerator SlowMotion()
{
    Time.timeScale = 0.4f;
    yield return new WaitForSecondsRealtime(1.5f);
    Time.timeScale = 1f;
}
```

---

## 🪙 4. Monedes (punts extra)

Objectes que donen punts si els agafes.

1. Crea un objecte amb un `Collider2D` marcat com a *Trigger* i tag `Coin`.
2. A `Bird.cs`, dins de `CheckCollision`:

```csharp
if (other.CompareTag("Coin"))
{
    GameManager.Instance.AddPoint();   // o un mètode que sumi més punts
    Destroy(other.gameObject);
}
```

---

## 🏅 5. Medalles al final

Mostra una medalla segons la puntuació quan perds.

A `GameManager.cs`, dins de `GameOver()`:

```csharp
string medalla;
if (_score >= 30)      medalla = "OR 🥇";
else if (_score >= 15) medalla = "PLATA 🥈";
else if (_score >= 5)  medalla = "BRONZE 🥉";
else                   medalla = "Segueix provant!";
// Ensenya 'medalla' en un Text de la pantalla de Game Over
```

---

## 🌄 6. Fons amb moviment (parallax)

Un fons que es mou lentament per donar sensació de profunditat.

Posa aquest script al fons:

```csharp
using UnityEngine;

public class Parallax : MonoBehaviour
{
    public float speed = 0.5f;

    void Update()
    {
        if (GameManager.Instance.state == GameManager.State.Playing)
            transform.position += Vector3.left * (speed * Time.deltaTime);
    }
}
```

> Truc: posa dues còpies del fons seguides i fes-les tornar enrere quan surten, com fa `Ground.cs`.

---

## ✨ 7. Juice (que "senti" bé)

- **Partícules** quan sumes un punt (afegeix un `ParticleSystem` i fes `Play()` a `AddPoint`).
- **So** al saltar, puntuar i xocar (`AudioSource.PlayOneShot(...)`).
- **Petita sacsejada** de càmera en morir.

> El "juice" són els detallets que fan que el mateix joc sembli molt millor. Animeu-los a provar-ho!
