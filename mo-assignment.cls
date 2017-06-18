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

\endinput
