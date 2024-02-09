\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{naklatex}

\LoadClass[
	oneside,
	pointlessnumbers,
	bibliography=totoc,
	index=totoc,
	listof=totoc,
	fontsize=12pt,
	headings=small,
	parskip=half
]{scrbook}

\RequirePackage{scrhack} % package for compatibility with listings
\RequirePackage{listings} % code formatting
\RequirePackage{xstring} % string comparison (transfermodule course of study)
\RequirePackage[ngerman]{babel} % deutsches Sprachpaket
%\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
\RequirePackage[utf8]{inputenc} % utf8 Support
\RequirePackage{stmaryrd}
\RequirePackage[babel, german=quotes]{csquotes}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % Gerenderte Schrift
%\RequirePackage{tgheros} %Uncomment for Helvetica font (set size to 11)
%\RequirePackage{roboto} %Uncomment for Roboto font
\RequirePackage{graphicx}
\RequirePackage{microtype}
\RequirePackage{float}
\RequirePackage{eurosym} % Euro Symbol
\RequirePackage{pdfpages}
%\RequirePackage[dvipsnames]{xcolor}           %/was in the original file but caused errors%
\RequirePackage{tabularx}

\renewcommand*\familydefault{\sfdefault} % Comment out for serif font
\RedeclareSectionCommand[beforeskip=15pt, afterskip=5pt]{chapter}
\RedeclareSectionCommand[beforeskip=5pt, afterskip=2pt]{section} 

\RequirePackage{tabulary} %for custom table in the first page
\RequirePackage{colortbl}
\RequirePackage{etoolbox}
\RequirePackage{listings}
%\usepackage[scaled=0.85]{beramono} %Uncomment for IDE-style code font
%\usepackage{inconsolata} %Uncomment for scientific style code font
%\usepackage[scaled=0.85]{roboto-mono}

%Codeverzeichnis
\renewcommand*{\lstlistingname}{Code}
\renewcommand*{\lstlistlistingname}{Codeverzeichnis}

%Sprachdefinition Kotlin (Beispiel)
\lstdefinelanguage{Kotlin} {
    morekeywords={abstract, actual, as, as?, break, by, class, companion, continue, data, do, dynamic, else, enum, expect, false, final, for, fun, get, if, import, in, interface, internal, is, null, object, override, package, private, public, return, set, super, suspend, this, throw, true, try, typealias, val, var, vararg, when, where, while},
    morestring=[b]",
	morestring=[b]', 
	morecomment=[l]{*}, 
  	morecomment=[s]{/*}{*/}
}

%Change code color scheme here
\definecolor{lightlightgray}{RGB}{245,245,245}
\definecolor{string}{HTML}{008C34}
\definecolor{comment}{HTML}{CC0081}
\definecolor{annotation}{HTML}{A93824}
\definecolor{keyword}{HTML}{3E41D6}
\definecolor{constant}{HTML}{BC00ED}

\lstset{frame=tb,
  backgroundcolor = \color{lightlightgray},
  language=Kotlin,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\small\ttfamily,
  keywordstyle=\textcolor{keyword},
  commentstyle=\color{comment},
  stringstyle=\textcolor{string},
  morecomment=[s][\color{annotation}]{@}{\ },
  emph={Person},
  emphstyle={\color{constant}},  %Add words to emphasize here
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
  captionpos=b
}

%Numerierung Anhang
\let\origappendix\appendix % save the existing appendix command
\renewcommand\appendix{\clearpage\pagenumbering{roman}\origappendix}

\RequirePackage{titlepage}
\RequirePackage{latexsym}

\usepackage{subcaption} %for subfigures

%for custom scripts f.e. filling colors.. https://tex.stackexchange.com/questions/83992/how-to-create-and-include-tikz-files-in-your-manuscript
%Tikz-Import
\RequirePackage{tikz}
\usetikzlibrary{fadings}

%pdf im text
\RequirePackage{pdfpages}
\RequirePackage[export]{adjustbox}

% Seitenränder
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=2cm,headheight=1cm,headsep=0.5cm]{geometry}

\RequirePackage{scrlayer-scrpage} %Header
\ohead*{\includegraphics[height=15pt]{image/NA_Logo_positiv_RGB}}

% Zielenabstand 1,5
\RequirePackage{setspace}
\onehalfspacing

%load hyperref last but before glossaries
\RequirePackage[hyphens]{url} %break urls
\RequirePackage[hidelinks]{hyperref}
\hypersetup{bookmarksnumbered}

\RequirePackage[automake,nonumberlist,acronym,toc]{glossaries}
\makeglossaries

% Options
\DeclareOption{transfermodule}{
	\newcommand*{\studyprogramme} {
		\IfStrEqCase{\StudyProgrammeCharacter} {
			{A}{Angewandte Informatik}
			{B}{Betriebswirtschaftslehre}
			{I}{Wirtschaftsinformatik}
			{W}{Wirtschaftsingenieurswesen}
		}[Unbekannter Studiengang]
	}
	\newcommand*{\transfermodulenumber}[1]{\gdef\transfermodulenumber{#1}}
	\newcommand*{\studentnumber}[1]{\gdef\studentnumber{#1}}
	\newcommand*{\thema}[1]{\gdef\thema{#1}}
	\newcommand*{\class}[1]{
		\gdef\class{#1}
		\StrLeft{#1}{1}[\StudyProgrammeCharacter]
	}
	\subject{Transferleistung \@transfermodulenumber}
	\date{}
	\author{\@studentnumber \\\studyprogramme, \class}
	\ihead*{\includegraphics[height=20pt]{image/transferleistung}}
}
\DeclareOption{paper}{}
\ProcessOptions\relax
