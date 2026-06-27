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

<!-- Nou motor, nova manera de pensar. Tranquil·litzeu: molts conceptes són els mateixos del Flappy Bird. -->

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
| `Update()` | `_physics_process()` |
| C# | **GDScript** (s'assembla a Python) |

> La idea és la mateixa: **objectes** en una **escena** amb **codi**.

<!-- Ancoreu el nou en el que ja saben del Flappy Bird. -->

---

# Obrim el projecte

1. Obre **Godot 4.6**.
2. *Importar* → tria el fitxer `project.godot` de `Platformer3D`.
3. Prem ▶️ **Play**: el personatge encara no es mou. Ho arreglem!

> ⚠️ A Godot la **tabulació** del codi importa molt (com a Python).

<!-- Avís important: la indentació a GDScript és obligatòria, no estètica. -->

---

# Com treballarem avui 🤝

- Ho fem **junts**, pas a pas.
- Omplim uns trossos marcats amb **`TODO`** (de l'A a l'F).
- **Si et quedes enrere** → tens la `GUIA.md` amb tot el codi.
- **Si acabes abans** → **reptes extra** al final. 🚀

<!-- Mateix triple ritme que al Flappy: junts / GUIA / reptes. -->

---

# El repte d'avui 🎯

Donarem vida al personatge, peça a peça:

- 🕹️ **A** — moure's amb el teclat.
- 🦘 **B** — **saltar** (i **doble salt**!).
- 🏃 **C** — **córrer (sprint)** amb la tecla Shift.
- 🪙 **D + E** — agafar **monedes** i comptar-les.
- 😱 **F** — **plataformes que cauen** en trepitjar-les.

<!-- Llista de la sessió = TODO A-E en llenguatge normal. Aneu marcant-los a mesura. -->

---

# Conceptes que veurem 💡

- **Input:** com llegim les tecles del jugador.
- **Senyals (signals):** com una part del joc **avisa** una altra (la moneda avisa el marcador).
- **Gravetat:** per què el personatge cau (i com cauen les plataformes).

<!-- Senyals és el concepte nou estrella de Godot. Nomenar-lo en directe quan toqui. -->

---

# Ara, tots junts 🎮

Obrim els scripts i fem els **TODO A → F en ordre**.
Després de cada un... ▶️ **Play**!

> Si t'encalles: vigila la **tabulació**, mira la finestra *Output* i aixeca la mà. 🙋

<!-- Live-coding. Errors típics: indentació i connectar el senyal de la moneda (Node > Signals). -->

---

<!-- _class: invert -->

# 🚀 Reptes extra

Ja tens el personatge complet? Afegeix mecàniques:

- Una **plataforma que es mou** sola.
- Una **molla** que et llança ben amunt.
- **Córrer** més ràpid amb una tecla.

> Demana'm la recepta que vulguis (les tinc preparades). 🛠️

<!-- Receptes a MECANIQUES.md: mòbil, molla, sprint... Doneu-les a qui ho demani. -->

---

<!-- _paginate: false -->

# Demà... 🏗️

**Construeixes el teu nivell** i jugem tots als nivells de tothom.

### Ja tens un joc de plataformes! 👏
