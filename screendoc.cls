\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{screendoc}[2020/06/19 For screen preparation class]

\newlength{\iconsize}
\setlength{\iconsize}{20mm}

\newif\ifphone % Set to true if in phone version

\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{phone}{\phonetrue}
\DeclareOption{screen}{\phonefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt]{report}

\ifphone
    \RequirePackage[paperwidth      = 375pt,
                    paperheight     = 812pt,
                    top             = 20mm,
                    bottom          = 20mm,
                    left            = 8mm,
                    right           = 8mm]{geometry}
\else
    \RequirePackage[paperwidth      = 280.6mm,
                    paperheight     = 214.9mm,
                    top             = 25mm,
                    bottom          = 20mm,
                    left            = 20mm,
                    right           = 20mm]{geometry}
\fi
\RequirePackage[luatex]{hyperref}
\hypersetup{
        pdfpagemode = UseNone,
        bookmarksopen = true,
        colorlinks=true
}

\RequirePackage{fontspec}
\setmainfont[Scale=1.2]{Montserrat}

\RequirePackage[math-style=ISO]{unicode-math}
\setmathfont[Scale=MatchLowercase]{STIX Two Math} 

\ifphone
    \newfontfamily{\titlepagefont}[SizeFeatures = {Size = 50}]{Montserrat SemiBold}
    \newfontfamily{\titlepagemodulefont}[SizeFeatures = {Size = 30}]{Montserrat}
\else 
    \newfontfamily{\titlepagefont}[SizeFeatures = {Size = 100}]{Montserrat SemiBold}
    \newfontfamily{\titlepagemodulefont}[SizeFeatures = {Size = 40}]{Montserrat}
\fi


\newfontfamily{\chapterfont}[SizeFeatures = {Size = 36}]{Montserrat SemiBold}
\newfontfamily{\sectionfont}[SizeFeatures = {Size = 16}]{Montserrat SemiBold}
\newfontfamily{\subsectionfont}[SizeFeatures = {Size = 14}]{Montserrat SemiBold}
\newfontfamily{\subsubsectionfont}[SizeFeatures = {Size = 12}]{Montserrat}
\newfontfamily{\theoremstylefont}[SizeFeatures = {Size = 14}]{Montserrat}

\RequirePackage[english]{babel}

\RequirePackage{xcolor}
% https://coolors.co/98594c-e2af1c-4f007b-7c73bf-077187-d5ecd4-dbe2e6-e5cedc-e8e8ed-fafdf6
\definecolor{theme-redwood}{HTML}{98594c}
\definecolor{theme-goldenrod}{HTML}{e2af1c}
\definecolor{theme-indigo}{HTML}{4f007b}
\definecolor{theme-violet-blue-crayola}{HTML}{7c73bf}
\definecolor{theme-teal-blue}{HTML}{077187}
\definecolor{theme-nyanza}{HTML}{d5ecd4}
\definecolor{theme-gainsboro}{HTML}{dbe2e6}
\definecolor{theme-queen-pink}{HTML}{e5cedc}
\definecolor{theme-platinum}{HTML}{e8e8ed}
\definecolor{theme-baby-powder}{HTML}{fafdf6}

\RequirePackage[pagecolor = theme-baby-powder]{pagecolor}

%%% Titles
\RequirePackage[pagestyles, outermarks]{titlesec}

\ifphone
\titleformat{\chapter}[display]
    {\chapterfont}
        {Week \thechapter.}{.5em}{\filright}
\else
\titleformat{\chapter}
    {\chapterfont}
        {Week \thechapter.}{.5em}{\vspace{2ex}\filright}
\fi

\titleformat{\section}[drop]
    {   \sectionfont\large\filright}
        {\thesection}{0.5em}{}
\titlespacing{\section}
        {15pc}{.5ex plus .1ex minus .2ex}{1pc}

\titleformat{\subsection}[leftmargin]
    {   \subsectionfont\filright}
        {\thesection}{.5em}{}
\titlespacing{\section}
        {15pc}{.5ex plus .1ex minus .2ex}{1pc}

\titleformat{\subsubsection}[leftmargin]
    {   \subsubsectionfont\filright}
        {\thesection}{.5em}{}
\titlespacing{\section}
        {15pc}{.5ex plus .1ex minus .2ex}{1pc}

%%%%% Theorem type environments

\RequirePackage[most]{tcolorbox}

\RequirePackage{amsthm, amsmath, amsfonts}

\theoremstyle{plain}% from 'amsthm'
\newtheorem{thm}{Theorem}% from 'amsthm'
\tcolorboxenvironment{thm}%
{   theorem style=change apart,
    enhanced,
    arc=0mm,
    outer arc=0mm,
    leftrule=5mm,
    rightrule=0mm,
    toprule=0mm,
    bottomrule=0mm,
    left=1mm,
    right=1mm,
    top=2mm,
    colframe=theme-goldenrod,
    colback=theme-platinum,
    coltitle=white,
    fonttitle=\theoremstylefont
}{}

\newtheorem{lem}[thm]{Lemma}% from 'amsthm'
\tcolorboxenvironment{lem}%
{   theorem style=change apart,
    enhanced,
    arc=0mm,
    outer arc=0mm,
    leftrule=5mm,
    rightrule=0mm,
    toprule=0mm,
    bottomrule=0mm,
    left=1mm,
    right=1mm,
    top=2mm,
    colframe=theme-indigo,
    colback=theme-platinum,
    coltitle=white,
    fonttitle=\theoremstylefont
}{}

\newtheorem{prop}[thm]{Proposition}% from 'amsthm'
\tcolorboxenvironment{prop}%
{   theorem style=change apart,
    enhanced,
    arc=0mm,
    outer arc=0mm,
    leftrule=5mm,
    rightrule=0mm,
    toprule=0mm,
    bottomrule=0mm,
    left=1mm,
    right=1mm,
    top=2mm,
    colframe=theme-teal-blue,
    colback=theme-platinum,
    coltitle=white,
    fonttitle=\theoremstylefont
}{}

\newtheorem{cor}[thm]{Corollary}% from 'amsthm'
\tcolorboxenvironment{cor}%
{   theorem style=change apart,
    enhanced,
    arc=0mm,
    outer arc=0mm,
    leftrule=5mm,
    rightrule=0mm,
    toprule=0mm,
    bottomrule=0mm,
    left=1mm,
    right=1mm,
    top=2mm,
    colframe=theme-nyanza,
    colback= theme-platinum,
    coltitle=white,
    fonttitle=\theoremstylefont
}{}

\newtheorem{dfn}[thm]{Definition}
\tcolorboxenvironment{dfn}%
{
    leftrule = 4mm,
    rightrule = 0mm,
    toprule = 0mm,
    bottomrule = 0mm,
    arc = 0mm,
    colframe = theme-indigo,
    colback = theme-platinum
}

\tcolorboxenvironment{proof}{% 'proof' from 'amsthm'
    blanker,
    breakable,
    left=8mm,
    before skip=10pt,
    after skip=10pt,
    borderline west={5mm}{0pt}{theme-teal-blue}
}

\tcolorboxenvironment{quote}{%
    enhanced,
    oversize,
    outer arc = 0mm,
    arc = 0mm,
    toprule = 1mm,
    bottomrule = 1mm,
    leftrule = 0mm,
    rightrule = 0mm,
    colframe = theme-redwood,
    colback = theme-platinum
}

%%%%%%%%% Side-by-side environment with hyperlink and QR code to something
\ifphone
\newcommand{\withlink}[2]%
    {
        \begin{tcbraster}[raster columns = 4, raster equal height=rows]
            \begin{tcolorbox}[
                grow to left by = 11pt,
                boxsep = 0mm,
                boxrule=0mm,
                frame hidden,
                raster multicolumn = 3, 
                colback = \thepagecolor,
                colframe = \thepagecolor
                ]
                #1
            \end{tcolorbox}
            \begin{tcolorbox}[
                boxrule=0pt, 
                colback = \thepagecolor,
                colframe = \thepagecolor, 
                frame hidden
                ]
                \begin{center}
                    \href{#2}{\includegraphics[width = \iconsize]{img/lineal colour/012-online course.png}}
                \end{center}
            \end{tcolorbox}
        \end{tcbraster}
    }
\else
\newcommand{\withlink}[2]%
    {
        \begin{tcbraster}[raster columns = 6, raster equal height=rows]
            \begin{tcolorbox}[
                grow to left by = 11pt,
                boxsep = 0mm,
                boxrule=0mm,
                frame hidden,
                raster multicolumn = 5, 
                colback = \thepagecolor,
                colframe = \thepagecolor
                ]
                #1
            \end{tcolorbox}
            \begin{tcolorbox}[
                boxrule=0pt, 
                colback = \thepagecolor,
                colframe = \thepagecolor, 
                frame hidden
                ]
                \begin{center}
                    \href{#2}{\includegraphics[width = \iconsize]{img/lineal colour/012-online course.png}}
                \end{center}
            \end{tcolorbox}
        \end{tcbraster}
    }
\fi

\RequirePackage{ifmtarg}

%%%% Activity and example environment

\ifphone
\newtheorem{activitybox}{Activity}
\tcolorboxenvironment{activitybox}%
    {
        enhanced,
        boxrule = 1mm,
        colback = \thepagecolor,
        colframe = theme-indigo
    }

\newenvironment{activity}[1][]{
    \newpage
    \begin{tcbraster}[raster columns = 1, raster rows = 2]
        \begin{tcolorbox}[boxrule = 0pt, colback = \thepagecolor, colframe = white, frame hidden, halign=flush right]
            \@ifmtarg{#1}{\includegraphics[width = \iconsize]{img/lineal/026-marker.png}}%
                    {\href{#1}{\includegraphics[width = \iconsize]{img/lineal colour/026-marker.png}}}
        \end{tcolorbox}
        \begin{activitybox}{}{}
    }{
    \end{activitybox}
    \end{tcbraster}
    }

\newtheorem{examplebox}[activitybox]{Example}
\tcolorboxenvironment{examplebox}%
{
    enhanced,
    boxrule = 1mm,
    colback = \thepagecolor,
    colframe = theme-redwood
}

\newenvironment{example}[1][]{
    \newpage
\begin{tcbraster}[raster columns = 1, raster rows = 2]
    \begin{tcolorbox}[boxrule = 0pt, colback = \thepagecolor, colframe = white, frame hidden, halign=flush right]
        \@ifmtarg{#1}{\includegraphics[width = \iconsize]{img/lineal/013-thinking.png}}%
            {\href{#1}{\includegraphics[width = \iconsize]{img/lineal colour/013-thinking.png}}}
    \end{tcolorbox}
    \begin{examplebox}{}{}
}{
\end{examplebox}
\end{tcbraster}
}
\else
    \newtheorem{activitybox}{Activity}
    \tcolorboxenvironment{activitybox}%
        {
            enhanced,
            boxrule = 1mm,
            colback = \thepagecolor,
            colframe = theme-indigo,
            raster multicolumn = 5
        }
    \newenvironment{activity}[1][]{
        \begin{tcbraster}[raster columns = 6, raster equal height = rows]
            \begin{tcolorbox}[boxrule = 0pt, colback = \thepagecolor, colframe = white, frame hidden]
                \@ifmtarg{#1}{\includegraphics[width = \iconsize]{img/lineal/026-marker.png}}%
                        {\href{#1}{\includegraphics[width = \iconsize]{img/lineal colour/026-marker.png}}}
            \end{tcolorbox}
            \begin{activitybox}{}{}
        }{
        \end{activitybox}
        \end{tcbraster}
        }

    \newtheorem{examplebox}[activitybox]{Example}
    \tcolorboxenvironment{examplebox}%
    {
        enhanced,
        boxrule = 1mm,
        colback = \thepagecolor,
        colframe = theme-redwood,
        raster multicolumn = 5
    }

\newenvironment{example}[1][]{
    \begin{tcbraster}[raster columns = 6, raster equal height = rows]
        \begin{tcolorbox}[boxrule = 0pt, colback = \thepagecolor, colframe = white, frame hidden]
            \@ifmtarg{#1}{\includegraphics[width = \iconsize]{img/lineal/013-thinking.png}}%
                {\href{#1}{\includegraphics[width = \iconsize]{img/lineal colour/013-thinking.png}}}
        \end{tcolorbox}
        \begin{examplebox}{}{}
    }{
    \end{examplebox}
    \end{tcbraster}
    }
\fi

% Setting various lengths and other things
\setlength{\parskip}{2\baselineskip}
\setlength{\parindent}{0pt}
\renewcommand{\baselinestretch}{1.25}
\raggedright
\RequirePackage{nopageno}


% Title page

\def\@module{}
\newcommand{\module}[1]{\def\@module{#1}}

\renewcommand{\maketitle}{
    \ifphone
    \begin{titlepage}
        \begin{tikzpicture}[overlay, remember picture]
            \draw (current page.center) ++ (0,2cm) node (title node) [above, text width = \textwidth, text = black, rectangle, align = center] {\titlepagefont \@title};
            \draw (title node) ++ (0,-4cm) node (module node) [below, text width = .5\textwidth, text = white, rectangle, fill = black, inner sep = 5mm, align = center] {\titlepagemodulefont \@module};
        \end{tikzpicture}       
    \end{titlepage}
\else
    \begin{titlepage}
        \begin{tikzpicture}[overlay, remember picture]
            \draw (current page.west) node (title node) [right = 2cm, text width = \textwidth, text = black, rectangle] {\titlepagefont \@title};
            \draw (current page.west) ++ (0,-4cm) node (module node) [right = 2cm, text width = .5\textwidth, text = white, rectangle, fill = black, inner sep = 5mm] {\titlepagemodulefont \@module};
        \end{tikzpicture}
    \end{titlepage}
\fi
}

