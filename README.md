# Thesis template for Aarhus University

This folder has a template project to use for writing your thesis using LaTeX.  

As soon as the project date has been set as described in the date section below, the project should
work out of the box in both Overleaf and natively on linux using mktex with texlive-full installed.  

## Usage

Just clone the project, fill out the title, subtitle, etc in main.tex and start typing.
Alternatively, you can just download the au-thesis.cls file and use that in your project.  

## Multiple authors and co-supervisor

Currently the project doesn't support multiple authors or projects without a co-supervisor without
editing the .cls file. If you fix this, please upload it and delete this heading.

## Specifics

This sections details a few configuration elements that might be of interest.

### Structure

The project is structured as follows:  

- __appendices__:   .tex files for all appendices. Must be included in main.tex  
- __chapters__:     .tex files for all chapters - can be replaced by a folder for long chapters.
                    Must be included in the main.tex file.  
- __figures__:      Figures used directly in main. Will most likely just be the seal. See section
                    on figures.  
- __frontmatter__:  .tex files for frontmatter (i.e. introduction, acknowledgements, etc.)  
- _au-thesis.cls_:  The latex class for formatting - Also holds the definition of the custom title
                    page.  
- _main.tex_:       The main file for the overall structure of the document
- _README.md_:      This file
- _references.bib_: The bibtex file for the project.

### Date

The date of the project is saves as a datetime variable called date. The day, month, and year must
be set in the main.tex before the document compiles.

### Figures

This template is currently setup to automatically look for figures in a figures folder located in
the same directory as the .tex file that contains the \includegraphics command. If you wish not to
use this setup, comment out the following lines from the _au-thesis.cls_ file:  

    ``` latex
    % save the meaning of \includegraphics
    \LetLtxMacro\latexincludegraphics\includegraphics
    % redefine \includegraphics to refer to the subfolder Figures
    \renewcommand{\includegraphics}[2][ ]{\latexincludegraphics[#1]{figures/#2}}
    ```

### Title page

The title page of the project is customized in the final section of the au-thesis.cls file, using
the titling package. This package works by defining pre- and post- hooks for each title element
(i.e. author, date, etc.) as well as hooks a-d for the sections in-between.
All title page elements should be set using the corresponding commands in the main.tex file, but if
one wishes to alter the layout, read the documentation for the titling package and edit the 
_au-thesis.cls_ file accordingly.

### Hyperref

_au-thesis.cls_ automatically sets the pdf parameters like title and author based on the commands
in the main file using hyperref, and disables the red boxes around hyperlinks.
