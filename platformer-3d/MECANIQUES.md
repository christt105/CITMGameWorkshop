# 🛠️ Banc de mecàniques extra (Plataformes 3D)

Mecàniques curtes i a punt per **copiar i enganxar** quan els alumnes en demanin el dia 2.
Totes són per a **Godot 4**. Cada una explica on posar-la i com fer-la servir.

> 💡 Truc per crear un objecte nou: crea una escena nova, posa-hi el node que diu cada recepta, afegeix-hi un model de `models/`, i enganxa l'script.

---

## 🏁 1. Bandera de meta (guanyar)

**Objectiu:** quan el jugador toca la bandera, guanya.

1. Crea una escena amb un node arrel **`Area3D`**, posa-hi a dins el model `models/flag.glb` i un `CollisionShape3D`.
2. Connecta el senyal `body_entered` de l'Area3D al seu propi script.
3. Script:

```gdscript
extends Area3D

func _on_body_entered(body):
    if body.has_method("collect_coin"):   # és el jugador
        print("Has guanyat! 🏁")
        get_tree().paused = true          # atura el joc
        # (opcional) carregar una escena de victòria:
        # get_tree().change_scene_to_file("res://scenes/victoria.tscn")
```

---

## ↔️ 2. Plataforma mòbil

**Objectiu:** una plataforma que va i ve.

Posa aquest script a una plataforma (node `Node3D`):

```gdscript
extends Node3D

@export var distancia := 4.0   # quant es mou
@export var velocitat := 2.0   # com de ràpid

var inici: Vector3
var temps := 0.0

func _ready():
    inici = position

func _process(delta):
    temps += delta * velocitat
    position.x = inici.x + sin(temps) * distancia   # canvia .x per .z o .y per moure-la en una altra direcció
```

---

## ⬆️ 3. Molla / plataforma de salt

**Objectiu:** llançar el jugador molt amunt en trepitjar-la.

Node `Area3D` amb el senyal `body_entered` connectat:

```gdscript
extends Area3D

@export var forca := 18.0

func _on_body_entered(body):
    if body.has_method("collect_coin"):   # és el jugador
        body.gravity = -forca             # empenta cap amunt
        Audio.play("res://sounds/jump.ogg")
```

---

## ☠️ 4. Zona de perill (pinxos, lava...)

**Objectiu:** si el jugador la toca, reinicia el nivell.

Node `Area3D` amb `body_entered` connectat:

```gdscript
extends Area3D

func _on_body_entered(body):
    if body.has_method("collect_coin"):   # és el jugador
        get_tree().reload_current_scene()
```

> El joc ja reinicia quan caus al buit (`position.y < -10` a `player.gd`). Això és el mateix però amb una zona que tu poses.

---

## 🚩 5. Punt de control (checkpoint)

**Objectiu:** en lloc de tornar al principi, reapareixes a l'últim checkpoint.

A `player.gd`, afegeix una variable i canvia el respawn:

```gdscript
var punt_segur := Vector3.ZERO   # a dalt, amb les altres variables

# dins de _physics_process, on diu "if position.y < -10:"
if position.y < -10:
    position = punt_segur
    velocity = Vector3.ZERO
```

I el checkpoint (Area3D amb `body_entered`):

```gdscript
extends Area3D
func _on_body_entered(body):
    if body.has_method("collect_coin"):
        body.punt_segur = global_position
```

---

## ⚡ 6. Super salt temporal (Power-up)

**Objectiu:** un objecte que, en agafar-lo, fa que el jugador salti molt més alt durant 5 segons.

1. Crea una escena amb un node arrel **`Area3D`**, posa-hi un model (per exemple, una moneda d'un altre color o un cub brillant) i un `CollisionShape3D` amb `Is Trigger`.
2. A `player.gd`, afegeix aquesta funció per activar el súper salt temporitzat:

```gdscript
func activate_super_jump():
    jump_strength *= 1.5                # augmenta la força del salt un 50%
    Audio.play("res://sounds/coin.ogg") # so de confirmació
    await get_tree().create_timer(5.0).timeout
    jump_strength /= 1.5                # torna a la normalitat
```

3. Script de l'objecte Area3D (connectant el senyal `body_entered`):

```gdscript
extends Area3D

func _on_body_entered(body):
    if body.has_method("activate_super_jump"):
        body.activate_super_jump()
        queue_free()                   # esborra el power-up de l'escena
```

---

## 🪙 7. Necessites X monedes per obrir la meta

**Objectiu:** la bandera només deixa guanyar si tens prou monedes.

A l'script de la bandera (recepta 1):

```gdscript
extends Area3D

@export var monedes_necessaries := 5

func _on_body_entered(body):
    if body.has_method("collect_coin"):
        if body.coins >= monedes_necessaries:
            print("Has guanyat! 🏁")
            get_tree().paused = true
        else:
            print("Et falten monedes! Tens ", body.coins, " de ", monedes_necessaries)
```

---

## 🎵 Recordatori: sons i partícules

- Per fer sonar un efecte des de qualsevol script: `Audio.play("res://sounds/coin.ogg")` (ja hi ha `coin`, `jump`, `land`, `fall`, `walking`).
- Les monedes ja tenen partícules d'exemple a `objects/coin.tscn` → copia el node `Particles` per reutilitzar-les.
