# 🎞️ Presentacions del taller

Una presentació per dia, en català, fetes amb [Marp](https://marp.app/) (Markdown → slides).
Cada fitxer `.md` és alhora **les diapositives** i **les notes del professor** (els comentaris `<!-- ... -->` són notes de presentador).

| Dia | Tema | Font | Exportat |
|----|------|------|----------|
| 1 | Flappy Bird — muntar el joc | `dia-1-flappy-bird.md` | `export/dia-1-flappy-bird.html` |
| 2 | Flappy Bird — personalitzar | `dia-2-flappy-bird.md` | `export/dia-2-flappy-bird.html` |
| 3 | Plataformes 3D — mecàniques | `dia-3-platformer.md` | `export/dia-3-platformer.html` |
| 4 | Plataformes 3D — crear nivells | `dia-4-platformer.md` | `export/dia-4-platformer.html` |

> Hi ha també una presentació **d'introducció** general (Google Slides) enllaçada al README principal.

## Veure-les
- Obre qualsevol `export/*.html` al navegador i prem **F** per pantalla completa.
- O instal·la l'extensió **"Marp for VS Code"** i obre el `.md` (vista prèvia + presentador amb notes).

## Exportar a PDF o PowerPoint
Necessites un navegador (Chrome/Edge/Firefox) instal·lat:

```bash
# PDF
npx @marp-team/marp-cli@latest slides/dia-1-flappy-bird.md -o dia-1.pdf --pdf --allow-local-files
# PowerPoint (editable amb LibreOffice/Office)
npx @marp-team/marp-cli@latest slides/dia-1-flappy-bird.md -o dia-1.pptx --pptx --allow-local-files
```

## Editar
Edita el `.md` directament. Les diapositives se separen amb `---`.
Si vols passar el contingut a Google Slides, copia el text de cada diapositiva.
