%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% LaTeX Class for Thesis of the PUC and the X %%%%%%%%%%%%%%%%%
%%%% Format based on the specifications for Theses of the Escuela   %%%%
%%%% de Ingenieria of the Pontificia Universidad Catolica de Chile  %%%%
%%%% and the Centre de Mathematiques Appliquees of the Ecole Poly-  %%%%
%%%% technique of Paris.                                            %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% XPUCTHESIS CLASS

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{XPucThesis}
              [2008/10/01 v1.2
              LaTeX Thesis Class for the PUC and the X]

\wlog{++++++++++++++++++++++++++++++++++}
\wlog{+ Carlos Feres Ducci  <May 2013> +}
\wlog{++++++++++++++++++++++++++++++++++}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% REQUIRED PACKAGES

%% Double and one-and-one-half line spacing package
\usepackage{setspace}

%% Graphical package
\usepackage{graphicx}

%% If-then instructions package
\usepackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This file is designed to work with AMSLaTeX version 1.2. It uses
% amsbook.cls as a base and modifies page size, top matter, section
% headings, etc. to produce a X/PUC style for Ph.D./M.Eng. thesis
%
% Instructions:
%
%   -- In a document file, use \documentclass{XPucThesis}.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% XPucThesis is based on the amsbook style. Pass all the options to
%% amsbook for processing.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AMSBOOK CLASS

%% PUCformat and Xformat options
\newif\if@pucformat
\newif\if@xformat
\DeclareOption{pucformat}{\@pucformattrue}
\DeclareOption{nopucformat}{\@pucformatfalse}
\DeclareOption{xformat}{\@xformattrue}
\DeclareOption{noxformat}{\@xformatfalse}
\ProcessOptions\relax
\newdimen\sidemargin
\if@pucformat
  \PassOptionsToClass{12pt,reqno,oneside,letterpaper}{amsbook}
  \setlength\sidemargin{12.6mm}
\fi
\if@xformat
  \PassOptionsToClass{12pt,reqno,twoside,a4paper}{amsbook}
  \setlength\sidemargin{6.7mm}
\fi

%% Amsbook options
\newif\if@nopunc\@nopuncfalse
\DeclareOption{nopunc}{\@nopunctrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsbook}}
\def\pdftex@true{1}    % Assume by default the graphics package uses pdflatex.
\PassOptionsToPackage{pdftex}{graphicx}%
\ProcessOptions\relax
\LoadClass{amsbook}

%% AMSBOOK bug corrections
%%
%% The current version of amsbook and amsart redefine this, but it breaks
%% minipage footnotes.  Put the core latex definition back.

\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MARGINS --- according to the PUC Thesis guidelines
%% Specific Margins: Left Margin=40mm (1.5in), Sup. Margin=40mm (1.5in),
%%                   Inf. Margin=25mm (1.0in), Right Margin=25mm (1.0in).
%% Letterpaper: Height=279.4mm (11.0in), Width=215.9mm (8.5in).

%% Papersize dependent specifications
\newdimen\sidemargin
\setlength\sidemargin{40mm}
\addtolength{\sidemargin}{-1in}
\setlength{\textheight}{9in} % height of main text
\setlength{\topmargin}{35.5mm} % gap above header
\addtolength{\topmargin}{-1in}

%% Page layout
\setlength{\hoffset}{0pt}    % horizontal offset
\setlength{\voffset}{0pt}    % vertical offset
\setlength{\textwidth}{5.941in}  % width of text
\setlength{\oddsidemargin}{\sidemargin} % odd page left margin
\setlength{\evensidemargin}{\sidemargin} % even page left margin
\setlength{\headsep}{5mm}
\setlength{\topskip}{0mm}   % space between header and text
\setlength{\footskip}{30pt}  % space between footer and text
\setlength{\headheight}{5mm}
\setlength{\marginparsep}{11pt}
\setlength{\marginparwidth}{90pt}
\setlength{\marginparpush}{5pt}
%\setlength{\columnsep}{} % gap between columns

%% Paragraphs
\normalparindent=21\p@
\setlength{\parindent}{\normalparindent} % indentation of paragraphs
\setlength{\parskip}{5pt}                % gap between paragraphs

%% Floats (tables and figures)
\setlength{\floatsep}{8mm}     % space left between floats.
\setlength{\textfloatsep}{8mm} % space between last top float or first bottom float and text
\setlength{\intextsep}{8mm}    % space left on top and bottom of an in-text float
\setlength{\dbltextfloatsep}{8mm}  % is \textfloatsep for 2 column output
\setlength{\dblfloatsep}{8mm}      % is \floatsep for 2 column output
\setlength{\abovecaptionskip}{4mm} % space above caption
\setlength{\belowcaptionskip}{10mm} % space below caption

%% Maths
%\setlength{\abovedisplayskip}{} % space before maths
%\setlength{\belowdisplayskip}{} % space after maths
%\setlength{\arraycolsep}{}      % gap between columns of an array

%% Lists
\setlength{\topsep}{1pt}    % space between first item and preceding paragraph
\setlength{\partopsep}{1pt} % extra space added to \topsep when environment starts new paragraph
\setlength{\itemsep}{5pt}   % space between successive items (additional to \parsep)
\setlength{\parsep}{1ex plus0.5ex minus0.5ex} % spacing between to parts 

%% DOUBLE SPACING -- use setspace.sty to double space the document.

%\RequirePackage{setspace}
\let\@normalsize=\normalsize
\def\baselinestretch{1.5} % Line spacing
\if@pucformat
  \def\baselinestretch{1.5} % Line spacing
\fi
\if@xformat
  \def\baselinestretch{1.1} % Line spacing
\fi
\@currsize
\normalsize

%% When doing footnotes want the listi to behave differently.

\renewcommand\footnotesize{\Small
  \def\@listi{\topsep \z@ \parsep \z@ \itemsep \z@}}

% Set \topsep to 0 in \@listI.
\def\@listI{\leftmargin\leftmargini
  \parsep\z@skip \topsep\z@skip \itemsep\z@skip}
\let\@listi\@listI
\@listi

%% Auxiliar length
\newlength{\auxdist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BIB DEFINITIONS

\RequirePackage[natbibapa]{apacite}
\renewcommand\newblock{\hspace{.7ex}}% Required because definition of
                                   % \bewblock in apacite.sty does not
                                   % leave enough space between the
                                   % the last author's initials and the year.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTER DEFINITIONS

%% Chapter name and numerals
\def\chaptername{}%CHAPTER}%
\def\thechapter{\@Roman\c@chapter} % Number chapters with roman numerals.

%% Chapter definition
\def\chapter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{headings}
  \pagestyle{headings}
  \global\@topnum\z@
  \@afterindenttrue % Indent in the first line after the chapter's beginning
  \secdef\@chapter\@schapter}

%% Chapter in Contents
\def\@chapter[#1]#2{
  \refstepcounter{chapter} % For Hyperref compatibility
  \typeout{#1}
  \ifnum\c@secnumdepth<\z@
    \let\@secnumber\@empty
  \else
    \let\@secnumber\thechapter
  \fi
  \def\@toclevel{0}%
  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#1}%
  \else \@tocwriteb\tocchapter{chapter}{#1}\fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}

%% Chapter* counter
\newcounter{chapter*}

%% Chapter* in Contents
\def\@schapter#1{
  \refstepcounter{chapter*} % For Hyperref compatibility
  \typeout{#1}
  \let\@secnumber\@empty
  \def\@toclevel{0}%
  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#1}%
  \else \@tocwriteb\tocchapter{chapter}{#1}\fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading}

%% Eliminate page numbers on first chapter page by making \thispagestyle{empty}
\def\NoChapterPageNumber{%
  \def\chapter{\cleardoublepage
    \thispagestyle{onlypagenumber} \pagestyle{headings}
    \global\@topnum\z@
    \@afterindenttrue % Indent in the first line after the chapter's beginning
    \secdef\@chapter\@schapter}}

%% Chapter heading
\def\@makechapterhead#1{ %\global\topskip 0pc\relax
\vspace*{0.1\p@}%
\vspace*{-8.15mm}%
  \begingroup\normalfont\large\bfseries
    \rlap{\vbox to\z@{\vss%
    {%
      \mdseries\@normalsize%
      \ifx \chaptername\empty%
        \settowidth{\auxdist}{\bfseries%
          \thechapter.\enspace}%
        \addtolength{\auxdist}{-\textwidth}%
        \setlength{\auxdist}{-\auxdist}%
        {\noindent\bfseries\large%
          \thechapter.\enspace
          \parbox[t]{\auxdist}{\uppercase{#1}}}%
      \else%
        \settowidth{\auxdist}{\bfseries%
          \chaptername\space \thechapter.\enspace}%
        \addtolength{\auxdist}{-\textwidth}%
        \setlength{\auxdist}{-\auxdist}%
        {\noindent\bfseries\large%
          \chaptername\space \thechapter.\enspace
          \parbox[t]{\auxdist}{\uppercase{#1}}}%
      \fi%
      \enspace}%
    }}%
    \vskip 10\p@%
    \par%
  \endgroup%
  \skip@36\p@%
  \advance\skip@-\normalbaselineskip%
  \vskip\skip@%
}

%% Chapter* heading
\def\@makeschapterhead#1{ %\global\topskip 0pc\relax%
\vspace*{0.1\p@}%
\vspace*{-1cm}%
  \begingroup\normalfont\large\bfseries%
    \centering\uppercase{#1}%
    \vskip 10\p@%
    \par%
  \endgroup%
  \skip@36\p@%
  \advance\skip@-\normalbaselineskip%
  \vskip\skip@%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION AND SUBSECTIONS DEFINITIONS

%% The "." after subsection name is not kosher according to MDL
%% But others say that it is (including AMS apparently).

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \edef\@toclevel{\ifnum#2=\@m 0\else\number#2\fi}%
  \ifnum #2>\c@secnumdepth \let\@secnumber\@empty%
  \else \@xp\let\@xp\@secnumber\csname the#1\endcsname\fi%
 \ifnum #2>\c@secnumdepth%
   \let\@svsec\@empty%
 \else%
    \refstepcounter{#1}%
    \edef\@svsec{\ifnum#2<\@m%
       \@ifundefined{#1name}{}{%
         \ignorespaces\csname #1name\endcsname\space}\fi%
       \@nx\textup{%
         \csname the#1\endcsname}\enspace}%
  \fi%
  \@tempskipa #5\relax%
  \ifdim \@tempskipa>\z@% then this is not a run-in section heading
    \begingroup #6\relax%
      \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty\@M #8\par}%
    \endgroup%
    \csname #1mark\endcsname{#7}%
    \ifnum#2>\@m \else \@tocwrite{#1}{#8}\fi%
  \else%
    \def\@svsechd{#6\hskip #3\@svsec%
      \@ifnotempty{#8}{\ignorespaces#8\unskip\if@nopunc\else\@addpunct.\fi}%
      \ifnum#2>\@m\else\@tocwrite{#1}{#8}\fi}%
  \fi%
  \global\@nobreaktrue%
  \@xsect{#5}}%

%% Redefine startsection to eliminate idle spaces before titles
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par \@tempskipa #5\relax % #4 changed by #5
  \@afterindenttrue
  \ifdim
    \@tempskipa <\z@ \@tempskipa -\@tempskipa \relax
  \fi
  \if@nobreak \everypar{} \else
    \addpenalty\@secpenalty\addvspace{\@tempskipa} \fi
  \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}%

%% Section definition
\def\section{\@startsection{section}{1}{\z@}%
  {.7\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\large\bfseries}}%

%% Subsection definition
\def\subsection{\@startsection{subsection}{2}{\z@}%
  {.5\linespacing\@plus.5\linespacing}{.1\linespacing}%
  {\normalfont\normalsize\bfseries}}%

%% Subsubsection definition
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {.5\linespacing\@plus.2\linespacing}{.1\linespacing}%
  {\normalfont\normalsize}}%

%% Paragraph definition
\def\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-\fontdimen2\font}%
  \normalfont\normalsize\bfseries}%

%% Subparagraph definition
\def\subparagraph{\@startsection{subparagraph}{5}{\z@\z@}%
  {-\fontdimen2\font}%
  \normalfont\normalsize}%

% Name chapters and headings to use roman numerals for the level of
% chapters and arabic numerals under the level of chapters,
% e.g.: I. and 1.1 and 1.1.1.
\renewcommand \thepart{\@Roman\c@part}
\renewcommand \thechapter{\@arabic\c@chapter}
\renewcommand \thesection{\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection{\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\@alph\c@subsubsection)}
\renewcommand \theparagraph   {\@alph\c@subsubsection.\@arabic\c@paragraph)}
\renewcommand \thesubparagraph{\@alph\c@subsubsection.\@arabic\c@paragraph.\@arabic\c@subparagraph)}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLE OF CONTENTS, LIST OF FIGURES, AND LIST OF TABLES DEFINITIONS

%% Names
\def\contentsname{TABLE OF CONTENTS}    
\def\listfigurename{LIST OF FIGURES}
\def\listtablename{LIST OF TABLES}

%% Table of contents lines
%% Re-define to be dotted.

\c@tocdepth=2     % put subsections in toc.
\def\@toclevel{0} % Turn of error if \listoffigures not preceeded by \chap.
\def\l@subsection{\@tocline{2}{0pt}{2pc}{5pc}{}}
\def\@dotsep{4.5}
\def\@tocline#1#2#3#4#5#6#7{\relax
  \ifnum #1>\c@tocdepth % then omit
  \else
    \par \addpenalty\@secpenalty\addvspace{#2}%
    \begingroup \hyphenpenalty\@M
    \@ifempty{#4}{%
      \@tempdima\csname r@tocindent\number#1\endcsname\relax
    }{%
      \@tempdima#4\relax
    }%
    \parindent\z@ \leftskip#3\relax \advance\leftskip\@tempdima\relax
    \rightskip\@pnumwidth plus1em \parfillskip-\@pnumwidth
    #5\leavevmode\hskip-\@tempdima #6\relax
    \nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}\hfill%
    \hbox to\@pnumwidth{\@tocpagenum{#7}}\par
    \nobreak
    \endgroup
  \fi}

%
% Indentation in list of figures and list of tables
%
\def\l@figure{\@tocline{0}{3pt plus2pt}{0pt}{2.5pc}{}}
\let\l@table=\l@figure

%
% Table of contents
%
\def\@starttoc#1#2{%
  \begingroup
  \setTrue{#1}%
  \let\secdef\@gobbletwo \chapter
  \let\@secnumber\@empty % for \@tocwrite and \chaptermark
  \refstepcounter{chapter*} % For Hyperref compatibility
  \@tocwrite{chapter}{#2}
  \typeout{#2}\@xp\chaptermark\@xp{#2}%
  \@makeschapterhead{#2}\@afterheading
  \parskip\z@skip
  \makeatletter
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \newpage
}
%\def\l@section{\@tocline{1}{0pt}{1pc}{}{}}
\renewcommand{\tocsection}[3]{%
  \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 #2 \quad}}#3}
%\def\l@subsection{\@tocline{2}{0pt}{1pc}{5pc}{}}
\let\tocsubsection\tocsection
%\def\l@subsubsection{\@tocline{3}{0pt}{1pc}{7pc}{}}
\let\tocsubsubsection\tocsection
\let\l@paragraph\l@subsubsection
\let\tocparagraph\tocsection
\let\l@subparagraph\l@subsubsection
\let\tocsubparagraph\tocsection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APPENDIX

%% Appendix
\def\appendix{\par%
  \c@chapter\z@ \c@section\z@%
  \def\chaptername{}%APPENDIX}%
  \def\thechapter{\@Alph\c@chapter} % Number appendix with uppercase letters.
  \renewcommand\thesection {\@Alph\c@chapter.\@arabic\c@section}
  \renewcommand\thesubsection {\@Alph\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
  \numberwithin{figure}{chapter}
    \renewcommand \thefigure
         {\ifnum \c@chapter>\z@ \@Alph\c@chapter.\fi \@arabic\c@figure}
    \numberwithin{table}{chapter}
    \renewcommand \thetable
         {\ifnum \c@chapter>\z@ \@Alph\c@chapter.\fi \@arabic\c@table}
    \numberwithin{equation}{chapter}
    \renewcommand \theequation
        {\ifnum \c@chapter>\z@ \@Alph\c@chapter.\fi \@arabic\c@equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADER AND FOOTER DEFINITIONS

%%
%% HEADER and FOOTER
%%
\let\sectionmark\@gobble % Just to have chapter name...
%%
%% Want section running head to be numbered with chapter as well.
%%
%% modif. 20.May.2002, by Miguel Torres-Torriti:
%%   Eliminated "\thechapter." since section is already numbered
%%   within chapter when \numberwithin{section}{chapter} is used
%%   in the preamble ("\thechapter." should be used if sections
%%   are not numbered as 'chapter #.section #' to produce consistent
%%   section running heads throught the document).
%% modif. 15.Aug.2002, by Miguel Torres-Torriti:
%%   Added "." after "#2"  -  Now numbers of chapter and section
%%   in the headings are consistent.
%%   e.g.  Even Page: CHAPTER 123. Chapter Title
%%          Odd Page:         123.2. Section Title
%%
\def\sectionrunhead#1#2#3{%
  \@ifnotempty{#2}{{#1 %\thechapter.
    #2.}\@ifnotempty{#3}{\hskip1em}}
  \def\@tempa{#3}%
  \ifx\@empty\@tempa\else\uppercasenonmath\@tempa\@tempa\fi}
%%
%% \pagestyle{onlypagenumber} MTT modif. 07.05.2007 for PUC Thesis
%%
\def\ps@onlypagenumber{\ps@empty
  \def\@oddfoot{\normalsize\hfil\llap{\thepage}}
  \def\@evenfoot{\normalsize\rlap{\thepage}{}{}\hfil}}%
%%
%% \pagestyle{headings}
%%
\def\ps@headings{\ps@empty
  \def\@oddfoot{\normalsize\hfil\llap{\thepage}}
  \def\@evenfoot{\normalsize\rlap{\thepage}{}{}\hfil}
  \let\@mkboth\markboth}%
%%
%% \pagestyle{myheadings}
%%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
  \def\@oddhead{\hfil\Small\rightmark\hbox{} }
  \def\@oddfoot{\rm\hfil\thepage\hbox{}}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot\def\sectionmark##1{}\def\subsectionmark##1{}
  \def\chaptermark##1{\markright {\ifnum \c@secnumdepth
      >\m@ne
      \thechapter. \ ##1\fi}}}

%
% Computations to make the \textheight come out
% to an even multiple of baselineskip (after taking
% \topskip etc. into account).
%

\advance\textheight by -\headheight
\advance\textheight by -\headsep
\advance\textheight by -\normalbaselineskip
\advance\textheight by \topskip

%
% We now have the right value for \textheight except that
% we need to round it.
%
\advance\textheight by.5\normalbaselineskip
\divide\textheight by\normalbaselineskip
\multiply\textheight by\normalbaselineskip
%
%       One last note: if \baselinestretch is changed in an
%       actual document, this \textheight will most likely be
%       off and you'll get underfull vbox messages.
%
\advance\topmargin by -.25 true in

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LIST ENVIRONMENTS

%%% Taken from Tweaklist.sty
%
%%% Definitions
%\def\enumhook{}
%\def\enumhooki{}
%\def\enumhookii{}
%\def\enumhookiii{}
%\def\enumhookiv{}
%\def\itemhook{}
%\def\itemhooki{}
%\def\itemhookii{}
%\def\itemhookiii{}
%\def\itemhookiv{}
%\def\descripthook{}
%
%%% Change first-level `enumerate' numbering style to arabic
%%% followed by a point
%\renewcommand{\labelenumi}{\arabic{enumi}. }
%\renewcommand{\labelenumii}{\roman{enumii}) }
%%\renewcommand\labelitemi{$\circ$}
%\renewcommand{\enumhook}{\setlength{\topsep}{5pt}%
%  \setlength{\itemsep}{5pt}}
%
%%% Enumerate
%\def\enumerate{%
%  \ifnum \@enumdepth >\thr@@\@toodeep\else
%    \advance\@enumdepth\@ne
%    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
%      \expandafter
%      \list
%        \csname label\@enumctr\endcsname
%        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
%          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
%  \fi}
%  
%%% Itemize
%\def\itemize{%
%  \ifnum \@itemdepth >\thr@@\@toodeep\else
%    \advance\@itemdepth\@ne
%    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
%    \expandafter
%    \list
%      \csname\@itemitem\endcsname
%      {\def\makelabel##1{\hss\llap{##1}}%
%        \itemhook \csname itemhook\romannumeral\the\@itemdepth\endcsname}%
%  \fi}
%
%%% Description
%\renewenvironment{description}
%                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
%                          \let\makelabel\descriptionlabel\descripthook}}
%                 {\endlist}

\renewcommand{\labelenumi}{\arabic{enumi}. }
\renewcommand{\labelenumii}{\roman{enumii}) }
% Change \enumerate and \itemize to increase \partopsep.
\def\enumerate{\ifnum \@enumdepth >\thr@@\@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}
      \expandafter\list
      {\csname label\@enumctr\endcsname}{\usecounter
      \@enumctr\def\makelabel##1{\hss\llap{\upshape##1}}}
      %\enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}
      \fi}
%\def\enumerate{%
%  \ifnum \@enumdepth >\thr@@\@toodeep\else
%    \advance\@enumdepth\@ne
%    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
%      \expandafter
%      \list
%        \csname label\@enumctr\endcsname
%        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
%          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
%  \fi}
%
\def\itemize{\ifnum\@itemdepth>3 \@toodeep
  \else \advance\@itemdepth\@ne
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{\csname\@itemitem\endcsname}%
  {\partopsep6\p@\def\makelabel##1{\hss\llap{\upshape##1}}}\fi}
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% REFERENCES

\def\refname{\uppercase{BIBLIOGRAFIA}}
\def\bibname{\uppercase{BIBLIOGRAFIA}}


%      Change the font of `References' head.
\def\thebibliography#1{
       \chapter*\refname   %%%%%\section*{\series m\scshape\refname}%
%      Now we need to reset the running heads because we don't
%      wan't them to contain the font reference \series m\scshape.
  \edef\@tempa{{\noexpand\@mkboth{\refname}{\refname}}}%
  \@tempa
  \normalfont\labelsep .5em\relax
  \global\def\@listi{\leftmargin 0pt
                 \parsep 1.5ex plus 1pt \itemsep 0.7ex plus 1pt}
  \list{[\@arabic\c@enumi]\quad}{\settowidth\labelwidth{[#1]\quad}%
  \leftmargin\labelwidth \advance\leftmargin-\labelsep \advance\leftmargin -5mm
  \usecounter{enumi}}%
  \sloppy
  \sfcode`\.\@m}

\def\@bibitem#1{\item\if@filesw \immediate\write\@auxout
       {\string\bibcite{#1}{\the\c@enumi}}\smallskip\fi}
      
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAKETITLE DEFINITIONS

%%
%% Maketitle
%%
\def\@maketitle{%
  %%
  %% PUC Maketitle
  %%
  \if@pucformat
    %%
    %% First page
    %%
    \clearpage  \thispagestyle{empty}
    \begingroup
      \normalfont\normalsize
      \topskip0\p@  %
      \advance\topskip-\headsep \advance\topskip-\headheight
      \vskip12\p@\@plus12\p@
      \vspace*{-20mm}
      %% University/School/Department
      \vtop{%
        \noindent
        % --- Draw vertical left edge (reference margin) ---
        \raisebox{0mm}[0em][0em]{%
          \rule[-\textheight]{.0pt}{\textheight}}\\[-\normalbaselineskip]
        % --- Draw horizontal top edge (reference margin) ---
        \raisebox{0mm}[0em][0em]{%
          \rule[0pt]{\textwidth}{.0pt}}\\[-\normalbaselineskip]
        % --- Draw vertical decorative line ---
        \hspace*{80pt}%
        % Note: Must use a trailing '%'
        % otherwise a small space will be added due to the line feed.
        \vspace*{-4mm}%
        \setlength{\auxdist}{\textheight}%
        \addtolength{\auxdist}{19mm}%
        \raisebox{4mm}[0em][0em]{%
          \rule[-\auxdist]{.5pt}{\auxdist}}\\[-0\normalbaselineskip]
        \hspace*{-4mm}% shif left half 13mm-off-margin
        \parbox{80pt}
        {\centering %\rule[0em]{80pt}{1ex}\\
          \if \pdftex@true 1% Use PDF version if using pdflatex
            \includegraphics*[height=30.38mm,width=23mm, viewport=0 0 24 31]{Figures/LogoUC.pdf}
            \\[.2\normalbaselineskip]
          \else% Use PS version by default (dvips).
            \includegraphics*[width=23mm,height=30.38mm]{Figures/LogoUC.ps}\\[.2\normalbaselineskip]
          \fi
        }%
        \hspace{7.5mm}% shift right to compensante left-shift and 13mm-off-margin
        \hspace{20pt}%
        \parbox{.75\textwidth}{%parbox 2
        \@university\\
        \@school%\\
        \ifx\@empty\@department {}%{Department of .........}
        \else{\\\@department}\fi}\\ %end parbox 2
        % --- Draw horizontal decorative line ---
        \setlength{\auxdist}{\textwidth}%
        \addtolength{\auxdist}{13mm}%
        \addtolength{\auxdist}{15mm}%
        \hspace*{-13mm}%
        \rule[-3mm]{\auxdist}{.5pt}
      }%
      \vskip105\p@\@plus24\p@
      %% Title
      \setlength{\auxdist}{\textwidth}%
      \addtolength{\auxdist}{-120pt}%
      \addtolength{\auxdist}{15mm}%
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{\auxdist}{\centering \noindent
          \uppercasenonmath{\@title}
          \bfseries\Large
          \@title\@@par}%
      }%
      \prevdepth\dimen@i
      \vskip65\p@%
      %% Author(s)
      \ifx\@empty\authors\else
        \vtop{\andify\authors
          {%
          \hspace{100pt}%
          \parbox[t]{\auxdist}{\centering \noindent
          {\bfseries\large\MakeUppercase\authors}\@@par}%
          }%
        }\relax%
        \prevdepth\dimen@i
      \fi
      \vskip15\p@\@plus12\p@
      %% Degree
      \prepresentedto
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{.75\textwidth}{
          \noindent
          Thesis submitted to the Office of Research and Graduate Studies\\ 
      in partial fulfillment of the requirements for the degree of\\
          \ifx\@empty\@degree {.........}\else\@degree\fi}%
        }
      \vskip10\p@\@plus14\p@
      %% Advisors
      \prepresentedto
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{.75\textwidth}{%
          \noindent
             Advisor:
          {
          \ifx\@empty\@advisorA {.........}\else{\uppercase\@advisorA}\fi\\%
          \ifx\@empty\@advisorB {.........}\else{\uppercase\@advisorB}\fi}}%
      }
      \vskip5\p@\@plus14\p@
      %% Date
      \vfill
      \hspace{100pt}%
      \parbox[t]{.75\textwidth}{
        \noindent
        \rm Santiago de Chile, \ifx\@empty\@date {\MoYr}\else\@date\fi
      }%
      \vskip5\p@\@plus14\p@
      \hspace{100pt}%
      \parbox[t]{.75\textwidth}{
        \noindent
        \copyrightline}%
    \endgroup
    \clearpage  \thispagestyle{empty}
    %%
    %% Second page
    %%
    \cleardoublepage  \thispagestyle{empty}
    \begingroup
      \normalfont\normalsize
      \topskip0\p@  %
      \advance\topskip-\headsep \advance\topskip-\headheight
      \vskip12\p@\@plus12\p@
      \vspace*{-20mm}
      %% University/School/Department
      \vtop{%
        \noindent
        % --- Draw vertical left edge (reference margin) ---
        \raisebox{0mm}[0em][0em]{%
          \rule[-\textheight]{.0pt}{\textheight}}\\[-\normalbaselineskip]
        % --- Draw horizontal top edge (reference margin) ---
        \raisebox{0mm}[0em][0em]{%
          \rule[0pt]{\textwidth}{.0pt}}\\[-\normalbaselineskip]
        % --- Draw vertical decorative line ---
        \hspace*{80pt}%
        % Note: Must use a trailing '%'
        % otherwise a small space will be added due to the line feed.
        \vspace*{-4mm}%
        \setlength{\auxdist}{\textheight}%
        \addtolength{\auxdist}{19mm}%
        \raisebox{4mm}[0em][0em]{%
          \rule[-\auxdist]{.5pt}{\auxdist}}\\[-0\normalbaselineskip]
        \hspace*{-4mm}% shif left half 13mm-off-margin
        \parbox{80pt}
        {\centering %\rule[0em]{80pt}{1ex}\\
          \if \pdftex@true 1% Use PDF version if using pdflatex
            \includegraphics*[height=30.38mm,width=23mm, 
              viewport=0 0 24 31]{Figures/LogoUC.pdf}\\[.2\normalbaselineskip]
          \else% Use PS version by default (dvips).
            \includegraphics*[width=23mm,height=30.38mm]{Figures/LogoUC.ps}\\[.2\normalbaselineskip]
          \fi
        }%
        \hspace{7.5mm}% shif right to compensante left-shift and 13mm-off-margin
        \hspace{20pt}%
        \parbox{.75\textwidth}{%
          \@university\\
          \@school%\\
          \ifx\@empty\@department {}%{Department of .........}
          \else{\\\@department}\fi}\\%
        % --- Draw horizontal decorative line ---
        \setlength{\auxdist}{\textwidth}%
        \addtolength{\auxdist}{13mm}%
        \addtolength{\auxdist}{15mm}%
        \hspace*{-13mm}%
        \rule[-3mm]{\auxdist}{.5pt}
      }%
      \vskip65\p@\@plus24\p@ % Vertical skip before title
      %% Title
      \setlength{\auxdist}{\textwidth}%
      \addtolength{\auxdist}{-120pt}%
      \addtolength{\auxdist}{15mm}%
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{\auxdist}{\centering \noindent
          \uppercasenonmath{\@title}
          \bfseries\Large%
          \@title\@@par}%
      }%
      \prevdepth\dimen@i
      \vskip35\p@ % Vertical skip after title
      %% Author(s)
      \ifx
        \@empty\authors
      \else
        \vtop{\andify\authors
          {%
            \hspace{100pt}%
            \parbox[t]{\auxdist}{\centering \noindent
              {\bfseries\large\MakeUppercase\authors}\@@par}%
          }%
        }\relax%
        \prevdepth\dimen@i
      \fi
      \vskip10\p@\@plus12\p@
      %% Members of the Committee
      \prepresentedto
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{.75\textwidth}{%
          \noindent
          Members of the Committee:\\
          {\normalsize
          \ifx\@empty\@advisorA {.........}\\\else{\uppercase\@advisorA}\\\fi
          %\ifx\@empty\@advisorB {.........}\\\else{\uppercase\@advisorB}\\\fi
          \ifx\@empty\@committeememberA {.........}\\\else{\uppercase\@committeememberA}\\\fi
          \ifx\@empty\@committeememberB {}\else{\uppercase\@committeememberB}\\\fi
          \ifx\@empty\@guestmemberA {.........}\\\else{\uppercase\@guestmemberA}\\\fi
          \ifx\@empty\@guestmemberB {}\else{\uppercase\@guestmemberB}\\\fi
          \ifx\@empty\@ogrsmember {}\else{\uppercase\@ogrsmember}\fi}
        }%
      }%
      \vskip5\p@\@plus14\p@
      %% Degree
      \prepresentedto
      \vtop{%
        \hspace{100pt}%
        \parbox[t]{.75\textwidth}{
          \noindent
          %Thesis submitted to the Office of Research and Graduate Studies\\
          %in partial fulfillment of the requirements for the degree of\\
          Thesis submitted to the Office of Research and Graduate Studies\\ 
      in partial fulfillment of the requirements for the degree of\\
          \ifx\@empty\@degree {.........}\else\@degree\fi}%
      }%
      \vskip10\p@\@plus14\p@
      %% Date
      \vfill
      \hspace{100pt}%
      \parbox[t]{.75\textwidth}{
        \noindent
        \rm Santiago de Chile, \ifx\@empty\@date {\MoYr}\else\@date\fi
      }%
      \vskip5\p@\@plus14\p@
      \hspace{100pt}%
      \parbox[t]{.75\textwidth}{
        \noindent
        \copyrightline}%
    \endgroup
    \clearpage  \thispagestyle{empty}
  \fi
  %%
  %% X Maketitle
  %%
  \if@xformat
    %%
    %% First page
    %%
    \clearpage \thispagestyle{empty}
    \begingroup
      \normalfont\normalsize
      \topskip0\p@  %
      \advance\topskip-\headsep \advance\topskip-\headheight
      \vskip12\p@\@plus12\p@
      \vspace*{-20mm}
      %% University/School/Department
      \vtop{%
        \noindent
        \hspace*{-7.5mm}% shif left half 13mm-off-margin
        \parbox{80pt}
        {\centering %\rule[0em]{80pt}{1ex}\\
          \includegraphics*[height=25.00mm]{Figures/LogoX.jpg}
          \\[.2\normalbaselineskip]
        }%
        \hspace{7.5mm}% shift right to compensante left-shift and 13mm-off-margin
        \hspace{20pt}%
        \parbox{.75\textwidth}{}\\ % parbox 2
      }%
      \vskip75\p@\@plus24\p@
      %% Degree
      \begin{center} 
        {Th\`ese pr\'esent\'ee pour obtenir le grade de} 
      \end{center}
      \vspace{.5mm}
      \begin{center} 
        {{\bfseries\Large\@degree}\@@par} 
      \end{center}
      \vspace{2mm}
      \begin{center} 
        {Sp\'ecialit\'e:} 
      \end{center}
      \vspace{.5mm}
      \begin{center} 
        {\bfseries\Large Math\'ematiques Appliqu\'ees} 
      \end{center}
      \vspace{2mm}
      %% Author
      \begin{center} 
        {par} 
      \end{center}
      \vspace{0.5mm}
      \begin{center} 
        {{\bfseries\Large\authors}\@@par} 
      \end{center}
      \vspace{20mm}
      %% Title
      \begin{center}
      \parbox[t]{.95\textwidth}{\begin{center} 
        {\uppercasenonmath{\@title} \LARGE\@title\@@par} 
      \end{center}} \end{center}
      \vspace{20mm}
      %% Date and Members of the Committee
      \begin{center} 
        {Soutenue le \mbox{\@mdate} devant le jury compos\'e de:} 
      \end{center}
      \vspace{.5mm}
      \begin{center}
        \begin{tabular}{lll}
        Juan C. DE LA LLERA && Examinateur et rapporteur \\
        Mar{\'\i}a C. DEPASSIER && Examinateur et rapporteur \\
        Mario DUR\'AN && Co-directeur de th\`ese \\
        Jean-Claude N\'ED\'ELEC && Directeur de th\`ese \\
        Jaime ORTEGA && Examinateur et rapporteur \\
        Cristian VIAL && Pr\'esident du jury \\
        \end{tabular}
      \end{center}
      \vspace{15mm}
      %% Copyright
      \begin{center}
        \copyrightline
      \end{center}
    \endgroup
    \clearpage  \thispagestyle{empty}
  \fi
  %%
  %% Dedication
  %%
  \ifx
    \@empty\@dedication {}%if not defined or empty do nothing
  \else
    \cleardoublepage  \thispagestyle{empty}
    \begingroup
      ~\vspace*{.74\textheight}\\[-\normalbaselineskip]%
      \mbox{}\hspace*{0.2\textwidth}%
      \parbox[t]{0.8\textwidth}{\centering%
        {\em \@dedication}}
    \endgroup
    \clearpage \thispagestyle{empty}
  \fi%
  %%
  %% Epigram
  %%
  \ifx
    \@empty\@epigram {}%if not defined or empty do nothing
  \else
    \cleardoublepage  \thispagestyle{empty}
    \begingroup
      %~\vspace*{.62\textheight}\\[-\normalbaselineskip]%
      ~\vspace*{.74\textheight}\\[-\normalbaselineskip]%
      \mbox{}\hspace*{0.0\textwidth}%
      \parbox[t]{1.0\textwidth}{\centering%
        {\em \@epigram}}
    \endgroup
    \clearpage \thispagestyle{empty}
  \fi%
}% end maketitle

%%
%% Maketitle definitions
%%
\def\mdate#1{\def\@mdate{{#1}}}
\def\@mdate{}
\def\version#1{\def\@version{{#1}}}
\version{0}
%
\def\university#1{\def\@university{{\normalfont#1}}}
\if@pucformat
  \university{PONTIFICIA UNIVERSIDAD CATOLICA DE CHILE} % originally \large
\fi
\if@xformat
  \university{SCHOOL OF ENGINEERING} % originally \large
\fi
%
\def\school#1{\def\@school{{\normalfont#1}}}
\if@pucformat
  \school{SCHOOL OF ENGINEERING} % originally \large
\fi
\if@xformat
  \school{Centre de Math\'ematiques Appliqu\'ees} % originally \large
\fi
%
\def\degree#1{\def\@degree{{\normalfont#1}}}
\if@pucformat
  \degree{Mag\'ister en Ciencias de la Ingenier\'ia}
\fi
\if@xformat
  \degree{\bf Docteur de l'\'Ecole Polytechnique}
\fi
%
\def\facultyto#1{\def\@facultyto{{\normalfont\rm#1}}}
\facultyto{{\rm School of Engineering}}
%
\def\department#1{\def\@department{{\normalfont\rm#1}}}
\def\@department{}
%
\def\faculty#1{\def\@faculty{{\normalfont\rm#1}}}
\def\@faculty{}
%
\def\advisorA#1{\def\@advisorA{{\normalfont\rm#1}}}
\def\@advisorA{}
%
\def\advisorB#1{\def\@advisorB{{\normalfont\rm#1}}}
\def\@advisorB{}
%
\def\committeememberA#1{\def\@committeememberA{{\normalfont\rm#1}}}
\def\@committeememberA{}
%
\def\committeememberB#1{\def\@committeememberB{{\normalfont\rm#1}}}
\def\@committeememberB{}
%
\def\guestmemberA#1{\def\@guestmemberA{{\normalfont\rm#1}}}
\def\@guestmemberA{}
%
\def\guestmemberB#1{\def\@guestmemberB{{\normalfont\rm#1}}}
\def\@guestmemberB{}
%
\def\ogrsmember#1{\def\@ogrsmember{{\normalfont\rm#1}}}
\def\@ogrsmember{}
%
\def\date#1{\def\@date{{\normalfont\rm#1}}}
\def\@date{}
%
\def\copyrightname#1{\def\@copyrightname{{\scshape#1}}}
\def\@copyrightname{}
%
\def\copyrightyear#1{\def\@copyrightyear{{\normalfont\footnotesize#1}}}
\def\@copyrightyear{}
%
\def\copyrightline{%
    {\footnotesize \raisebox{.2ex}{$\copyright$} %${}^{\hbox{\copyright}}$
    \@copyrightyear, %
    \ifx\@copyrightname\empty{..........}\else
    {\@copyrightname}\fi%
    }}%
%
\def\prepresentedto{\vskip1.75pc}
%
\def\subject#1{\def\@subject{{\normalfont\rm#1}}}
\def\@subject{}
%
\def\shortauthors{}
\def\shorttitle{}
%
\def\dedication#1{\def\@dedication{#1}}
\def\@dedication{}
%
\def\epigram#1{\def\@epigram{#1}}
\def\@epigram{}
%

%%
%% Create maketitle cover page
%%
\def\maketitle{\par
  \@topnum\z@% this prevents figures from falling at the top of page 1
  \ifx\@empty\shortauthors\let\shortauthors\shorttitle\fi
  \begingroup
  \@maketitle
  \endgroup
  \andify\shortauthors
  \thispagestyle{headings}%
  \c@footnote\z@
%
%  the following commands free up memory for small systems
%  once \maketitle is over
%  but keep authors and title for future use
%
  \def\do##1{\let##1\relax}%
  \do\maketitle \do\@maketitle
  \do\address \do\@xaddress
  \do\email \do\@xemail \do\curraddr \do\@xcurraddr
  \do\department \do\@department
  \do\faculty \do\@faculty
  \do\degree \do\@degree
  \do\subject \do\@subject
  \do\date \do\@date
  \do\copyrightyear \do\@copyrightyear
}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAKE RESUMEN & ABSTRACT DEFINITIONS

%For Master's thesis
\newcommand{\MScResumen}[2]{
\chapter*{RESUMEN}
#1

~\vfill {\bf Palabras Claves:} \parbox[t]{.75\textwidth}{#2}
}

\newcommand{\MScAbstract}[2]{
\chapter*{ABSTRACT}
#1

~\vfill {\bf Keywords:} \parbox[t]{.75\textwidth}{#2}
}

%For PhD thesis
\newcommand{\PhDResumen}[1]{
\noindent\uppercase{\@university}\\
\uppercase{ESCUELA DE INGENIER\'IA}\\

\begin{center}
\uppercase{\textbf{Comunicaciones Inal\'ambricas Energ\'eticamente Eficientes}}
\vspace{3mm}

Tesis enviada a la Direcci\'on de Investigaci\'on y Postgrado en cumplimiento parcial de los requisitos para el grado de Doctor en Ciencias de la Ingenier\'ia.
\vspace{3mm}

\uppercase{\textbf{FERNANDO ERNESTO ROSAS DE ANDRACA}}%\MakeUppercase\author
\vspace{3mm}


\textbf{RESUMEN}\addcontentsline{toc}{chapter}{RESUMEN}
\vspace{3mm}
\end{center}

#1
\vspace{15mm}

\noindent Miembros de la Comisi\'on de Tesis Doctoral:\\
{\normalsize
\ifx\@empty\@advisorA {.........}\\\else{\uppercase\@advisorA}\\\fi
%\ifx\@empty\@advisorB {.........}\\\else{\uppercase\@advisorB}\\\fi
\ifx\@empty\@committeememberA {.........}\\\else{\uppercase\@committeememberA}\\\fi
\ifx\@empty\@committeememberB {}\\\else{\uppercase\@committeememberB}\\\fi
\ifx\@empty\@guestmemberA {.........}\\\else{\uppercase\@guestmemberA}\\\fi
\ifx\@empty\@guestmemberB {}\\\else{\uppercase\@guestmemberB}\\\fi
\ifx\@empty\@ogrsmember {}\else{\uppercase\@ogrsmember}\fi
\vspace{1mm}

\noindent Santiago de Chile, Diciembre, 2012%\ifx\@empty\@date {\MoYr}\else\@date\fi
}
}

\newcommand{\PhDAbstract}[1]{
\noindent\@university\\
\uppercase{ESCUELA DE INGENIER\'IA}\\

\begin{center}
\MakeUppercase\@title
\vspace{3mm}

Thesis submitted to the Office of Research and Graduate Studies in partial fulfillment of the requirements for the Degree of Doctor in Engineering Sciences by
\vspace{3mm}

\uppercase{\textbf{FERNANDO ERNESTO ROSAS DE ANDRACA}} %\MakeUppercase\author
\vspace{3mm}


\textbf{ABSTRACT}\addcontentsline{toc}{chapter}{ABSTRACT}
\vspace{3mm}
\end{center}

#1
\vspace{15mm}

\noindent Members of the Doctoral Thesis Committee:\\
{\normalsize
\ifx\@empty\@advisorA {.........}\\\else{\uppercase\@advisorA}\\\fi
%\ifx\@empty\@advisorB {.........}\\\else{\uppercase\@advisorB}\\\fi
\ifx\@empty\@committeememberA {.........}\\\else{\uppercase\@committeememberA}\\\fi
\ifx\@empty\@committeememberB {}\\\else{\uppercase\@committeememberB}\\\fi
\ifx\@empty\@guestmemberA {.........}\\\else{\uppercase\@guestmemberA}\\\fi
\ifx\@empty\@guestmemberB {}\\\else{\uppercase\@guestmemberB}\\\fi
\ifx\@empty\@ogrsmember {}\else{\uppercase\@ogrsmember}\fi
\vspace{1mm}

\noindent Santiago de Chile, December, 2012%\ifx\@empty\@date {\MoYr}\else\@date\fi
}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ADDRESS DEFINITIONS

%% v1.0
%%
%% This is exactly as in amsbook.cls.
%% \addresses will be a list of things like "\author{Electron Blues}
%% \address{PUC} \email{eblues} \author{Math Monster} \address{PUC}
%% \email{mmonster}", and \@setaddresses is used to define the way
%% \author,\address,etc do the printing when \addresses is expanded.
%%

\def\@setaddresses{\par
  \nobreak \begingroup \footnotesize
  \def\author##1{\nobreak\addvspace\bigskipamount}%
  \def\\{\unskip, \ignorespaces}%
  \interlinepenalty\@M
  \def\address##1##2{\begingroup
    \par\nobreak %\addvspace\medskipamount\indent
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    {\noindent \scshape\ignorespaces##2}\par\endgroup}%
  \def\curraddr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent{\itshape Current address}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      ##2\par\endgroup}}%
  \def\email##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent{\itshape E-mail address}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par\endgroup}}%
  \addresses
  \endgroup
}

% Month and year
\def\MoYr{%
    \ifcase\month
    \or January\or February\or March\or April\or May\or June%
    \or July\or August\or September\or October\or November\or December%
    \fi%
    \space\number\year}%

% We just wanted to lower the caption size to 10pt

\def\@captionheadfont{\scshape}
\def\@captionfont{\normalfont\small}

%
% Numbering in figures, tables, and equations
%
\ps@headings
\numberwithin{figure}{chapter}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\numberwithin{table}{chapter}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}
\numberwithin{equation}{chapter}
\renewcommand \theequation
    {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of XPucThesis.cls

\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
