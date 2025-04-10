\ProvidesClass{cornouaille}[2022/09/20 v1.0 cornouaille class]
\NeedsTeXFormat{LaTeX2e}[1995/06/01]

%\RequirePackage{fix-cm}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%Les packages persos chargés
\RequirePackage{apmep}
\RequirePackage{dcmaths}
\RequirePackage{dccornouaille}
\RequirePackage{dctikz}
\RequirePackage{dccours}

%Les packages pstricks
\RequirePackage{pst-plot,pst-tree,pstricks,pst-node,pst-func}
\RequirePackage{pst-eucl}
%\RequirePackage{pst-bezier}
\RequirePackage{pst-text}
\RequirePackage{pst-infixplot}
\RequirePackage{pstricks-add}
%\RequirePackage{pst-all}


%Pour les tableaux de valeur et de variation
\RequirePackage{tkz-tab}

%Python
\RequirePackage{pythonhighlight}

%Mise en page
\RequirePackage{geometry}
%En test
\geometry{a4paper,width=17.8cm,height=25cm
    ,marginparsep=0cm %Pas de séparateur de marge
    ,marginparwidth=0cm %Pas de notes de marge 
}

%\geometry{a4paper,left=1cm, right=1cm , top=1cm , bottom=2.5cm} %Mise en page APMEP
%\setlength{\textheight}{25cm} %Hauteur du texte
\setlength{\headheight}{0.5cm} %Hauteur Entête (minimum 0.5cm sinon le package fancyhd plante...)
\setlength\parindent{0mm} %Supprime l'indentation de façon permanente

%Ecrire en français, symboles divers et mise en forme
%\RequirePackage[frenchb]{babel}
\RequirePackage{polyglossia}
\setdefaultlanguage{french}
%\RequirePackage{libertine}
\RequirePackage{fontspec}



\newcommand{\og}{<<} %ourvir les guillemets
\newcommand{\fg}{>>}
\RequirePackage{eurosym} %Pour le symbole euro: \euro
\RequirePackage{enumitem}
\RequirePackage{fourier-otf} %Pour les symboles standards
\RequirePackage[np]{numprint} % Permet de mettre en forme les nombres
\RequirePackage{colortbl} %Pour colorer les tableaux
\RequirePackage{diagbox} %Charge slashbox, calc, keyval, fp, pit2e Permet de faire des diagonales dans un tableau
\RequirePackage{multicol} %Pour écrire sur plusieurs colonnes

%Les fontes

%\RequirePackage{fontspec}
%\setmainfont{Arial}
%\setmainfont{Latin Modern Roman}%remet fonte classique
%\RequirePackage[T1]{fontenc} % To switch to the T1 encoding
%\RequirePackage{lmodern} % To switch to Latin Modern
%\rmfamily % To load Latin Modern Roman and enable the following NFSS declarations.
% Declare that Latin Modern Roman (lmr) should take
% its bold (b) and bold extended (bx) weight, and small capital (sc) shape, 
% from the corresponding Computer Modern Roman (cmr) font, for the T1 font encoding.
%\DeclareFontShape{T1}{lmr}{b}{sc}{<->ssub*cmr/bx/sc}{}
%\DeclareFontShape{T1}{lmr}{bx}{sc}{<->ssub*cmr/bx/sc}{}

%Pour l'importation Sesamath
\RequirePackage{sesatikz}

%Les liens hypertextes
\RequirePackage{ifxetex,ifluatex}
\ifxetex
    \RequirePackage[xetex,colorlinks=true,pdfstartview=FitV,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}
\else
    \RequirePackage[luatex,colorlinks=true,pdfstartview=FitV,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}
\fi
%%%%%%%%%%%%%%%%%
%Auteur
%%%%%%%%%%%%%%%%%
\hypersetup{%
    pdfauthor = David Couronn\'e,
    %pdfsubject = {},
    %pdftitle = {},
    allbordercolors = white,
    pdfstartview=FitH,
    colorlinks=true,
    linkcolor=blue
}

\renewcommand{\C}{\mathbb{C}} %Le package hyperref écrase la commande pour l'ensemble C des complexes...


%Commande pour changer facilement le nom d'auteur:
\newcommand{\Auteur}[1]{%
    \hypersetup{pdfauthor = #1}
}

%Nouveau type de colonne dans tabularx: C qui correspond à X centré
\newcolumntype{C}{>{\centering\arraybackslash}X}

%On écrit les maths tout le temps en grand
\everymath{\displaystyle}

%\setmainfont{Times New Roman}





