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

El deck es estático y no tiene build step: se sube tal cual.

```bash
cd Presentacion
git init
git add .
git commit -m "Presentación: Economía Digital y Comercio Electrónico"
git branch -M main
git remote add origin https://github.com/<usuario>/<repo>.git
git push -u origin main
```

Luego en el repo: **Settings → Pages → Source: Deploy from a branch →
`main` / `(root)`**. La URL queda en
`https://<usuario>.github.io/<repo>/`.

Si se prefiere una subcarpeta en un repo existente, basta con copiar
`index.html` e `img/` a la raíz (o a la carpeta donde apunte Pages).

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
- Las clases CSS `.badge` (número circular) y `td.num` (celda numérica) están
  separadas a propósito: una regla `.num` compartida producía celdas de tabla
  de 19 px de ancho.

## Figuras

`img/` contiene las mismas figuras que usa el documento LaTeX, por lo que no
hay que regenerarlas:

- `fig-vabcoel.png` — evolución del VABCOEL 2013–2024 y composición sectorial
- `fig-agregacion.png` — cadena de valor, plataforma vs. agregador, tres niveles
- `fig-cofece-meli.png` — concentración del 85% y ecosistema de Mercado Libre

El PDF del Equipo 3 ya no incluye la figura `fig-amazon-efecto.png` (el
contenido de Cavallo se presenta en texto y tarjetas), por eso no se copia aquí.
