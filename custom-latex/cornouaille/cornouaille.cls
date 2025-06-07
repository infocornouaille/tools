\ProvidesClass{cornouaille}[2022/09/20 v1.0 cornouaille class]
\NeedsTeXFormat{LaTeX2e}[1995/06/01]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Mise en page
\RequirePackage{geometry}
%En test
\geometry{a4paper,width=17.8cm,height=25cm
    ,marginparsep=0cm %Pas de séparateur de marge
    ,marginparwidth=0cm %Pas de notes de marge 
}
% Commented out geometry from original .cls - keep it that way
%\geometry{a4paper,left=1cm, right=1cm , top=1cm , bottom=2.5cm} %Mise en page APMEP

% Load the main cornouaille style package
\RequirePackage{cornouaille}

% Any other class-specific logic could go here, but for now, it's mainly about loading the style.
