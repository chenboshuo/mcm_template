%%
%% This is file `mcmthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mcmthesis.dtx  (with options: `class')
%%
%% -----------------------------------
%%
%% This is a generated file.
%%
%% Copyright (C)
%%     2010 -- 2015    by Zhaoli Wang
%%     2014 -- present by Liam Huang
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Liam Huang.
%%
\PassOptionsToPackage{final}{graphicx}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{mcmthesis}
  [2019/11/07 v6.3 The Thesis Template Designed For MCM/ICM]
\typeout{The Thesis Template Designed For MCM/ICM}
\typeout{And changed by chenboshuo/mcm_template}
\def\MCMversion{v6.3}
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\define@boolkey{MCM}[MCM@opt@]{CTeX}[false]{}
\define@boolkey{MCM}[MCM@opt@]{titlepage}[false]{}
\define@boolkey{MCM}[MCM@opt@]{abstract}[true]{}
\define@boolkey{MCM}[MCM@opt@]{sheet}[true]{}
\define@boolkey{MCM}[MCM@opt@]{titleinsheet}[true]{}
\define@boolkey{MCM}[MCM@opt@]{keywordsinsheet}[false]{}
\define@cmdkeys{MCM}[MCM@opt@]{tcn,problem}
\define@key{MCM}{tcn}[0000000]{\gdef\MCM@opt@tcn{#1}}
\define@key{MCM}{problem}[A]{\gdef\MCM@opt@problem{#1}}
\setkeys{MCM}{tcn=0000000,problem=B}

\define@key{mcmthesis.cls}{tcn}[0000000]{\gdef\MCM@opt@tcn{#1}}
\define@key{mcmthesis.cls}{problem}[A]{\gdef\MCM@opt@problem{#1}}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{titlepage}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{abstract}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{sheet}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{titleinsheet}{}
\define@boolkey{mcmthesis.cls}[MCM@opt@]{keywordsinsheet}{}
\newif\if@mcm@ebook\@mcm@ebookfalse

\MCM@opt@sheettrue
\MCM@opt@titlepagefalse
\MCM@opt@titleinsheettrue
\MCM@opt@keywordsinsheetfalse
\MCM@opt@abstracttrue

\newcommand{\mcmsetup}[1]{\setkeys{MCM}{#1}}
\DeclareOption{ebook}{\@mcm@ebooktrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% \ProcessOptionsX\relax
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{article}
\newcommand{\team}{Team \#\ \MCM@opt@tcn}
\RequirePackage{fancyhdr, fancybox}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage[toc, page, title, titletoc, header]{appendix}
\RequirePackage{paralist}
\RequirePackage{amsthm, amsfonts}
\RequirePackage{amsmath, bm}
\RequirePackage{amssymb, mathrsfs}
\RequirePackage{latexsym}
\RequirePackage{longtable, multirow, hhline, tabularx, array}
\RequirePackage{flafter}
\RequirePackage{pifont, calc}
\RequirePackage{colortbl, booktabs}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{berasans}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[final]{hyperref}
\RequirePackage{ifpdf, ifxetex}
\RequirePackage{palatino}
\RequirePackage{siunitx} % 物理单位
\RequirePackage{float}  % 浮动体
\RequirePackage{cleveref}  % 智能自动化交叉引用
\RequirePackage{tikz} % 绘图包
\RequirePackage{mathtools} % dcase case*命令
\RequirePackage{ifdraft} % ifdraft command
\RequirePackage{paracol} % paracol command
\ifdraft{
  \RequirePackage{ctex} % paracol command
}

% todo标签
\RequirePackage[obeyDraft]{todonotes}
\setuptodonotes{inline, color=blue!30}
% todo notes
\let\todoRawVersion=\todo
\newcommand\TODO[2][]{
  \ifdraft{
    \phantomsection
    \addcontentsline{toc}{subsubsection}{[TODO] \thinspace #2}
  }{}
  \todoRawVersion[#1]{#2}
}

\ifMCM@opt@CTeX
\else
  \RequirePackage{environ}
\fi
\ifpdf
  \RequirePackage{graphicx}
  \RequirePackage{epstopdf}
\else
  \ifxetex
    \RequirePackage{graphicx}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi
\RequirePackage{xcolor}
\ifpdf
  \hypersetup{hidelinks}
\else
  \ifxetex
    \hypersetup{hidelinks}
  \else
    \hypersetup{dvipdfm, hidelinks}
  \fi
\fi
% \geometry{a4paper, margin = 1.2in}

\if@mcm@ebook
  \RequirePackage[papersize={108mm,144mm},
      margin=2mm,
      bottom=3mm
    ]{geometry}
\else
  \RequirePackage[left=1in,
    right=0.75in,
    top=1in,
    bottom=1in]{geometry}
\fi

\pagestyle{fancy}
\fancyhf{}
\ifdraft{
  \lhead{Draft version}
}{
  \lhead{\small\sffamily \team}
}
\rhead{\small\sffamily Page \thepage\ }
\setlength\parskip{.5\baselineskip}
\renewcommand\tableofcontents{%
    \centerline{\normalfont\Large\bfseries\sffamily\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \vskip 5ex%
    \@starttoc{toc}%
    }
\setcounter{totalnumber}{4}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\graphicspath{{./}{./img/}{./fig/}{./image/}{./figure/}{./picture/}{./pic/}
            {./imgs/}{./figs/}{./images/}{./figures/}{./pictures/}{./pics/}}
\def\maketitle{%
  \let\saved@thepage\thepage
  \let\thepage\relax
  \ifMCM@opt@sheet
  \makesheet
  \fi
  \newpage
  \ifMCM@opt@titlepage
    \MCM@maketitle
  \fi
  \newpage
  \let\thepage\saved@thepage
  % Generate the Table of Contents if it's needed.
  \tableofcontents
  \newpage
  \setcounter{page}{1}
  \pagestyle{fancy}
}
\def\abstractname{Summary}
\ifMCM@opt@CTeX
  \newbox\@abstract%
  \setbox\@abstract\hbox{}%
  \long\def\abstract{\bgroup\global\setbox\@abstract\vbox\bgroup\hsize\textwidth\leftskip1cm\rightskip1cm}%
  \def\endabstract{\egroup\egroup}
  \def\make@abstract{%
    \centerline{\bfseries\abstractname}
    \usebox\@abstract\par
  }
\else
  \RenewEnviron{abstract}{\xdef\@abstract{\expandonce\BODY}}
  \def\make@abstract{%
    \centerline{\bfseries\abstractname}
    \@abstract\par
  }
\fi
\def\keywordsname{Keywords}
\ifMCM@opt@CTeX
  \newbox\@keywords
  \setbox\@keywords\hbox{}
  \def\keywords{\global\setbox\@keywords\vbox\bgroup\noindent\leftskip0cm}
  \def\endkeywords{\egroup}%
  \def\make@keywords{%
   \par\hskip.4cm\textbf{\keywordsname}: \usebox\@keywords\hfill\par
  }
\else
  \NewEnviron{keywords}{\xdef\@keywords{\expandonce\BODY}}
  \def\make@keywords{%
    \par\noindent\textbf{\keywordsname}:
    \@keywords\par
  }
\fi
\newcommand{\headset}{\the\year\\MCM/ICM\\Summary Sheet}
\newcommand{\problem}[1]{\mcmsetup{problem = #1}}
\def\makesheet{%
  \pagestyle{empty}%
  \null%
  \vspace*{-5pc}%
  \begin{center}
  \begingroup
  \setlength{\parindent}{0pt}
    \begin{minipage}[t]{0.33\linewidth}
      \centering
      \textbf{Problem Chosen}\\
      \LARGE\MCM@opt@problem
    \end{minipage}%
    \begin{minipage}[t]{0.34\linewidth}
      \centering
      \bfseries\headset
    \end{minipage}%
    \begin{minipage}[t]{0.33\linewidth}
      \centering
      \textbf{Team Control Number}\\
      \LARGE\MCM@opt@tcn\\[1.8pc]
    \end{minipage}\par
  \rule{\linewidth}{1.5pt}\par
  \endgroup
  \vskip 10pt%
  \ifMCM@opt@titleinsheet
    \normalfont \LARGE \@title \par
  \fi
  \end{center}
\ifMCM@opt@keywordsinsheet
  \make@abstract
  \make@keywords
\else
  \make@abstract
\fi}
\newcommand{\MCM@maketitle}{%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em%
  \ifMCM@opt@abstract%
    \make@abstract
    \make@keywords
  \fi%
}
\def\MCM@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\MCM@memoto{#1}}
\def\MCM@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\MCM@memofrom{#1}}
\def\MCM@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\MCM@memosubject{#1}}
\def\MCM@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\MCM@memodate{#1}}
\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}
\newenvironment{memo}[1][Memorandum]{%
  \pagestyle{plain}%
  \begin{center}
    \LARGE\bfseries\scshape
    #1
  \end{center}
  \begin{description}
    \setlength{\itemsep}{.25ex}
    \setlength{\parskip}{0pt}
    \ifthenelse{\equal{\MCM@memoto}{\relax}}{}{\item [{To:}] \MCM@memoto}
    \ifthenelse{\equal{\MCM@memofrom}{\relax}}{}{\item [{From:}] \MCM@memofrom}
    \ifthenelse{\equal{\MCM@memosubject}{\relax}}{}{\item [{Subject:}] \MCM@memosubject}
    \ifthenelse{\equal{\MCM@memodate}{\relax}}{}{\item [{Date:}] \MCM@memodate}
  \end{description}
  \par\noindent
  \rule[0pt]{\linewidth}{0.1pt}
  \vskip\baselineskip\par
}{%
  \clearpage
  \pagestyle{fancy}%
}
\newtheorem{Theorem}{Theorem}
\newtheorem{Lemma}[Theorem]{Lemma}
\newtheorem{Corollary}[Theorem]{Corollary}
\newtheorem{Proposition}[Theorem]{Proposition}
\newtheorem{Definition}[Theorem]{Definition}
\newtheorem{Example}[Theorem]{Example}
% 假设环境 assumption enironment
\newtheorem{assumption}{Assumption}
% 约束环境
\newtheorem{constraint}{Constraint}
\providecommand{\dif}{\mathop{}\!\mathrm{d}}
\providecommand{\me}{\mathrm{e}}
\providecommand{\mi}{\mathrm{i}}


% 上标文献
\newcommand{\upcite}[1]{$^{\mbox{\scriptsize \cite{#1}}}$}
\newcommand{\supercite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}

% 调整行距
\linespread{1.3}

% symbol list
\RequirePackage[symbols,nogroupskip,sort=none]{glossaries-extra}

% new keys must be defined before use
\glsaddstoragekey{unit}{}{\glossentryunit}
\glsnoexpandfields

\newglossarystyle{symbunitlong}{%
  \setglossarystyle{long3col}% base this style on the list style
  \renewenvironment{theglossary}{% Change the table type --> 3 columns
    \begin{longtable}{lp{\glsdescwidth}>{\centering\arraybackslash}p{2cm}}%
  }{
    \end{longtable}
  }%
  %
  \renewcommand*{\glossaryheader}{%  Change the table header
    \toprule[1.5pt]
    \bfseries Symbol & \bfseries Description & \bfseries Unit\\\hline
    \endhead
    \bottomrule[1.5pt]
    \vspace{2pt}
    \endfoot
  }%
  \renewcommand*{\glossentry}[2]{%  Change the displayed items
    \glstarget{##1}{\glossentryname{##1}} %
    & \glossentrydesc{##1}% Description
    & \glossentryunit{##1}  \tabularnewline
  }%
}

\newglossarystyle{symblong}{%
  \setglossarystyle{long}% base this style on the list style
  \renewenvironment{theglossary}{% Change the table type --> 3 columns
    \begin{longtable}{lp{0.8\textwidth}}%
    % \begin{longtable}{cc}%

    % \begin{longtable}
  }{
    \end{longtable}
  }%
  %
  \renewcommand*{\glossaryheader}{%  Change the table header
    \toprule[1.5pt]
    \bfseries Symbol & \bfseries Description \\\hline
    \endhead
    \bottomrule[1.5pt]
    \vspace{2pt}
    \endfoot
  }%
  \renewcommand*{\glossentry}[2]{%  Change the displayed items
    \glstarget{##1}{\glossentryname{##1}} %
    & \glossentrydesc{##1}% Description
    \tabularnewline
  }%
}
\renewcommand{\glossarysection}[2][]{}


\RequirePackage{newunicodechar}
\newunicodechar{。}{. }
\newunicodechar{，}{, }
\newunicodechar{；}{;}

% 算法环境 algorithm environment
\RequirePackage{algorithm}
% \RequirePackage{clrscode}
\RequirePackage{clrscode3e}
% <- 的定义 definition of <-
\DeclareMathSymbol{\leftarrow}{\mathrel}{symbols}{"20}
\let\gets=\leftarrow
\renewcommand{\Comment}[1][2]{$\hspace*{#1em}\rhd$}

\newcommand{\zhEn}[2]{%
  \ifdraft{%
    \ifx\hfuzz#2\hfuzz%
      \TODO[color=yellow!30]{Translate:#1}%
    \else%
      \begin{paracol}{2}%
        #2%
      \switchcolumn%
        #1%
      \end{paracol}%
    \fi%
  }{#2}
}


\RequirePackage{listings} % lstinline
\RequirePackage{fontspec}
\RequirePackage{ifplatform}
\ifwindows
\else
  \setmonofont{DejaVu Sans Mono}
\fi

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
  print
}

% 绘图包
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{fit}
% \tikzstyle{arrow} = [->,>=stealth]
\tikzset{>=latex}

% reference https://tex.stackexchange.com/questions/107057/adjusting-font-size-with-tikz-picture
% 参数可以修改文字大小
% \tikzset{fontscale/.style = {font=\relsize{#1}}}
\usetikzlibrary{shapes.geometric, arrows}
\usetikzlibrary{calc}
\tikzstyle{flowchartNodeSettiings} = [%
  % minimum width=3cm,
  % minimum height=1cm,
  text centered,
  draw=black,
  % node distance=1.8cm,
  % text width=0.4\textwidth,
  % fontscale=1.2
]
\tikzstyle{startstop} = [%
  rectangle,
  rounded corners,
  flowchartNodeSettiings
]
\tikzstyle{io} = [%
  trapezium,
  trapezium left angle=70,
  trapezium right angle=110,
  flowchartNodeSettiings
]
\tikzstyle{process} = [
  rectangle,
  flowchartNodeSettiings
]
\tikzstyle{decision} = [
  diamond,
  aspect=2,
  % minimum width=5cm,
  % minimum height=1cm,
  text centered,
  draw=black,
  % node distance=3cm,
  % text width=0.3\textwidth,
  % fontscale=1.2
]


\endinput
%%
%% This work consists of these files mcmthesis.dtx,
%%                                   figures/ and
%%                                   code/,
%% and the derived files             mcmthesis.cls,
%%                                   mcmthesis-demo.tex,
%%                                   README,
%%                                   LICENSE,
%%                                   mcmthesis.pdf and
%%                                   mcmthesis-demo.pdf.
%%
%% End of file `mcmthesis.cls'.
