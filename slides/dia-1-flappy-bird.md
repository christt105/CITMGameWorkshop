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

> El joc ja està quasi fet. Avui el completem **junts**, pas a pas.

<!-- Expliqueu el format: no s'escriu tot de zero, completem peces concretes. Ho fem en directe tots alhora. -->

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

# Com treballarem avui 🤝

- Ho fem **junts**, pas a pas. Jo ho faig i tu em segueixes.
- Anem omplint uns trossos marcats amb **`TODO`** (de l'1 al 7).
- **Si et quedes enrere** → tens la `GUIA.md` amb tot el codi. No pateixis.
- **Si acabes abans** → tens **reptes extra** al final. 🚀

<!-- Deixeu clar el triple ritme: junts / GUIA per als que es despengen / reptes per als ràpids. -->

---

# El repte d'avui 🎯

Farem que el joc cobri vida, peça a peça:

1. 🐤 L'ocell **salta** quan premem.
2. ⭐ **Sumar un punt** en passar una canonada.
3. 💥 **Morir** en xocar.
4. 🟩 Les canonades **es mouen** i desapareixen.
5. ➕ Apareixen **canonades noves** soles.
6. 🔢 El **marcador** compta.

<!-- Aquesta és la llista de la sessió = els 7 TODO en llenguatge normal. Aneu marcant-los a mesura que els feu. -->

---

# Conceptes que veurem 💡

- **Física:** per què l'ocell cau i com el fem saltar.
- **Etiquetes (tags):** com sap el joc què és cada cosa (`Point`, `Obstacle`).
- **Temps:** moure coses igual de ràpid a tots els ordinadors.
- **Crear i destruir** objectes mentre juguem.

<!-- No cal aprofundir: nomenar-los mentre apareixen al codi en directe. -->

---

# Ara, tots junts 🎮

Obrim els scripts i anem fent els **TODO en ordre**.
Després de cada un... ▶️ **Play** per veure el canvi!

> Si t'encalles: mira la `GUIA.md`, llegeix el missatge vermell de la *Console* i aixeca la mà. 🙋

<!-- Aquí comença el live-coding. Ritme tranquil, comprovant que ningú es queda enrere. -->

---

<!-- _class: invert -->

# 🚀 Reptes extra

Has acabat els 7 TODO? Prova això:

- Fes que les canonades vagin **més ràpides** com més punts tens.
- Fes sonar un **so** quan l'ocell salta.
- Canvia el **dibuix** de l'ocell o el fons.
- Inventa: què faria el teu joc **diferent**?

<!-- Per als ràpids. Són un tast del dia 2. No cal solució a la slide: que experimentin (GUIA i Inspector). -->

---

<!-- _paginate: false -->

# Demà... 🎨

Farem que cada Flappy Bird sigui **diferent**:
dibuixos nous, sons, efectes i més dificultat.

### Bona feina! 👏
