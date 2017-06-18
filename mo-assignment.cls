%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment
% LaTeX Template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mo-assignment}[2017/6/18 LaTeX assignment template]

% Declare options

% Pass remaining options to base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load the base class after declaring the options
\LoadClass[10pt,a4paper]{article}

%----------------------------------------------------------------------------------------
% Packages
%----------------------------------------------------------------------------------------

% Page typesetting
\RequirePackage[a4paper]{geometry}	% Page margins
\RequirePackage{float} 			% [H] option: the float must be placed here

% Text typesetting
\RequirePackage[english]{babel} 	% Change hyphenation rules
\RequirePackage[utf8]{inputenc} 	% Unicode support (Umlauts etc.)
\RequirePackage[T1]{fontenc} 		% Font/output encoding
\RequirePackage[babel=true]{microtype}	% Micro-typographic optimizations
\RequirePackage{setspace}		% Text leading

% Headers and Footers
\RequirePackage{fancyhdr} 	% Required for custom headers
\RequirePackage{lastpage} 	% Required to determine the last page for the footer
\RequirePackage{extramarks}	% Required for headers and footers

% Colors and graphics and drawing
\RequirePackage[usenames,dvipsnames]{xcolor}	% Required for custom colors
\RequirePackage{graphicx}			% Required to insert images

    % Graphics loading path
    \graphicspath{{images/}{../images/}}

\RequirePackage{tikz} 				% TikZ vector graphics

    % TikZ modules
    \usetikzlibrary{automata,positioning}

% Math
\RequirePackage{amsmath} 	% Advanced math typesetting
\RequirePackage{amsthm} 	% theorem-like environments
\RequirePackage{amssymb} 	% AMS symbols
\RequirePackage{amsfonts}	% AMS fonts
\RequirePackage{fixmath} 	% ISO conform greek letters

% Tables
\RequirePackage{array} 		% Flexible column formatting
\RequirePackage{tabularx} 	% auto-sizing columns
\RequirePackage{booktabs} 	% Professional-looking tables
\RequirePackage{longtable} 	% Multi-page tables
\RequirePackage{pgfplotstable}	% Generates tables from csv files, needs TikZ
\RequirePackage{siunitx} 	% SI unit macros and "S" column type

    % Setup siunitx:
    \sisetup{
      round-mode          = places,	% Rounds numbers
      round-precision     = 2, 		% to 2 places
    }

% Plots
\RequirePackage{pgfplots} 	% Generation of plots from csv files, needs TikZ

    \pgfplotsset{compat=newest}	% Allows to place the legend below plot
    \usepgfplotslibrary{units}  % Allows to enter the units nicely, needs siunitx

% Code
\RequirePackage{listings} % Source code formatting and highlighting

% Algorithms
\RequirePackage[plain]{algorithm}
\RequirePackage{algpseudocode}

% Circuits
\RequirePackage{circuitikz} % Generation of cuircuits, needs TikZ

% Hyperlinks
\RequirePackage{hyperref} % Pdf info and table of contents, always import it last

%----------------------------------------------------------------------------------------
% Document styling
%----------------------------------------------------------------------------------------

% Margins - default scale 0.7
\geometry{hscale=0.75,vscale=0.8,centering} 

% Line spacing
\setstretch{1.3} % Set leading to 1.5 times the font box

% Format paragraphs with no indent
\setlength{\parindent}{0em}

% Set up the header and footer
\pagestyle{fancy} 				% set page style to use the fancyhdr package
\fancyhf{} 					% clear the header and footer
\lhead{\assignmentAuthor} 			% Top left header
\chead{\assignmentClass\ \assignmentTitle}	% Top center head
\rhead{\firstxmark} 				% Top right header
\lfoot{\lastxmark} 				% Bottom left footer
\cfoot{} 					% Bottom center footer
\rfoot{Page\ \thepage\ of\ \protect\pageref{LastPage}}	% Bottom right footer

\renewcommand\headrulewidth{0.4pt} % Size of the header line
\renewcommand\footrulewidth{0.4pt} % Size of the footer line

%----------------------------------------------------------------------------------------
% Document constructs
%----------------------------------------------------------------------------------------

\newcommand{\enterProblemHeader}[1]{
    \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
}

\newcommand{\exitProblemHeader}[1]{
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \stepcounter{#1}
    \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
}

\setcounter{secnumdepth}{0}
\newcounter{partCounter}
\newcounter{problemCounter}
\setcounter{problemCounter}{1}
\nobreak\extramarks{Problem \arabic{problemCounter}}{}\nobreak{}

\newenvironment{problem}[1][-1]{
    \ifnum#1>0
        \setcounter{problemCounter}{#1}
    \fi
    \section{Problem \arabic{problemCounter}}
    \setcounter{partCounter}{1}
    \enterProblemHeader{problemCounter}
}{
    \exitProblemHeader{problemCounter}
}

% Alias for the Solution section header
\newcommand{\solution}{\textbf{\large Solution}}

% Parts of a solution
\renewcommand{\part}[1]{\textbf{\large Part \Alph{partCounter}}\stepcounter{partCounter}\\}

%----------------------------------------------------------------------------------------
% Title page
%----------------------------------------------------------------------------------------

\newcommand{\assignmentTitle}{Assignment\ 1} 			% Assignment title
\newcommand{\assignmentDueDate}{Monday,\ January\ 1,\ 2017}	% Due date
\newcommand{\assignmentClass}{Calculus} 			% Course/class
\newcommand{\assignmentClassTime}{10:30am} 			% Class/lecture time
\newcommand{\assignmentClassInstructor}{Teacher\ Name} 		% Teacher/lecturer
\newcommand{\assignmentAuthor}{Author\ Name} 			% Author name(s)

\title{
    \vspace{2in}
    \textmd{\textbf{\assignmentClass:\ \assignmentTitle}}\\
    \normalsize\vspace{0.1in}\small{Due\ on\ \assignmentDueDate}\\
    \vspace{0.1in}\large{\textit{\assignmentClassInstructor\ \assignmentClassTime}}
    \vspace{3in}
}

\author{\textbf{\assignmentAuthor}}
\date{\today} % Insert date here if you want it to appear below your name

%----------------------------------------------------------------------------------------
% Macros
%----------------------------------------------------------------------------------------

% Useful for algorithms
\newcommand{\alg}[1]{\textsc{\bfseries \footnotesize #1}}

% For derivatives
\newcommand{\deriv}[1]{\frac{\mathrm{d}}{\mathrm{d}x} (#1)}

% For partial derivatives
\newcommand{\pderiv}[2]{\frac{\partial}{\partial #1} (#2)}

% Integral dx
\newcommand{\dx}{\mathrm{d}x}

% Probability commands: Expectation, Variance, Covariance, Bias
\newcommand{\E}{\mathrm{E}}
\newcommand{\Var}{\mathrm{Var}}
\newcommand{\Cov}{\mathrm{Cov}}
\newcommand{\Bias}{\mathrm{Bias}}

\endinput
