% ------------------------------- Identification --------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{au-thesis}[2024/01/17 A class for Master Thesis reports at
                          Aarhus University.]

% ------------------------------- Preliminary Declarations ----------------------------------------
% Base class 
\LoadClass[12pt, a4paper, oneside]{book}

% Dependencies
\RequirePackage[english]{babel}
\RequirePackage[nodayofweek]{datetime}
\RequirePackage[hyphens]{url}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[splitrule, bottom]{footmisc}
\RequirePackage{csquotes}
\RequirePackage{longtable}
\RequirePackage{wrapfig}
\RequirePackage{rotating}
\RequirePackage[normalem]{ulem}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{capt-of}
\RequirePackage{cleveref}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{lipsum}
\RequirePackage{algorithm}
\RequirePackage{algpseudocodex}

% ------------------------------- Customization ---------------------------------------------------
% Margin layout
\usepackage[a4paper,width=150mm,top=25mm,bottom=25mm]{geometry}

% Use references.bib as the bibliography database
\RequirePackage[backend=biber, url=false,eprint=false, style=ieee]{biblatex}
\addbibresource{references.bib}
\emergencystretch=1em % To prevent overfull lines in bibliography when using ieee style
\setcounter{biburlnumpenalty}{9000} % If you want to break on URL numbers
\setcounter{biburllcpenalty}{9000} % If you want to break on URL lower case letters
\setcounter{biburlucpenalty}{9000} % If you want to break on URL UPPER CASE letters

% Proper handling of bibliography and similar in TOC
\RequirePackage[nottoc]{tocbibind}

% Automatically look for figures in the figures folder located in the same
% folder as the tex file containing the includegraphics command.
\RequirePackage{letltxmacro}
\RequirePackage{graphicx}
% save the meaning of \includegraphics
\LetLtxMacro\latexincludegraphics\includegraphics
% redefine \includegraphics to refer to the subfolder Figures
\renewcommand{\includegraphics}[2][ ]{\latexincludegraphics[#1]{figures/#2}}

% Listings
\RequirePackage{listings}
\lstset{basicstyle=\ttfamily, mathescape, captionpos=b}
\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}

% Abbreviations
\RequirePackage[printonlyused]{acronym}


% -------------------------------- Page layout ----------------------------------------------------
% Header and footer
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfoot[C]{\thepage}% of \pageref{LastPage}}%
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\leftmark}
\fancyfoot[C]{\thepage}% of \pageref{LastPage} }
\setlength{\headheight}{28pt}
\addtolength{\topmargin}{-14pt}

% -------------------------------- Document variables ---------------------------------------------
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}
\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{}
\def\subject#1{\gdef\@subject{#1}}
\def\@subject{}
\def\studentid#1{\gdef\@studentid{#1}}
\def\@studentid{}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\def\@cosupervisor{}
\def\department#1{\gdef\@department{#1}}
\def\@department{}
\date{\displaydate{date}}

% --------------------------------- hypersetup ----------------------------------------------------

\let\origmaketitle\maketitle
\renewcommand{\maketitle}{
    \hypersetup{
        pdftitle={\@title, AU Master Thesis},
        pdfauthor={\@author},
        pdfkeywords={\@keywords},
        pdfsubject={\@subject}
    }
    \origmaketitle
}

% --------------------------------- Title page ----------------------------------------------------

\RequirePackage{titling}

\setlength{\droptitle}{-5cm}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for the horizontal lines

\renewcommand{\maketitlehooka}{%
    \center
    \textsc{\Large Master Thesis\\}
}

\pretitle{\HRule \\[0.4cm] \huge \bfseries}
\posttitle{\\ \HRule \\[0.4cm]}

\renewcommand{\maketitlehookb}{%
    \textsc{\Large \@subtitle}\\[0.5cm]
}

\preauthor{\large \emph{by}\\ \Large}
\postauthor{%
  \\ \large \@studentid \\[1.5\baselineskip]
  % Supervisor
  \large \emph{Supervisor:} \\ \@supervisor \\[.5\baselineskip]
  % Co-supervisor, conditional
  \ifx\@cosupervisor\@empty\else
    \large \emph{Co-supervisor:} \\ \@cosupervisor \\
  \fi
}


\renewcommand{\maketitlehookc}{%
    % Seal
    \vspace{\fill}
    \begin{figure}[!h]
        \centering
        \includegraphics[width=0.3\textwidth]{ausegl_blaa.png}
    \end{figure}
    \vspace{\fill}
    % Department and university
    \@department \\
    \large Aarhus University \\
    \large Denmark
}