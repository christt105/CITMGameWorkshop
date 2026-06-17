# 🧱 Guia del Plataformes 3D (Godot)

En aquests **2 dies** faràs un joc de plataformes en 3D amb **Godot 4**.
Primer faràs que el personatge es mogui i salti, i després **dissenyaràs el teu propi nivell** per jugar-lo amb els companys.

> 💡 Igual que al Flappy Bird, el projecte ja està quasi fet. Has d'omplir uns quants **`TODO`** al codi. Cada `TODO` té una pista.

---

## Què faràs

- **Dia 1 (Godot):** entendre Godot i programar el personatge → moure's, saltar, **doble salt**, agafar monedes i plataformes que cauen.
- **Dia 2:** **dissenyar el teu nivell** (col·locar plataformes, monedes, la bandera de meta) i jugar els nivells dels companys. 🎉

---

## Abans de començar

1. Obre **Godot 4.6** i importa el projecte de la carpeta `Platformer3D` (tria el fitxer `project.godot`).
2. A dalt a la dreta prem ▶️ **Play** per provar. El personatge encara no es mou: ho arreglarem!
3. Els scripts són a les carpetes `scripts/` i `objects/`. Fes doble clic per obrir-los.

> 🆚 **Godot vs Unity:** a Unity tot són *GameObjects* amb *components*. A Godot tot són **nodes** dins d'una **escena**. `_physics_process(delta)` és com l'`Update` de Unity, però per al moviment.

---

## DIA 1 — Programem el personatge

### 🟢 TODO A — Moure el personatge  (`scripts/player.gd`)

Busca `# TODO: Agafa el Input del jugador` dins de `handle_controls`. Llegim les tecles WASD / fletxes:

```gdscript
input.x = Input.get_axis("move_left", "move_right")
input.z = Input.get_axis("move_forward", "move_back")
```

**Què fa?** `get_axis` torna -1, 0 o 1 segons quina tecla premis. Així sabem cap a on vol anar el jugador. (La línia de sota, `input.rotated(...)`, fa que es mogui respecte a on mira la càmera.)

### 🟢 TODO B — Saltar i doble salt  (`scripts/player.gd`)

Busca `# TODO: Si s'apreta el botó de saltar...` (també dins de `handle_controls`):

```gdscript
if Input.is_action_just_pressed("jump"):
    if jump_single or jump_double:
        jump()
```

**Què fa?** Si premem saltar i encara ens queda salt (de terra `jump_single` o a l'aire `jump_double`), cridem la funció `jump()`, que ja està feta. Això dona el **doble salt** gratis! 🦘

### 🟢 TODO C — Agafar monedes  (`scripts/player.gd`)

Al final de l'script hi ha `# TODO: Crea la funció collect_coin()`. Escriu la funció nova:

```gdscript
func collect_coin():
    coins += 1
    coin_collected.emit(coins)
```

**Important:** perquè el comptador rebi el número, comprova que a dalt de tot de l'script el senyal estigui declarat amb el paràmetre:

```gdscript
signal coin_collected(coins)
```

### 🟢 TODO D — El comptador de monedes  (`scripts/hud.gd`)

Busca `# TODO: Actualitza el número de monedes`:

```gdscript
func _on_coin_collected(coins):
    $Coins.text = str(coins)
```

**Connectar el senyal (es fa a l'editor, una sola vegada):**
1. A l'escena `main`, selecciona el node **Player**.
2. Pestanya **Node → Signals** (a la dreta).
3. Fes doble clic a `coin_collected` i connecta'l al node **HUD**, mètode `_on_coin_collected`.

Ara, en agafar una moneda, el número pujarà. 🪙

### 🟢 TODO E — Plataformes que cauen  (`objects/platform_falling.gd`)

Aquesta plataforma cau quan el jugador la trepitja.

1. Busca `# TODO: Fes que caigui` dins de `_process` i posa:

```gdscript
if falling:
    gravity += 25 * delta
    position.y -= gravity * delta
```

2. Busca `# TODO: al jugador fer col·lisió, activa el falling` dins de `_on_body_entered` i posa:

```gdscript
falling = true
```

**Què fa?** Quan el jugador la toca, `falling` es posa a cert i la plataforma comença a caure cada cop més ràpid (gravetat). 😱

✅ **Felicitats!** Ja tens un joc de plataformes amb moviment, doble salt, monedes i plataformes que cauen.

---

## DIA 2 — Dissenya el teu nivell 🎨

Avui el protagonista ets tu: construeix el teu nivell i després jugarem els de tothom.

### Col·locar coses al nivell
1. A la finestra **Scene** (esquerra), busca un objecte que ja existeixi (per exemple una `platform`).
2. Selecciona'l i prem **Ctrl+D** per **duplicar-lo**.
3. Mou-lo amb les **fletxes de colors** (vermell = X, verd = Y/amunt, blau = Z).
4. Repeteix per construir el teu recorregut: plataformes, monedes, núvols, plataformes que cauen...

### Posa una **meta** 🏁
- A la carpeta `models/` hi ha `flag.glb` (una bandera). Arrossega-la a l'escena al final del recorregut perquè sigui l'objectiu.
- Demana al profe la mecànica de "tocar la bandera = guanyar" (mira el [[Banc de mecaniques extra del platformer - m7n8b2]]).

### Idees per al teu nivell
- Camí de plataformes que cauen (has d'anar ràpid!).
- Monedes amagades en llocs difícils.
- Salts que necessiten el **doble salt** sí o sí.
- Plataformes mòbils, molles que et llancen amunt, zones de perill... (mira el banc de mecàniques).

> 🏆 Al final intercanviarem els projectes i jugarem els nivells dels companys. Fes-lo divertit però possible!

---

## Si et quedes encallat/da

1. Mira la finestra **Output** / **Debugger** a baix: et diu l'error i la línia.
2. A Godot la **sagnia (tabulació)** importa molt: el codi dins d'un `if` o `func` ha d'anar tabulat.
3. Comprova que has escrit els noms igual (`coin_collected`, `jump`, `falling`...).
4. Pregunta al professor 🙋
