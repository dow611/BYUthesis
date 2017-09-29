\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{BYUthesis}[2015/03/20 v0.1 Simple prospectus class]
\LoadClass[12pt,letterpaper]{report}

\RequirePackage[margin=1in]{geometry}
\RequirePackage[T1]{fontenc} % looks better than default font encoding
\RequirePackage{lmodern} % need a newer font to work with T1 font encoding
\RequirePackage[hang,small,bf]{caption}
\RequirePackage{etoolbox} % forlistloop, listadd
\RequirePackage{setspace} % singlespacing, doublespacing
\RequirePackage{tocloft} % configure table of contents and list of figs/tabs

\DeclareOption{etd}{\newcommand{\etd}{etd}} %TODO implement ETD
\ProcessOptions\relax

% Process or warn about required inputs for title page
\newcommand{\department}[1]{\gdef\@department{#1}}
  \def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
  \def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\newcommand{\papertype}[1]{\gdef\@papertype{#1} }
  \def\@papertype{\@latex@warning@no@line{No \noexpand\papertype given}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1} }
  \def\@copyrightyear{\@latex@warning@no@line{No \noexpand\copyrightyear given}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1} }
  \def\@keywords{\@latex@warning@no@line{No \noexpand\keywords given}}

\newcommand*{\@committeelist}{}
\newcommand*{\committeemember}[1]{\listadd{\@committeelist}{#1}}
\newcommand\tmpprintlist[1]{#1\\} % Print item in list

% format title page
\newcommand{\includetitle}{%
    \begin{titlepage}
    %\pdfbookmark[0]{Title Page}{titlepage}
    \begin{center}
    \@title  \par
    \vspace{\stretch{1}}
    \@author \par
    \vspace{\stretch{1}}
    A \@papertype{} submitted to the faculty of\\
    Brigham Young University\\
    in partial fulfillment of the requirements for the degree of\\
    \vspace*{\baselineskip}
    \@degree{} \par
    \vspace{\stretch{1}}
    \forlistloop{\tmpprintlist}{\@committeelist}
    \vspace{\stretch{1}}
    \doublespacing
    \@department\\
    Brigham Young University\\
    \vspace{0.5in}
    Copyright \copyright\ \@copyrightyear\ \@author \\
    All Rights Reserved
    %\cleardoublepage
    \end{center}
    \end{titlepage}
}

% format abstract page
\newcommand{\includeabstract}[1]{
  %\pdfbookmark[0]{Abstract}{Abstract}
  \begin{center}
  \singlespacing
  ABSTRACT\\
  \vspace{0.15in}
  %\afterpage{\cleardoublepage}
  \@title\\
  \vspace{0.15in}
    \@author\\
    \@department, BYU\\
    \@degree
  \end{center}
  \par
  \singlespacing
  \setlength{\parskip}{1\baselineskip}
  \input{#1}
  \vfill
  \noindent Keywords: \@keywords
  \clearpage
}

% format acknowledgments page
\newcommand{\includeacknowledgments}[1]{
  \begin{center}
  ACKNOWLEDGMENTS\\[45pt]
  \end{center}
  \doublespacing
  \par
  \input{#1}
  \clearpage
}

% format table of contents
\newcommand{\includetableofcontents}{
  %\pdfbookmark[0]{Table of Contents}{toc}
  \renewcommand{\cfttoctitlefont}{\large\bfseries}
  \renewcommand{\contentsname}{Table of Contents}
  \renewcommand{\appendixname}{Paper}

   % This adds the words Chapter and Appendix to table of contents
   \newlength\shifttofitchapter
   \renewcommand\cftchappresnum{\chaptername~}
   \settowidth\shifttofitchapter{\cftchappresnum\cftchapaftersnum\quad}
   \addtolength\cftchapnumwidth{\shifttofitchapter}
   \makeatletter
   \g@addto@macro\appendix{\addtocontents{toc}{%
       \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}}}
   \makeatother

  \tableofcontents
  \clearpage
}






%\renewcommand{\listtablename}{LIST OF TABLES}
%\renewcommand{\listfigurename}{LIST OF FIGURES}
