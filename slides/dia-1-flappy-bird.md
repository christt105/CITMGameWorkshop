---
marp: true
theme: default
paginate: true
header: 'Taller: Crea el teu primer videojoc — CITM·UPC'
style: |
  section {
    background-color: #f7f5f0;
    color: #292524;
    font-family: system-ui, -apple-system, sans-serif;
    padding: 40px 60px;
  }
  h1 {
    color: #1c1917;
    border-bottom: 2px solid #e7e5e4;
    padding-bottom: 12px;
  }
  h2, h3 {
    color: #1c1917;
  }
  strong {
    color: #4f46e5;
  }
  a {
    color: #4f46e5;
  }
  code {
    background-color: #e7e5e4;
    color: #b91c1c;
    border-radius: 6px;
    padding: 2px 8px;
  }
  blockquote {
    background: #f5f5f4;
    border-left: 6px solid #4f46e5;
    color: #44403c;
    border-radius: 0 12px 12px 0;
    padding: 10px 20px;
  }
  footer, header {
    color: #78716c;
  }
---

<!-- _paginate: false -->
<!-- _header: '' -->

# Dia 1 🐦
## Flappy Bird amb Unity

Avui farem el nostre primer joc... i funcionarà de veritat!

<!-- Benvinguda. Recordeu: cap pregunta és estúpida. Avui sortireu amb un joc jugable. -->

---

# Què farem aquests 2 dies?

- **Dia 1:** Crear el joc des de zero → programarem el salt de l'ocell, el moviment de les canonades i la creació d'obstacles.
- **Dia 2:** Plantilla + Personalitzar-lo → usarem la plantilla completa per repassar amb TODOs, afegir-hi funcions extra i canviar dibuixos i sons.

> Avui crearem els nostres propis scripts des de zero!

<!-- Expliqueu el format: avui programem els scripts bàsics en blanc per entendre com funciona tot. -->

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

- Crearem els scripts nosaltres mateixos des de zero.
- Anirem escrivint el codi pas a pas i ho posarem en comú.
- **Si et quedes enrere** → recorda que tens la `Guia Flappy Bird` a la web amb tot el codi. No pateixis.
- **Si acabes abans** → pots començar a dissenyar sprites o provar reptes extra. 🚀

<!-- Aprenentatge actiu: anar escrivint a la pissarra/projector i que ells repliquin, explicant cada línia (AddForce, velocity, deltaTime...). -->

---

# El repte d'avui 🎯

Farem que el joc cobri vida, pas a pas:

1. 🐤 L'ocell **salta** quan premem la barra espaiadora.
2. 🟩 Les canonades **es mouen** cap a l'esquerra i **desapareixen** al final.
3. ➕ Les canonades **apareixen soles** cada cert temps a alçades a l'atzar.

<!-- Aquesta és la llista de la sessió. Primer farem el salt, després el moviment i destrucció de canonades, i finalment el generador automàtic. -->

---

# Conceptes que veurem 💡

- **Física:** per què l'ocell cau i com el fem saltar.
- **Etiquetes (tags):** com sap el joc què és cada cosa (`Point`, `Obstacle`).
- **Temps:** moure coses igual de ràpid a tots els ordinadors.
- **Crear i destruir** objectes mentre juguem.

<!-- No cal aprofundir: nomenar-los mentre apareixen al codi en directe. -->

---

# Ara, tots junts 🎮

Crearem els fitxers a `Assets/Scripts` i programarem junts pas a pas:
1. `Bird.cs` (el salt de l'ocell)
2. `Pipe.cs` (moviment i destruir canonades)
3. `PipeSpawner.cs` (creació infinita a alçades a l'atzar)

> Si t'encalles: consulta la guia de la web, llegeix el missatge vermell de la *Console* i aixeca la mà. 🙋

<!-- Aquí comença el live-coding. Ritme molt tranquil, explicant bé on va cada script i com s'assigna als GameObjects. -->

---

<!-- _class: invert -->

# 🚀 Reptes extra

Has acabat de programar-ho tot? Prova això:

- Fes sonar un **so** quan l'ocell salta.
- Canvia el **dibuix** de l'ocell o el fons a l'editor d'Unity.
- Inventa: què faria el teu joc **diferent**?

<!-- Per als ràpids. No cal solució a la slide: que experimentin amb l'Inspector o afegint recursos. -->

---

<!-- _paginate: false -->

# Demà... 🎨

Farem que cada Flappy Bird sigui **diferent**:
dibuixos nous, sons, efectes i més dificultat.

### Bona feina! 👏
