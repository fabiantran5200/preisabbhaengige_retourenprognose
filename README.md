# About
This repository contains a template for Otto corporate research with LaTeX in order to improve quality and make the writing process more efficient.
The template provides a backbone both for transfer modules (_"Transferleistungen"_) and bachelor theses.

## How to use
1. Create a branch with the research title by using one of the following naming schemes: 
  * for transfer modules: `<OCN-Username>-tl<Transfer module number>-<Team>`
  * for bachelor theses: `<OCN-Username>-bt-<Team>`
2. Clone the repo and checkout your previously created branch

In a shell:

```bash
 git clone git@github.com:otto-ec/azubis_transferleistung.git # Requires a working SSH key
 cd azubis_transferleistung
 git checkout -b <branch name (see above)>
```

## Required software/tools
- Visual Studio Code with the LaTeX workshop extension (-> https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- MiKTeX (-> https://miktex.org/download) //Should not be necessary if Docker is used, please test
- Perl, usually already installed in most operating systems except for Windows //Should not be necessary if Docker is used, please test
- Docker, make sure to have Docker installed and running in the background for building the project

## Some tips
- Starting with the third chapter (meaning the second chapter after the introduction), use `{\let\clearpage\relax \chapter{Chapter name}}` to start new chapters. This will stop LaTeX from starting every new chapter on a new page.
- Use `\smallskip` at the end of paragraphs instead of leaving empty lines between them to create a small gap between the paragraph and the one coming after it.
- Don't include the file "EidesstattlicheErklaerung.tex" in a transfer module as it needs to be handed in separately.

## Please note:
Every branch represents a research. Thus, __do not merge your research branch into the main branch!__

## Development
In order to improve the template feel free to create a feature branch and merge it into master at any time.
Just make sure that this change is useful for all corporate students, otherwise just leave the changes on your local branch without pushing them.
