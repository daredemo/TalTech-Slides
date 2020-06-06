\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{taltechslides}[2020/05/26 Tallinn University of Technology slide template]

\ProcessOptions\relax
\LoadClass[table,aspectratio=169]{beamer}

\RequirePackage{xltxtra}
\RequirePackage{fontspec}
\RequirePackage{mathptmx}% Times and maths
\RequirePackage[squaren]{SIunits}
\RequirePackage{multirow}

% \setmainfont
%       [ Ligatures = {TeX, Common},
%         SmallCapsFeatures={Letters=SmallCaps},
%         UprightFont    = FreeSans,
%         ItalicFont     = FreeSans Oblique,
%         BoldFont       = FreeSans Bold,
%         BoldItalicFont = FreeSans Bold Oblique,
%       ] {FreeSans}
% \setmonofont[Scale=1.0]{FreeMono}
\setmainfont[Ligatures = {TeX, Common}]{Verdana}


\RequirePackage{tikz}
\usetikzlibrary{arrows, shapes.arrows, arrows.meta, positioning, fit, calc, backgrounds, patterns, 3d}

\RequirePackage{environ}
\makeatletter
\newsavebox{\measure@tikzpicture}
\NewEnviron{scaletikzpicturetowidth}[1]{%
  \def\tikz@width{#1}%
  \def\tikzscale{1}\begin{lrbox}{\measure@tikzpicture}%
  \BODY
  \end{lrbox}%
  \pgfmathparse{#1/\wd\measure@tikzpicture}%
  \edef\tikzscale{\pgfmathresult}%
  \BODY
}
\makeatother

\makeatletter
\@addtoreset{section}{part}
\makeatother

\makeatletter
\@addtoreset{subfigure}{figure}
\@addtoreset{subfloat}{figure}
\makeatother

\RequirePackage{color}
\RequirePackage{multirow}       % used for multirow cells in tables
\RequirePackage{hhline}         % used for custom horizontal lines in tables

\definecolor{TTUred}{HTML}{AB1352}
\definecolor{TTUpink}{HTML}{E4067E}
\definecolor{TTUblue}{HTML}{332B60}
\definecolor{TTUlight}{HTML}{dadae4}
\definecolor{TTUdark}{HTML}{8b92ab}

\setbeamercolor{alerted text}{fg=TTUpink}
\setbeamercolor{normal text}{fg=TTUblue}

\setbeamertemplate{footline}[frame number]
\setbeamercolor{palette primary}{fg=TTUblue}
\setbeamercolor{palette secondary}{fg=TTUblue}
\setbeamercolor{palette tertiary}{fg=TTUblue}
\setbeamercolor{palette quaternary}{fg=TTUblue}
\setbeamercolor{structure}{fg=TTUblue} % itemize, enumerate, etc
\setbeamertemplate{itemize items}[square]
\setbeamercolor{itemize item}{fg=TTUblue} % itemize, enumerate, etc
\setbeamercolor*{item}{fg=TTUblue}
\setbeamercolor{itemize subitem}{fg=TTUblue}
\setbeamercolor{section in toc}{fg=TTUblue} % TOC sections
\setbeamerfont{section in toc}{size=\Large, series=\bfseries}
\setbeamerfont{subsection in toc}{size=\Large}

\setbeamercolor{subsection in head/foot}{fg=TTUred}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamercolor{frametitle}{fg=TTUred}

% \setbeamercovered{transparent}

\setbeamertemplate{frametitle}{
      \vspace{12pt}\expandafter%
      %\uppercase
      \expandafter\insertframetitle
}



% definitions
% \newcommand{\ignore}[1]{}
% \newcommand\autorField{}
% \newcommand\titleNameLongOne{}
% \newcommand\titleNameLongTwo{}
% \newcommand\titleNameShort{}
% \newcommand\dateOfPresentation{}


% \newcommand*\autorField[1]{\def\@autorField{#1}}
% \newcommand*\titleNameLongOne[1]{\def\@titleNameLongOne{#1}}
% \newcommand*\titleNameLongTwo[1]{\def\@titleNameLongTwo{#1}}
% \newcommand*\titleNameShort[1]{\def\@titleNameShort{#1}}
% \newcommand*\dateOfPresentation[1]{\def\@dateOfPresentation{#1}}


\input{taltechsidesdefinitions.tex}

\date{}


\renewcommand{\maketitle}{%
\usebackgroundtemplate{
\begin{tikzpicture}[overlay, remember picture]
\node[inner sep=0pt] at ($(current page.north)+(0,-3.3)$) {\includegraphics[width=\paperwidth, trim={0 0 0 0}, clip]{\imageTitlePage}};
\fill [white] ($(current page.south west)!0.296296296!(current page.north west)$) rectangle (current page.south east);
\fill [white] ($(current page.south west)!0.041666667!(current page.south east)$) rectangle ($(current page.south east)!0.444444444!(current page.north east)$);
\fill [white] ($(current page.south west)!0.083333333!(current page.south east)$) rectangle ($(current page.south east)!0.518518519!(current page.north east)$);
\path let \p1 = ($(current page.south east)!0.291666667!(current page.south west)$) in coordinate (ttux) at (\x1, 0);
\path let \p1 = ($(current page.south east)!0.5025!(current page.north east)$) in coordinate (ttuy) at (0, \y1);
\node [anchor=south west] at ($(ttux)+(ttuy)$) {\includegraphics[scale=0.125,interpolate]{TalTech2.png}};

\path let \p1 = ($(current page.south west)!0.125!(current page.south east)$) in coordinate (titlex) at (\x1, 0);
\path let \p1 = ($(current page.south east)!0.296296296!(current page.north east)$) in coordinate (titley) at (0, \y1);

\node [anchor=south west] at ($(titlex)+(titley)+(0,0.65)$) {\color{TTUred} \uppercase{\Large \textbf{\titleNameLongOne}}};
\node [anchor=south west] at ($(titlex)+(titley)$) {\color{TTUpink} \uppercase{\Large \textbf{\titleNameLongTwo}}};
% \makeatletter
\node [anchor=south west] at ($(titlex)+(titley)-(0,0.9)$) {\color{TTUblue} \textbf{\autorField}};
% \makeatother
\node [anchor=south west] at ($(titlex)+(titley)-(0,1.55)$) {\color{TTUblue} {\footnotesize \nameOfSchool}};
\node [anchor=south west] at ($(titlex)+(titley)-(0,1.9)$) {\color{TTUblue} {\footnotesize \nameOfDepartment}};
\node [anchor=south west] at ($(titlex)+(titley)-(0,2.25)$) {\color{TTUblue} {\footnotesize \nameOfUniversity}};
% \makeatletter
\node [anchor=south west] at ($(titlex)+(titley)-(-11,2.25)$) {\color{TTUblue} {\footnotesize \dateOfPresentation}};
% \makeatother
\end{tikzpicture}
}

\begin{frame}[noframenumbering, plain]{}
  \begin{titlepage}\end{titlepage}
\end{frame}
%--- Next Frame ---%

% \maketitle
\newpage

\usebackgroundtemplate{
\begin{tikzpicture}[overlay, remember picture]
\node [anchor=south west] (logo) at ($(current page.south west)+(0.5,0.5)$) {\includegraphics[scale=0.1]{TalTech_dark.png}};
\node[anchor=west, TTUdark] at ($(logo)+(.8,0)$) {\color{TTUdark}\uppercase{\tiny \nameOfUniversity}};
\draw[TTUdark] ($(logo.north)+(.75,-0.1)$) -- ($(logo.south)+(.75,0.1)$);
\node [anchor=east, TTUred] at ($(logo)+(14,0)$) {\footnotesize{\uppercase{\textbf{\autorFieldShort}}}};
\node [anchor=south, TTUblue] at ($(current page.south)+(0,0.15)$) {\footnotesize{\uppercase{\textbf{\titleNameShort}}}};
\end{tikzpicture}
}
}
