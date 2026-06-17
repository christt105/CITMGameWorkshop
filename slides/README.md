# 🎞️ Presentacions del taller

Una presentació per dia, en català, fetes amb [Marp](https://marp.app/) (Markdown → slides).

> **Web publicada:** https://christt105.github.io/CITMGameWorkshop/
> Cada `git push` que toqui `slides/` reconstrueix i actualitza la web automàticament (GitHub Actions → Pages).

Les slides mostren **el què i el perquè** (objectiu, concepte i el repte del dia). El **codi de la solució no surt a les slides** a posta: es fa en directe a classe. Qui s'encalla té el codi a les `GUIA.md` de cada joc; qui va ràpid té els **reptes extra** de cada presentació.

| Dia | Tema | Font |
|----|------|------|
| 1 | Flappy Bird — muntar el joc | `dia-1-flappy-bird.md` |
| 2 | Flappy Bird — personalitzar | `dia-2-flappy-bird.md` |
| 3 | Plataformes 3D — mecàniques | `dia-3-platformer.md` |
| 4 | Plataformes 3D — crear nivells | `dia-4-platformer.md` |

Cada `.md` és alhora **les diapositives** i **les notes del professor** (els comentaris `<!-- ... -->` són notes de presentador). `index.html` és la portada de la web.

## Veure-les en local
- Instal·la l'extensió **"Marp for VS Code"** i obre el `.md` (vista prèvia + mode presentador amb notes).
- O construeix l'HTML: `npx @marp-team/marp-cli@latest slides/dia-1-flappy-bird.md -o dia-1.html --html`

## Exportar a PDF o PowerPoint
Necessites un navegador (Chrome/Edge/Firefox) instal·lat:

```bash
npx @marp-team/marp-cli@latest slides/dia-1-flappy-bird.md -o dia-1.pdf  --pdf  --allow-local-files
npx @marp-team/marp-cli@latest slides/dia-1-flappy-bird.md -o dia-1.pptx --pptx --allow-local-files
```

## Editar
Edita el `.md` directament. Les diapositives se separen amb `---`. En fer `push` a `main`, la web s'actualitza sola.
