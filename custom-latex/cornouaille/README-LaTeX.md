# Documentation for the Cornouaille LaTeX Setup

This document provides a brief overview of the custom LaTeX class and style files found in this directory. These files are designed to facilitate the creation of documents, particularly for mathematics education, with a consistent style.

## Core Files: `cornouaille.cls` and `cornouaille.sty`

### `cornouaille.cls` - The Document Class

*   **Purpose**: This is the main document class you should use to start your documents.
    Example: `\documentclass{cornouaille}`
*   **Base**: It is based on the standard LaTeX `article` class.
*   **Page Layout**: It configures the page dimensions (A4 paper, specific text width and height) using the `geometry` package.
*   **Core Styling**: For most specific functionalities, package loading, and custom commands, `cornouaille.cls` loads the `cornouaille.sty` style package.

### `cornouaille.sty` - The Core Style Package

*   **Purpose**: This package is loaded by `cornouaille.cls` and contains the majority of the custom setup. It can also, in theory, be used with other document classes if you want to apply the Cornouaille styling.
*   **Key Packages Loaded**:
    *   **Language**: `polyglossia` for French language support.
    *   **Fonts**: `fontspec` for using OpenType fonts, with `fourier-otf` (Fourier OpenType) as the primary document font.
    *   **Mathematics**: `amsmath` and `mathtools` for advanced mathematical typesetting. Various custom math helper commands are defined in `dcmaths.sty` (see below).
    *   **Graphics**: Support for both PSTricks (various `pst-*` packages) and TikZ (via `dctikz.sty`).
    *   **Other Utilities**: `enumitem` for list customization, `eurosym` for the euro symbol, `numprint` for number formatting, `colortbl` for colored tables, `multicol` for multi-column text, `hyperref` for PDF links and metadata, and more.
    *   **Custom Styles**: It also loads other specific style files from this collection, such as `apmep.sty`, `dcmaths.sty`, `dccornouaille.sty`, `dctikz.sty`, and `dccours.sty`.


## Key Supporting Style Files

The `cornouaille.sty` package loads several other custom style files to provide specific functionalities:

*   **`dccornouaille.sty`**:
    *   This is a crucial style file that defines major structural elements and environments.
    *   It provides the `\cornouaille` command, typically used at the start of a document to create a title block with fields for Name, Class, Title, etc., and includes the school logo.
    *   It also defines environments for exercises (`exercice` environment and `\exo` command) and their solutions (`solution` environment).
    *   Includes sophisticated mechanisms for generating an automated grading table (`\Bareme` command) and for collecting and printing all solutions at the end of a document (especially for exams/DS, using `\dscornouaille` command).
    *   Loads `dctexte.sty` for further text-related definitions.

*   **`dcmaths.sty`**:
    *   Provides a collection of custom LaTeX commands and shortcuts for mathematical notation, building upon `amsmath` and `mathtools`.
    *   Examples include commands for vectors, limits, absolute values, norms, systems of equations, etc.

*   **`dccours.sty`**:
    *   (Assumed Purpose) This file likely contains specific styling, environments, or commands tailored for typesetting course notes or lecture materials. (Its exact contents were not deeply analyzed in the last review, but it's loaded by the main `cornouaille.sty`).

*   **`dctikz.sty`**:
    *   This package is dedicated to TikZ settings and custom commands. It's used for creating high-quality vector graphics directly within LaTeX.

*   **`dctexte.sty`**:
    *   (Loaded by `dccornouaille.sty`) Likely provides general text formatting utilities, custom text environments, or macros.

*   **`apmep.sty`**:
    *   Contains styles and commands often used in documents related to APMEP (Association des Professeurs de Mathématiques de l'Enseignement Public).
    *   Notably, it defines the `\vect{}` command for typesetting vectors with an arrow accent and optional coordinates.
    *   It also provides common shortcuts for mathematical symbols and sets (e.g., `\R` for ℝ, `\pg` for ≥).

*   **`fexo.sty`**:
    *   (Assumed Purpose) This package likely provides specific environments or commands for formatting exercises, possibly complementing or extending those in `dccornouaille.sty`.

*   **`sesatikz.sty`**:
    *   Likely provides TikZ functionalities or styles related to Sésamath resources.

*   **`tkz-tab.sty`**:
    *   For creating tables of variation and sign tables, commonly used in mathematics. This is a standard package, likely included here for completeness or a specific version.

*   **`pythonhighlight.sty`**:
    *   (Assumed to be from CTAN) Used for highlighting Python code snippets within documents.


## Key Custom Commands and Environments

Here are some of the most important custom commands and environments provided by this LaTeX setup:

*   **`\documentclass{cornouaille}`**:
    *   The starting point for your document.

*   **`\cornouaille{<class_level>}{<document_title>}{<year>}{<document_type>}`**:
    *   Defined in `dccornouaille.sty`.
    *   Creates the main title block at the top of the document.
    *   Example arguments: `\cornouaille{Terminale S}{Devoir Surveillé \no 1}{2023-2024}{Trigonométrie}`

*   **`\exercice[<title>]{<points>}`** and **`\exo[<title>]{<points>}`**:
    *   Defined in `dccornouaille.sty`.
    *   Used to start a new exercise. The `exercice` environment is generally recommended for better solution handling.
    *   `<title>` is an optional title for the exercise.
    *   `<points>` is the number of points for the exercise.

*   **`\begin{solution}` ... `\end{solution}`**:
    *   Defined in `dccornouaille.sty`.
    *   Used to typeset the solution for an exercise.
    *   Solutions can be conditionally displayed or hidden (e.g., using `\cachesolution`).
    *   Points for the solution can be set using `\setbar{<points>}` before the environment.

*   **`\Bareme`**:
    *   Defined in `dccornouaille.sty`.
    *   If called in the document preamble (or near the beginning), it will generate a summary table of exercises and their points at the end of the document. Requires multiple LaTeX compilations.

*   **`\dscornouaille`**:
    *   Defined in `dccornouaille.sty`.
    *   Activates a "Devoir Surveillé" (exam) mode where solutions are collected and printed together on a separate page at the end of the document.

*   **`\vect{<name>}[<x>][<y>][<z>]`**:
    *   Defined in `apmep.sty`.
    *   Typesets a vector with an arrow accent over `<name>` and can optionally include its coordinates in a column matrix. Example: `\vect{u}[1][2][3]` or just `\vect{AB}`.

*   **Math Shortcuts**:
    *   `dcmaths.sty` and `apmep.sty` provide various shortcuts like `\R` (for ℝ), `\N` (for ℕ), `\abs{}`, `\norme{}`, `\Lim`, `\pg` (for ≥), `\pp` (for ≤), `\e` (for e), `\i` (for i).

This is not an exhaustive list, but highlights some of the most frequently used custom features.

## Note on Compilation

*   **Engine**: Due to the use of `fontspec` for loading system/OpenType fonts (specifically `fourier-otf`), documents created with this class **must be compiled with a XeTeX or LuaTeX engine** (e.g., `xelatex` or `lualatex`). Standard `pdflatex` will not work correctly.
*   **Multiple Compilations**: Features like the automated grading table (`\Bareme`), table of contents, cross-references, and `hyperref` links typically require **multiple compilations** (usually 2 to 3) of the LaTeX source file to stabilize and appear correctly.
*   **Shell Escape (for `minted` if adopted)**: If Python code highlighting were to be handled by a package like `minted` in the future (instead of `pythonhighlight.sty`), compilation would require the `--shell-escape` option to be enabled for the LaTeX compiler (e.g., `xelatex --shell-escape yourdocument.tex`). This is not currently required if `pythonhighlight.sty` from CTAN works as expected without it.
