# Presentación — Economía Digital y Comercio Electrónico

Presentación en [Reveal.js](https://revealjs.com/) para la exposición del
proyecto de **Introducción a la Economía** (Grupo 16, semestre 2027-1).

**Basada en el documento del Equipo 3** (`Economia Digital y Comercio Electronico_IE_Equipo3.pdf`).

## Contenido

| Archivo | Descripción |
|---|---|
| `index.html` | La presentación completa (35 diapositivas). No requiere compilación. |
| `NOTAS-EXPOSITOR.md` | Guion de exposición con tiempo por sección, qué decir en cada diapositiva, recortes sugeridos y preguntas de respaldo. |
| `img/` | Las tres figuras del proyecto + logos UNAM/FI (copiadas de `Proyecto/img/`). |

Las **notas del expositor ya están incrustadas en `index.html`** (`<aside class="notes">`),
así que la tecla `S` funciona sin ningún archivo adicional. `NOTAS-EXPOSITOR.md`
es la versión imprimible con los minutos asignados.

## Estructura (35 diapositivas)

| # | Sección | Diapositivas |
|---|---|---|
| — | Apertura y pregunta motriz | 1–2 |
| 1 | ¿Qué es el comercio electrónico y cómo se mide? | 3–7 |
| 2 | Determinantes microeconómicos | 8–12 |
| 3 | Mercados de dos lados y Teoría de la Agregación | 13–20 |
| 4 | Fijación algorítmica de precios y política monetaria | 21–23 |
| 5 | La respuesta del Estado mexicano | 24–29 |
| 6 | Limitaciones y debate abierto | 30–33 |
| — | Conclusiones y cierre | 34–35 |

## Verificar en local

```bash
cd "10 Projects/11 Facultad/2027-1/Introduccion_a_la_Economia/Proyecto/Presentacion"
python3 -m http.server 8000
# abrir http://localhost:8000
```

Un servidor local no es obligatorio (el HTML abre con doble clic), pero evita
las restricciones de `file://` en algunos navegadores.

### Atajos de teclado

| Tecla | Acción |
|---|---|
| `→` `←` | Avanzar / retroceder |
| `S` | Panel de notas del presentador |
| `O` | Vista general de todas las diapositivas |
| `F` | Pantalla completa |
| `B` | Ennegrecer la pantalla |
| `Esc` | Salir de pantalla completa / vista general |

## Publicar en GitHub Pages

**Ya está publicado en:**

### https://zums-stuff.github.io/economia-digital-IE-2027-1/

El deck vive en el repo público [`zums-stuff/economia-digital-IE-2027-1`](https://github.com/zums-stuff/economia-digital-IE-2027-1),
servido por GitHub Pages desde la rama `main`, raíz `/`.

> Nota: la presentación **no** se publica desde el vault `Obsidian-Brain` (que es
> privado y en el plan actual no admite Pages). Se mantiene como repo aparte
> para que la URL sea pública y accesible para exponer.

### Publicar cambios

Hay un script que hace todo (add + commit + push) desde esta carpeta:

```bash
./publicar.sh            # sube los cambios
./publicar.sh --check    # sólo dice si hay cambios pendientes
```

GitHub Pages tarda ~1 minuto en reflejar los cambios.

### Deshacer / revertir

```bash
git log --oneline          # ver historial
git revert <commit>        # revertir un commit concreto
./publicar.sh              # publicar la reversión
```

## Notas técnicas

- reveal.js **5.1.0** vía CDN de jsDelivr; no hay `node_modules` ni build.
  Para uso totalmente offline, descargar reveal.js a `reveal/` y cambiar las
  cuatro rutas `<link>`/`<script>` en `index.html`.
- Plugins cargados: `notes` (notas del presentador) y `highlight`.
- `hash: true` — la URL guarda la diapositiva, así que se puede enlazar
  directamente a una en particular (`index.html#/12`).
- Formato 1280×720 (16:9) con escalado automático a cualquier pantalla.
- El fondo azul de los divisores de sección usa `data-background-color`
  nativo de Reveal, no CSS propio.

### Diagramas SVG

Las 23 diapositivas con visualización usan **SVG nativo embebido en el HTML**
(sin imágenes externas): se ven nítidas a cualquier resolución y se editan
con un editor de texto.

Dos reglas del DOM que conviene respetar al editar un `<svg>`:

1. **Nunca usar `<sub>` / `<sup>` dentro de `<text>`.** Son etiquetas HTML y
   rompen el parser del SVG: el elemento se cierra antes de tiempo y el resto
   del diagrama se apila fuera de la caja. Usar
   `<tspan baseline-shift="sub" font-size="0.75em">b</tspan>`.
2. **El `fill` de un `<text>` va en una clase, no como atributo.** En SVG,
   `fill="#fff"` es una *presentation attribute* y cualquier regla CSS con
   `fill` la pisa — el texto quedaba invisible sobre fondos oscuros. Las
   clases de color son `.dg-tiny.w` (blanco), `.b` (azul), `.r` (rojo),
   `.g` (verde), `.y` (dorado), combinables con `.dg-label` / `.dg-sub`.

Además, el CSS fuerza `display: flex` en las diapositivas (para que el
contenido llene la pantalla). Por eso la regla de flex excluye al SVG:

```css
.reveal .slides section > *:not(svg) { flex: 0 0 auto; }
.reveal .slides svg.diagram { flex: 1 1 auto; align-self: stretch; }
```

## Figuras

`img/` contiene las mismas figuras que usa el documento LaTeX, por lo que no
hay que regenerarlas:

- `fig-vabcoel.png` — evolución del VABCOEL 2013–2024 y composición sectorial
- `fig-agregacion.png` — cadena de valor, plataforma vs. agregador, tres niveles
- `fig-cofece-meli.png` — concentración del 85% y ecosistema de Mercado Libre

El PDF del Equipo 3 ya no incluye la figura `fig-amazon-efecto.png` (el
contenido de Cavallo se presenta en diagrama y tarjetas), por eso no se copia aquí.
