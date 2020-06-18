# TalTech-Slides
(Xe)LaTeX template class for presentation slides using Tallinn University of Technology's style (for Overleaf)

----

## Installation/Setup

Go to [overleaf](https://www.overleaf.com) and upload all of the template files:

* [`taltechslides.cls`](./taltechslides.cls)
* [`taltechslidedefinations.tex`](./taltechslidedefinations.tex)
* background images [`ai.jpg`](./ai.jpg) and [`satellite.jpg`](./satellite.jpg) and/or custom images
* project file [`test.tex`](./test.tex) and/or [`test_nonavigation.tex`](./test_nonavigation.tex)

In the overleaf menu, change the compiler to "XeLaTeX".

## Options

### Navigation Icons

By default, the template enables navigation icons in the bottom right hand corner. The navigation icons can be disables by providing `nonavigation` option to the slide class:

`\documentclass[nonavigation]{taltechslides}`

### Section Names on Top Header

In order to display section names on the top header, use `topmenu` option:

`\documentclass[topmenu]{taltechslides}`

### Combining Options

Options can be combined. For example, the following will provide slides with section names on top header and without navigation icons:

`\documentclass[nonavigation,topmenu]{taltechslides}`