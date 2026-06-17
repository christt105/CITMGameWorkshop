---
marp: true
theme: default
paginate: true
header: 'Taller: Crea el teu primer videojoc — CITM·UPC'
---

<!-- _paginate: false -->
<!-- _header: '' -->

# Dia 3 🧱
## Plataformes 3D amb Godot

Canviem de motor i saltem a les 3 dimensions!

<!-- Nou motor, nova manera de pensar. Tranquil·litzeu: molts conceptes són els mateixos. -->

---

# Què farem aquests 2 dies?

- **Dia 3:** programar el personatge → moure's, saltar, **doble salt**, monedes i plataformes que cauen.
- **Dia 4:** **dissenyar el teu propi nivell** i jugar els dels companys. 🎉

<!-- El dia 4 (crear i jugar el dels altres) és el que més va agradar l'any passat. Creeu expectació. -->

---

# Godot vs Unity 🆚

| Unity | Godot |
|------|------|
| GameObjects | **Nodes** |
| Components | Nodes dins de nodes |
| `Update()` | `_physics_process(delta)` |
| C# | **GDScript** (s'assembla a Python) |

> La idea és la mateixa: **objectes** en una **escena** amb **codi**.

<!-- Ancoreu el nou en el que ja saben del Flappy Bird. -->

---

# Obrim el projecte

1. Obre **Godot 4.6**.
2. *Importar* → tria el fitxer `project.godot` de `Platformer3D`.
3. Prem ▶️ **Play**: el personatge encara no es mou. Ho arreglem!

> ⚠️ A Godot la **tabulació** del codi importa molt.

<!-- Avís important: la indentació a GDScript no és estètica, és obligatòria (com Python). -->

---

# Moure el personatge

**TODO A** (`scripts/player.gd`, dins de `handle_controls`)

```gdscript
input.x = Input.get_axis("move_left", "move_right")
input.z = Input.get_axis("move_forward", "move_back")
```

`get_axis` torna **-1, 0 o 1** segons la tecla → sabem cap a on anar.

<!-- WASD/fletxes. La línia rotated() de sota fa que es mogui respecte a la càmera. -->

---

# Saltar... i doble salt! 🦘

**TODO B** (`player.gd`)

```gdscript
if Input.is_action_just_pressed("jump"):
    if jump_single or jump_double:
        jump()
```

Si ens queda salt (de terra **o** a l'aire), saltem. Això dona el **doble salt** gairebé gratis.

<!-- La funció jump() ja està feta. La lògica jump_single/jump_double ja existeix. -->

---

# Monedes 🪙

**TODO C** (`player.gd`) — crear la funció:

```gdscript
func collect_coin():
    coins += 1
    coin_collected.emit(coins)
```

**TODO D** (`hud.gd`) — ensenyar el número:

```gdscript
func _on_coin_collected(coins):
    $Coins.text = str(coins)
```

<!-- IMPORTANT: el senyal ha de ser `signal coin_collected(coins)` i s'ha de connectar Player -> HUD a l'editor (Node > Signals). -->

---

# Plataformes que cauen 😱

**TODO E** (`objects/platform_falling.gd`)

```gdscript
# Dins de _process:
if falling:
    gravity += 25 * delta
    position.y -= gravity * delta

# Dins de _on_body_entered:
falling = true
```

Quan el jugador la trepitja, comença a caure cada cop més ràpid.

<!-- Concepte de "gravetat" simple: cada cop cau una mica més. -->

---

# Ara et toca a tu 🎮

- Completa els **TODO A → E** en ordre.
- Prova amb ▶️ **Play** sovint.
- Guia amb tot el codi: `GUIA.md`.

**Si t'encalles:** mira la finestra *Output*, vigila la **tabulació** i els noms, i aixeca la mà. 🙋

<!-- Error més comú a Godot: indentació. Segon: connectar el senyal de la moneda. -->

---

<!-- _paginate: false -->

# Demà... 🏗️

**Construeixes el teu nivell** i jugem tots als nivells de tothom.

### Ja tens un joc de plataformes! 👏
