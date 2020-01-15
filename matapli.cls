\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{matapli}[2018/08/23 Classe pour la revue MATAPLI, V0.0]

% classe de base
\LoadClass[twoside, 10pt]{book}

% packages charges
\RequirePackage{latexsym,amssymb,amsmath,psfrag,subfig,amsthm, amscd,mathtools}
\RequirePackage[cam,a4,center]{crop}

\RequirePackage[french]{babel}
\RequirePackage{url}
\RequirePackage[multiple]{footmisc}
\frenchbsetup{AutoSpaceFootnotes=false}
\selectlanguage{french}
\RequirePackage[sectionbib]{chapterbib}
\RequirePackage{enumitem}

\RequirePackage[pdftex]{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr,fancybox,url}
% \RequirePackage{epic}
\RequirePackage{curves}
\RequirePackage{multicol}
\RequirePackage{marvosym}
\RequirePackage{calc}
\RequirePackage{booktabs}
\RequirePackage{pdflscape}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[colorlinks = true,
linkcolor = principale,
urlcolor  = principale,
citecolor = principale,
anchorcolor = principale,
unicode]{hyperref}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\RequirePackage{eurosym,ifsym,wasysym}
\RequirePackage{ifthen}
\RequirePackage{titlesec, titletoc,blindtext}
\RequirePackage{etoolbox}
\RequirePackage{caption}



%%%%%%%% taille des pages %%%%%%
\setlength{\paperheight}{238mm}
\setlength{\paperwidth}{170mm}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\topmargin}{-10mm}
\setlength{\headheight}{ 12 pt }
\setlength{\headsep}{8mm}
\setlength{\textheight}{190mm}
\setlength{\textwidth}{125mm}
\setlength{\marginparsep}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\footskip}{10mm}
%\renewcommand{\baselinestretch}{1.15 }%1.18

% les couleurs definies
\definecolor{gris}{gray}{0.8}
\definecolor{grisclair}{gray}{0.90}
\definecolor{principale}{RGB}{93,138,168}
\definecolor{chapitre}{RGB}{0,0,0}

% \newcommand{\Q}{\noindent {\it Question : }}
%\newcommand{\R}{\noindent {\it R\'eponse : }}
%\newcommand{\Z} {\mathbb{Z}}
%\newcommand\chancery[1]{{\fontfamily{pzc}\selectfont #1}}
%\newcommand\garamond[1]{{\fontfamily{pgm}\selectfont #1}}
\renewcommand{\labelenumi}{ \theenumi .}


\newcommand{\numero}{XXX}
\newcommand{\mois}{Mois Année}


% formatage des sections, chapitre, TOC

%\titleformat{\chapter}[hang]{\Large\bfseries}{}{0pt}{\Large\bfseries}


%%%%%%% définition de l'apparence du chapitre %%%%%%%

\def\chapterFont{}

\newcommand\chapformat[1]{%
  \begin{tikzpicture}[overlay, remember picture]
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-2in)$);
    \fill[white] ($(current
    page.north east)+(-1.5,-0.5in)$) circle (1);
    \fill[white] ($(current
    page.north east)+(-1,-1.3in)$) circle (0.7);
    \fill[white] ($(current
    page.north east)+(-2.3,-1.7in)$) circle (0.5);
    \node[anchor= west, align=left,text width=\linewidth,font=\Huge\bfseries,color=white,
    execute at begin node=\setlength{\baselineskip}{1.5em}] at
    ($(current page.north west)+(1,-1in)$)
    {\chapterFont #1 };
  \end{tikzpicture}
}

\titleformat{\chapter}{\normalfont}{}{0pt}{\chapformat}


\contentsmargin{0pt}
\titlecontents{chapter}[0pt]
{\large}
{\rmfamily\scshape}
{}
{~---~\thecontentspage}
[\vspace{2pt}]

\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{titreHDR}}{}{}

% figure Label
\DeclareCaptionLabelSeparator{tiret}{ --- }
\DeclareCaptionFont{matapli}{\color{principale}\bfseries\scshape}
\captionsetup[figure]{labelfont={matapli},name={Figure},textfont=it,labelsep=tiret}
\captionsetup[tab]{labelfont={matapli},name={Table},textfont=it,labelsep=tiret}

% commande titre qui est un \chapter ameliore
% argument entre [] pour titre court pour header \titre[titre
% court]{titre long}
\newcommand{\titre}[2][]
{
  % if the optional argument is empty
  \ifthenelse{\equal{#1}{}}%
  {%
    \def\titreHeadMark{#2}%
  }%
  {%
    \def\titreHeadMark{#1}%
  }%
  \chapter[\titreHeadMark]{#2}
}


\newenvironment{soustitre}{%
  \tcbset{%
    arc=0pt,outer
    arc=0pt,colback=gray!10!white,colframe=principale,
    boxsep=0pt,left=10pt,right=10pt,top=8pt,bottom=10pt,
    bottomtitle = 3pt, toptitle=3pt,
    boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt}
  \medskip
  \begin{tcolorbox}[fontupper=\bfseries\scshape,halign=center]}%
  {\end{tcolorbox}\medskip
}

\newcommand\communication[2]{%
\begin{center}
\textit{Communiqué par :} #1\\[0.7em]
#2
\end{center}
}

% bloc

\newenvironment{bloc}[1][]{%
  \tcbset{%
    arc=0pt,outer
    arc=0pt,colback=gray!10!white,colframe=principale,
    boxsep=0pt,left=10pt,right=10pt,top=8pt,bottom=10pt,
    bottomtitle = 3pt, toptitle=3pt,
    boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt,
  fonttitle=\scshape\bfseries}
  \medskip
  \begin{tcolorbox}[halign=center,title={#1}]}%
  {\end{tcolorbox}\medskip
}


% commande orateur
\newcommand{\orateur}[2]{\begin{center}
    {\large{\bf{\sffamily #1}}}\\
    {#2}
  \end{center}}


% definition des entetes et pied de page
\usetikzlibrary{calc}
\renewcommand{\headrulewidth}{0pt}


\fancyhead{}
\fancyhead[E]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-0.8in)$);
    \node[anchor=north west, text=white, font=\Large\scshape,
    minimum size=1in, inner xsep=5mm] at (current page.north
    west) {\leftmark};
    \node[anchor=north east, minimum size=1in, inner
    xsep=5mm] at (current page.north east)
    {\rightmark};
    % node[minimum width=\x2-\x1, minimum height=2cm,
    % draw, rectangle, fill=blue!20, anchor=north west,
    % align=left, text width=\x2-\x1] at ($(current
    % page.north west)$) {\Large\bfseries \quad #1};
  \end{tikzpicture}
  % \rightmark
}
\fancyhead[O]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-0.8in)$);
    \node[anchor=north east, text=white, font=\Large\scshape,
    minimum size=1in, inner xsep=5mm] at (current page.north
    east) {\leftmark};
    \node[anchor=north west, minimum size=1in, inner
    xsep=5mm] at (current page.north west)
    {\rightmark};
    % node[minimum width=\x2-\x1, minimum height=2cm,
    % draw, rectangle, fill=blue!20, anchor=north west,
    % align=left, text width=\x2-\x1] at ($(current
    % page.north west)$) {\Large\bfseries \quad #1};
  \end{tikzpicture}
  %   % \leftmark
}
\fancyfoot{}
\fancyfoot[RO]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.south east)-(-0.1\hoffset,-0.27in)$);
    \node[anchor=south east, text=white, font=\Large\scshape,
    inner
    xsep=5mm] at (current page.south
    east) {\thepage};
  \end{tikzpicture}
  % \thepage
}
\fancyfoot[LE]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.south east)-(-0.1\hoffset,-0.27in)$);
    \node[anchor=south west, text=white, font=\Large\scshape,
    inner
    xsep=5mm] at (current page.south
    west) {\thepage};
  \end{tikzpicture}
  % \thepage
}

\fancypagestyle{titreHDR}{\fancyhead{}
  \fancyfoot{}
  \fancyfoot[RO]{
    \begin{tikzpicture}[overlay, remember picture]%
      \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
      page.south east)-(-0.1\hoffset,-0.27in)$);
      \node[anchor=south east, text=white, font=\Large\scshape,
      inner
      xsep=5mm] at (current page.south
      east) {\thepage};
    \end{tikzpicture}
    % \thepage
  }
  \fancyfoot[LE]{
    \begin{tikzpicture}[overlay, remember picture]%
      \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
      page.south east)-(-0.1\hoffset,-0.27in)$);
      \node[anchor=south west, text=white, font=\Large\scshape,
      inner
      xsep=5mm] at (current page.south
      west) {\thepage};
    \end{tikzpicture}
    % \thepage
  }

}


\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{#1}{\sffamily MATAPLI  \no\numero~ --- \mois}}

% definition des theorem
\newtheorem{theorem}{Th{\'e}or{\`e}me}
\newtheorem{lemma}{Lemme}
\newtheorem{corollary}{Corollaire}
\newtheorem{prop}{Propri{\'e}t{\'e}}
\newtheorem{rem}{Remarque}

% commande pour les soutenances
\newcommand\soutenance[4]{\vspace*{-0.5cm}{\par\removelastskip\parskip0pt
    \normalfont\normalsize
    \vskip20pt plus60pt minus3pt
    \penalty-200 \vskip0pt plus -60pt
    \vbox{{\noindent
        \bfseries\ignorespaces#1\unskip}\par\nobreak
      \indent\ignorespaces#4\unskip\par
      \penalty10000  \vskip4pt plus 3pt
      \begin{center}
        \interlinepenalty10000
        {\bfseries\ignorespaces#3\unskip}\par
        \penalty10000  \vskip3pt plus 3pt
        {\slshape\ignorespaces#2\unskip}
      \end{center}}
    \vskip0pt plus6pt \penalty-50
  }}


\renewcommand{\familydefault}{\sfdefault}

%%%% correspondants

\newcommand{\corrsp}[4]{%
  \noindent%
  \begin{empty}
    \small%
    \renewcommand{\arraystretch}{0.9}%
    \begin{minipage}{0.95\columnwidth}
      \setlength{\baselineskip}{0.9\baselineskip}
      {\textbf{#1}\hfill\textit{#2}}\\
      #3\\
      \texttt{\footnotesize #4}
    \end{minipage}
  \end{empty}
}

% Lorsque le nom du lieu et le nom sont trop longs.
\newcommand{\corrspsplit}[4]{%
  \noindent%
  \begin{empty}
    \small%
    \renewcommand{\arraystretch}{0.9}%
    \begin{minipage}{0.95\columnwidth}
      \setlength{\baselineskip}{0.9\baselineskip}
      \textbf{#1}\\
      \hbox to \columnwidth{\hfill\emph{#2}}\\
      #3\\
      \texttt{\footnotesize #4}
    \end{minipage}
  \end{empty}
}

% Pour les mails trop longs
\newcommand{\splitmail}[2]{%
  \hbox to 0.95\columnwidth{\texttt{\footnotesize{#1}}\hfil}\\
  \hbox to 0.95\columnwidth{\hfil\texttt{\footnotesize{@#2}}}%
}


% colloques
\newcommand\colloque[3]{%
\noindent$\blacktriangleright$~\textsc{#1}\\
\textit{#2}\\
\url{#3}\\[0.4em]
}


\AtBeginDocument{\renewcommand{\contentsname}{Sommaire}}
