

%%
%%
%% tisdexam.cls
%%
%% Exam document class for creating exams at Faculty of Technology, Innovation
%% and Society - Delft (TISD) of the The Hague University of Applied Sciences.
%%
%% (c)2024, J. op den Brouw <J.E.J.opdenBrouw@hhs.nl>
%%
%% Version 3.1
%%
%% Class options:
%%  dutch - load dutch spelling options
%%  nederlands - alternative to dutch
%%  english - load english spelling options
%%  american - load american spelling option
%%  vanilla - plain setup

%% Class Commands:
%%  \faculteit - The faculty with THUAS
%%  \opleiding - the study programme such as "Electrical Engineering"
%%  \toetsnaam - full name of the course
%%  \toetsnaamkort - abbreviated exam course code
%%  \toetscode - exam code
%%  \toetsdatum - exam date
%%	\toetsdatumkort - exam date short version (dd-mm-yyyy)
%%  \begintijd - exam start time
%%  \eindtijd - exam end time
%%  \tijdsduur - exam duration
%%  \aantalpaginas - number of pages including the cover page
%%  \aantalopenvragen - number of open questions/problems/excersises
%%  \aantalgeslotenvragen - number of closed questions/problems/excersises
%%  \opsteller - author/composer/redactor, mostly the lecturer
%%  \tweedelezer - proof reader
%%  \cesuur - caesura of the exam
%%  \overig - accompanying text to \overigtrue
%%  \puntenverdeling - point allocation and marking
%%  \opmerkingen - remarks, free field

%%  \ifvoltijd - full time checkmark
%%  \ifdeeltijd - part time checkmark
%%  \ifduaal - dual checkmark
%%  \iftoetspapier - exam paper
%%  \ifantwoordenbladen - answer sheet
%%  \ifantwoordenbladenabcde - answersheet ABCDE
%%  \ifruitjespapier - graph paper
%%  \ifkladpapier - scrap paper
%%  \iftekenbenodigdheden - Drawing supplies
%%  \ifeenvoudigerekenmachine - simple calculator
%%  \ifgrafischerekenmachine - scientific calculator
%%  \ifformulebladen - formula sheets
%%  \ifwetbundel - book of laws
%%  \ifaantekeningen - own summary
%%  \ifboek - book
%%  \ifoverig - other
%%  \ifgeenhulpmiddelen - no tools allowed

%%
%%  \makecoverpage - creates the exam coverpage
%%
%% Only in non-vanilla mode:
%%
%%  \numopenquestions - expands to the number of open questions
%%  \nummultquestions - expands to the number of m.c. questions
%%  \tisdexamcheckboxeshook - see exam class \checkboxeshook
%%  \tisdexamchoiceshook - see exam class \choiceshook
%%  \tisdexamquestionshook - see exam class \questionshook
%%  \questionsep - skip length after question

%% The tisdexam class redefines the following environments and commands:
%%  subparts - set empty, so no subparts are rendered
%%  subsubparts - set empty, so no subsubparts are rendered
%%  \pointname - redefined to { pt}
%%  \marginpointname - redefined to { pt}
%%  \partlabel - redefined to \thepartno)
%%  \choicelabel - redefined to \alph{choice})
%%  \droppoints - redefined, see below
%%  \qformat - redefined, see below

%% In non-vanilla mode, the tisdexam class loads the following packages:
%%  tikz, babel, geometry.
%%  The babel package is supplied with the language presented in the
%%  class option list.

%% In vanilla-mode, the tisdexam class loads the following packages:
%%  tikz, babel, geometry

%% Credentials
\def\fileversion{3.1}
\def\filedate{2024/05/13}
\edef\tisdexamfileversion{\fileversion}
\edef\tisdexamfiledate{\filedate}

%% TeX format needed
\NeedsTeXFormat{LaTeX2e}[1995/06/01]

\ProvidesClass{tisdexam}[\filedate\space Version \fileversion\space TISD Exam
	Class by J.E.J. op den Brouw]

%% Do we have an English exam?
\newcommand{\tisdexam@english}{
	\def\tisdexam@uitwerkingenspel{Solutions}
	\def\tisdexam@opgavespel{Question}
	\def\tisdexam@toetsspel{Exam}
	\def\tisdexam@opleidingspel{Study programme}
	\def\tisdexam@academiespel{Faculty TIS}
}
%% Do we have a Dutch exam?
%% Dutch is the default
\newcommand{\tisdexam@dutch}{
	\def\tisdexam@uitwerkingenspel{Uitwerkingen}
	\def\tisdexam@opgavespel{Opgave}
	\def\tisdexam@toetsspel{Toets}
	\def\tisdexam@opleidingspel{Opleiding}
	\def\tisdexam@academiespel{Faculteit TIS}
}
\tisdexam@dutch

%% Declare vanilla
\newif\ifvanilla
\vanillafalse
\DeclareOption{vanilla}{\ClassWarningNoLine{tisdexam}{Document is typed vanilla}\vanillatrue}

%% Check language
\newif\iftisdexam@langselect
\tisdexam@langselectfalse
\newif\iftisdexam@langenglish
\tisdexam@langenglishfalse
\DeclareOption{american}{\tisdexam@english\tisdexam@langselecttrue\tisdexam@langenglishtrue
  \PassOptionsToPackage{american}{babel}}
\DeclareOption{english}{\tisdexam@english\tisdexam@langselecttrue\tisdexam@langenglishtrue
  \PassOptionsToPackage{english}{babel}}
\DeclareOption{dutch}{\tisdexam@dutch\tisdexam@langselecttrue
  \PassOptionsToPackage{dutch}{babel}}
\DeclareOption{nederlands}{\tisdexam@dutch\tisdexam@langselecttrue
  \PassOptionsToPackage{dutch}{babel}}
 
%% Pass (not processed) options to Exam class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax

%% Default is the dutch language
\iftisdexam@langselect
\else
  \ClassWarningNoLine{tisdexam}{No language specified, set to 'dutch'.}
  \PassOptionsToPackage{dutch}{babel}
\fi
  
%% Now load the Exam class
%% Note that the Exam class will load the Article class.
\LoadClass[12pt]{exam}

\RequirePackage{tikz}

\definecolor{thuasgreen}{RGB}{158,167,0}
\definecolor{fillincolor}{RGB}{0,0,0}

\newcommand{\setfontxviii}{\usefont{T1}{phv}{m}{n}\fontsize{18pt}{20pt}\selectfont}
\newcommand{\setfontx}{\usefont{T1}{phv}{m}{n}\fontsize{10pt}{12pt}\selectfont}
\newcommand{\setfontxii}{\usefont{T1}{phv}{m}{n}\fontsize{12pt}{12pt}\selectfont}
\newcommand{\setfontviii}{\usefont{T1}{phv}{m}{n}\fontsize{8pt}{8pt}\selectfont}
\newcommand{\setfontix}{\usefont{T1}{phv}{m}{n}\fontsize{9pt}{9pt}\selectfont}
\newcommand{\checkblock}{\rule{6pt}{6pt}}

\parindent=0pt


%% These are the commands needed to fill in the cover page.
\newcommand{\faculteit}[1]{\def\tisdexam@faculteit{#1}}
\newcommand{\opleiding}[1]{\def\tisdexam@opleiding{#1}}
\newcommand{\toetsnaamkort}[1]{\def\tisdexam@toetsnaamkort{#1}}
\newcommand{\toetsnaam}[1]{\def\tisdexam@toetsnaam{#1}}
%%\newcommand{\groep}[1]{\def\tisdexam@groep{#1}}
\newcommand{\toetsdatum}[1]{\def\tisdexam@toetsdatum{#1}}
\newcommand{\toetsdatumkort}[1]{\def\tisdexam@toetsdatumkort{#1}}
\newcommand{\begintijd}[1]{\def\tisdexam@begintijd{#1}}
\newcommand{\eindtijd}[1]{\def\tisdexam@eindtijd{#1}}
\newcommand{\tijdsduur}[1]{\def\tisdexam@tijdsduur{#1}}
\newcommand{\aantalpaginas}[1]{\def\tisdexam@aantalpaginas{#1}}
\newcommand{\aantalopenvragen}[1]{\def\tisdexam@aantalopenvragen{#1}}
\newcommand{\aantalgeslotenvragen}[1]{\def\tisdexam@aantalgeslotenvragen{#1}}
\newcommand{\opmerkingen}[1]{\def\tisdexam@opmerkingen{#1}}
\newcommand{\opsteller}[1]{\def\tisdexam@opsteller{#1}}
\newcommand{\tweedelezer}[1]{\def\tisdexam@tweedelezer{#1}}
\newcommand{\cesuur}[1]{\def\tisdexam@cesuur{#1}}
\newcommand{\toetscode}[1]{\def\tisdexam@toetscode{#1}}
\newcommand{\overig}[1]{\def\tisdexam@overig{#1}}
\newcommand{\puntenverdeling}[1]{\def\tisdexam@puntenverdeling{#1}}

%% Default cover page information
\def\tisdexam@opsteller{\textbf{??}}
\def\tisdexam@faculteit{TIS}
\def\tisdexam@opleiding{\textbf{??}}
\def\tisdexam@tweedelezer{\textbf{??}}
\def\tisdexam@toetsnaamkort{\textbf{??}}
\def\tisdexam@toetsnaam{\textbf{??}}
\def\tisdexam@toetsdatum{\textbf{??}}
\def\tisdexam@toetsdatumkort{\textbf{??}}
\def\tisdexam@begintijd{09:00}
\def\tisdexam@eindtijd{10:30}
\def\tisdexam@tijdsduur{90}
\def\tisdexam@aantalpaginas{\numpages}
\def\tisdexam@aantalopenvragen{\numopenquestions}
\def\tisdexam@aantalgeslotenvragen{\nummultquestions}
\def\tisdexam@cesuur{\textbf{??}}
\def\tisdexam@toetscode{\textbf{??}}
\def\tisdexam@puntenverdeling{\textbf{??}}
\def\tisdexam@opmerkingen{}
\def\tisdexam@overig{}

%% Booleans for the tickmarks on the coverpage
\newif\ifvoltijd
\newif\ifdeeltijd
\newif\ifduaal
\newif\iftoetspapier
\newif\ifantwoordenbladen
\newif\ifantwoordenbladenabcde
\newif\ifruitjespapier
\newif\ifkladpapier
\newif\iftekenbenodigdheden
\newif\ifeenvoudigerekenmachine
\newif\ifgrafischerekenmachine
\newif\ifwetenschappelijkerekenmachine
\newif\ifformulebladen
\newif\ifwetbundel
\newif\ifaantekeningen
\newif\ifboek
\newif\ifoverig
\newif\ifgeenhulpmiddelen

% Simple crossout
\tikzset{
  checkcross/.pic={
    % Code for a "checkcross". Do you see it?...
    \draw (-3pt,3pt) to (3pt,-3pt);
    \draw (-3pt,-3pt) to (3pt,3pt);
  }
}

%% Begin coverpage
%%
\iftisdexam@langenglish
% Begin english coverpage
\newcommand{\makecoverpage}[1][]{%
\thispagestyle{empty}
\begin{tikzpicture}[remember picture, overlay]
\node (image) [shape=rectangle,draw=none,minimum width=\paperwidth,minimum height=\paperheight] at (current page.center) {\includegraphics[width=\paperwidth,height=\paperheight]{tisdexam-english.pdf}};
%
\node [right,fillincolor] at (1.8,-1.18) {\setfontx \textbf{\tisdexam@faculteit}};
\node [right,fillincolor] at (0.0,-2.65) {\setfontxviii \tisdexam@toetsnaam};
\node [right,fillincolor] at (0.0,-4.10) {\setfontxii \tisdexam@opleiding};
\node [right,fillincolor] at (2.0,-5.46) {\setfontix \tisdexam@toetscode};
\node [right,fillincolor] at (0.0,-7.10) {\setfontx \tisdexam@opsteller{} / \tisdexam@tweedelezer};
%
%% Full Time
\ifvoltijd \pic [fillincolor] at (4.21,-4.79) {checkcross}; \fi
%% Part time
\ifdeeltijd \pic [fillincolor] at (6.33,-4.79) {checkcross}; \fi
%% Dual
\ifduaal \pic [fillincolor] at (8.46,-4.79) {checkcross}; \fi
%
%% Exam date
\node [right,fillincolor] at (7.40, -7.95) {\setfontx \vphantom{bg}\tisdexam@toetsdatum};
%%
%%% Start time
\node [right,fillincolor] at (7.40, -8.70) {\setfontx \tisdexam@begintijd};
%%% end time
\node [right,fillincolor] at (7.40, -9.08) {\setfontx \tisdexam@eindtijd};
%%% Allowed time
\node [right,fillincolor] at (7.40, -9.80) {\setfontx \tisdexam@tijdsduur};
%%
%%% Number of pages
\node [right,fillincolor] at (7.40, -11.10) {\setfontx \tisdexam@aantalpaginas};
%%% Number of open questions
\node [right,fillincolor] at (7.40, -11.54) {\setfontx \tisdexam@aantalopenvragen};
%%% Number of closed questions
\node [right,fillincolor] at (7.40, -11.95) {\setfontx \tisdexam@aantalgeslotenvragen};
%%% Cesuur
\node [right,fillincolor] at (7.40, -12.57) {\setfontx \vphantom{bg}\tisdexam@cesuur};
%%% Point allocation
\node [right,fillincolor] at (7.40, -13.31) {\setfontx \vphantom{bg}\tisdexam@puntenverdeling};
%%
%%% Exam paper
\iftoetspapier \pic [fillincolor] at (-0.14,-14.82) {checkcross}; \fi
%%% Answer sheet
\ifantwoordenbladen \pic [fillincolor] at (-0.14,-15.39) {checkcross}; \fi
%%% Answer sheet ABCDE
\ifantwoordenbladenabcde \pic [fillincolor] at (-0.14,-15.94) {checkcross}; \fi
%%% Graph paper
\ifruitjespapier \pic [fillincolor] at (-0.14,-16.51) {checkcross}; \fi
%%
%%% Scratch paper
\ifkladpapier \pic [fillincolor] at (5.96,-14.83) {checkcross}; \fi
%%% Drawing supplies
\iftekenbenodigdheden \pic [fillincolor] at (5.96,-15.40) {checkcross}; \fi
%%% Calc simple
\ifeenvoudigerekenmachine
   \pic [fillincolor] at (5.96,-15.955) {checkcross}; 
   \pic [fillincolor] at (6.54,-16.51) {checkcross};
\fi
\ifwetenschappelijkerekenmachine
   \pic [fillincolor] at (5.96,-15.955) {checkcross}; 
   \pic [fillincolor] at (6.54,-17.08) {checkcross};
\fi
%%% Calc graphic
\ifgrafischerekenmachine
   \pic [fillincolor] at (5.96,-15.955) {checkcross}; 
   \pic [fillincolor] at (6.54,-17.64) {checkcross};
\fi
%%% Formula sheets
\ifformulebladen \pic [fillincolor] at (11.09,-14.66) {checkcross};  \fi
%%
%%% Book of laws
\ifwetbundel \pic [fillincolor] at (11.09,-15.22) {checkcross}; \fi
%%% Own summary
\ifaantekeningen \pic [fillincolor] at (11.09,-15.78) {checkcross}; \fi
%%% Books
\ifboek \pic [fillincolor] at (11.09,-16.34) {checkcross}; \fi
%%% Other
\ifoverig
   \pic [fillincolor] at (11.09,-17.29) {checkcross};
   % Other (text)
   \node [right,fillincolor] at (12.10,-17.34) {\setfontviii \vphantom{bg}\tisdexam@overig};
\fi
%%% No tools
\ifgeenhulpmiddelen \pic [fillincolor] at (11.09,-17.85) {checkcross}; \fi
%%
%%% Comment
\node [right,fillincolor,text width=8cm,anchor=north west] at (9.5,-19.2) {\setfontx \tisdexam@opmerkingen} rectangle ++(8,-6) ;
\end{tikzpicture}
\newpage
\newgeometry{left=2.0cm,right=2.0cm,top=2.0cm,bottom=1.4in}
}
\else
%% Begin Dutch coverpage
\newcommand{\makecoverpage}[1][]{%
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
\node (image) [shape=rectangle,draw=none,minimum width=\paperwidth,minimum height=\paperheight] at (current page.center) {\includegraphics[width=\paperwidth,height=\paperheight]{tisdexam-dutch.pdf}};
%
\node [right,fillincolor] at (1.5,-1.20) {\setfontx \textbf{\tisdexam@faculteit}};
\node [right,fillincolor] at (0.0,-2.70) {\setfontxviii \tisdexam@toetsnaam};
\node [right,fillincolor] at (0.0,-4.05) {\setfontxii \tisdexam@opleiding};
\node [right,fillincolor] at (2.0,-5.50) {\setfontix \tisdexam@toetscode};
\node [right,fillincolor] at (3.5,-6.55) {\setfontx \tisdexam@opsteller};
\node [right,fillincolor] at (3.5,-7.00) {\setfontx \tisdexam@tweedelezer};
%
%% Full Time
\ifvoltijd \pic [fillincolor] at (4.21,-4.79) {checkcross}; \fi
%% Part time
\ifdeeltijd \pic [fillincolor] at (6.33,-4.79) {checkcross}; \fi
%% Dual
\ifduaal \pic [fillincolor] at (8.465,-4.79) {checkcross}; \fi
%
%% Exam date
\node [right,fillincolor] at (7.40, -7.95) {\setfontx \vphantom{bg}\tisdexam@toetsdatum};
%
%% Start time
\node [right,fillincolor] at (7.40, -8.63) {\setfontx \tisdexam@begintijd};
%% end time
\node [right,fillincolor] at (7.40, -9.05) {\setfontx \tisdexam@eindtijd};
%% Allowed time
\node [right,fillincolor] at (7.40, -9.75) {\setfontx \tisdexam@tijdsduur};
%
%% Number of pages
\node [right,fillincolor] at (7.40, -11.02) {\setfontx \tisdexam@aantalpaginas};
%% Number of open questions
\node [right,fillincolor] at (7.40, -11.44) {\setfontx \tisdexam@aantalopenvragen};
%% Number of closed questions
\node [right,fillincolor] at (7.40, -11.88) {\setfontx \tisdexam@aantalgeslotenvragen};
%% Cesuur
\node [right,fillincolor] at (7.40, -12.50) {\setfontx \vphantom{bg}\tisdexam@cesuur};
%% Point allocation
\node [right,fillincolor] at (7.40, -13.20) {\setfontx \vphantom{bg}\tisdexam@puntenverdeling};
%
%% Exam paper
\iftoetspapier \pic [fillincolor] at (-0.14,-14.85) {checkcross}; \fi
%% Answer sheet
\ifantwoordenbladen \pic [fillincolor] at (-0.14,-15.40) {checkcross}; \fi
%% Answer sheet ABCDE
\ifantwoordenbladenabcde \pic [fillincolor] at (-0.14,-15.97) {checkcross}; \fi
%% Graph paper
\ifruitjespapier \pic [fillincolor] at (-0.14,-16.52) {checkcross}; \fi
%
%% Scratch paper
\ifkladpapier \pic [fillincolor] at (5.98,-14.82) {checkcross}; \fi
%% Drawing supplies
\iftekenbenodigdheden \pic [fillincolor] at (5.98,-15.37) {checkcross}; \fi
%% Calc simple
\ifeenvoudigerekenmachine
   \pic [fillincolor] at (5.98,-15.92) {checkcross}; 
   \pic [fillincolor] at (6.54,-16.49) {checkcross};
\fi
%% Calc graphic
\ifwetenschappelijkerekenmachine
   \pic [fillincolor] at (5.98,-15.92) {checkcross}; 
   \pic [fillincolor] at (6.54,-17.06) {checkcross};
\fi
%% Calc scientific
\ifgrafischerekenmachine
   \pic [fillincolor] at (5.98,-15.92) {checkcross}; 
   \pic [fillincolor] at (6.54,-17.62) {checkcross};
\fi
%% Formula sheets
\ifformulebladen \pic [fillincolor] at (11.08,-14.77) {checkcross};  \fi
%
%% Book of laws
\ifwetbundel \pic [fillincolor] at (11.08,-15.33) {checkcross}; \fi
%% Own summary
\ifaantekeningen \pic [fillincolor] at (11.08,-15.90) {checkcross}; \fi
%% Books
\ifboek \pic [fillincolor] at (11.08,-16.46) {checkcross}; \fi
%% Other
\ifoverig
   \pic [fillincolor] at (11.10,-16.99) {checkcross};
   % Other (text)
   \node [right,fillincolor] at (12.40,-17.04) {\setfontviii \vphantom{bg}\tisdexam@overig};
\fi
%% No tools
\ifgeenhulpmiddelen \pic [fillincolor] at (11.08,-17.56) {checkcross}; \fi
%
%% Comment
\node [right,fillincolor,text width=8cm,anchor=north west] at (9.5,-19.0) {\setfontx \tisdexam@opmerkingen} rectangle ++(8,-6) ;
\end{tikzpicture}

\newpage
\newgeometry{left=2.0cm,right=2.0cm,top=2.0cm,bottom=1.4in}
}
%%%
%%% End makecoverpage
\fi

%% Set page layout, papersize is ...
\RequirePackage[bindingoffset=0.0in,a4paper,left=1.7cm,right=1.7cm,top=1.85cm,bottom=1cm]{geometry}

%% Use the spelling package, language is set by class option
\RequirePackage{babel}

%% Check non-vanilla mode
\ifvanilla
\else

%% Empty the subparts. Good exams do not have sub parts...
\renewenvironment{subparts}{%
  \def\@queslevel{subpart}%
  \ClassWarningNoLine{tisdexam}{Subparts not allowed in this class}%
  }%
  {}
\renewcommand\subpartlabel{}

%% Empty the subsubparts. Good exams do not have sub sub parts...
\renewenvironment{subsubparts}{%
  \def\@queslevel{subsubpart}%
  \ClassWarningNoLine{tisdexam}{Subsubparts not allowed in this class}%
  }%
  {}
\renewcommand\subsubpartlabel{}

%% We wish a itemize parts with only the closing parenthesis ) ...
%% We wish a multiple choice question with lower case letters and only a
%% closing parenthesis ...
\renewcommand\partlabel{\thepartno)}
\renewcommand{\thechoice}{\alph{choice}}
\renewcommand{\choicelabel}{\thechoice)}

%% My own point name, note the extra space
\pointname{ pt}

%% Point name in margin, note the extra space
\marginpointname{ pt}

%% Create my own points dropper directly right of the last word of
%% (sub) questions (in \part etc). Politely stolen from \droppoints
%% This \def redefines \droppoints.
\def\droppoints{%
  \leavevmode\unskip\nobreak
  {\padded@point@block}%
  %\par
}

%% Drop the points at the right on parts & set the format of the
%% question's head.
\pointsdroppedatright
\qformat{\textbf{\tisdexam@opgavespel{} \thequestion{}} (\totalpoints
         \@pointname) \hfill}

%% The TISD exam questions hook to use, don't use questionshook!
%% Text direcly under questions are on the same margin as the
%% question itself.
\newlength{\questionsep}
\setlength{\questionsep}{0.7cm}
\newcommand{\tisdexamquestionshook}{%
	\setlength{\leftmargin}{0pt}%
	\setlength{\labelwidth}{-\labelsep}%
	\setlength{\itemsep}{\questionsep}%
}
\renewcommand{\questionshook}{%
	\tisdexamquestionshook%
}

%% The TISD exam choices hook to use, don't EVER use choiceshook directly!
%% Indent the choices...
\newcommand{\tisdexamchoiceshook}{%
    \setlength{\leftmargin}{25pt}%
	\setlength{\itemsep}{-1pt}%
}
%% Update the m. c. question counter
\renewcommand{\choiceshook}{%
	\stepcounter{multquescounter}
	\tisdexamchoiceshook%
}

%% The TISD exam checkboxes hook to use, don't EVER use checkboxeshook directly!
\newcommand{\tisdexamcheckboxeshook}{}
%% Update the m. c. question counter
\renewcommand{\checkboxeshook}{%
	\stepcounter{multquescounter}%
	\tisdexamcheckboxeshook%
}

%% This counter keeps track of how many times the choices
%% environment is called. It can be used to determine how many
%% multiple choice questions are created.
%% Use \nummultquestions to get the number of m.c. questions.
%% Parts politely stolen from exam.cls (Thank you so much!!!)
%% !! Please note: there are no hooks for oneparchoices !!
%% !! oneparcheckboxes, so you can't count them.        !!
%%
\newcounter{multquescounter}
\setcounter{multquescounter}{0}
\newcommand{\nummultquestions}{\@ifundefined{exam@multquescounter}%
	{\mbox{\normalfont\bf ??}}%
	\exam@multquescounter% Output the number of m.c. questions
}
%% This counter keeps track of how many open questions
%% this exam has. It is done by subtracting the number of 
%% multiple choice questions from the total number of
%% questions.
%% Use \numopenquestions to get the number of open questions.
\newcounter{openquestions}
\setcounter{openquestions}{0}
\newcommand{\numopenquestions}{\@ifundefined{exam@multquescounter}%
	{\mbox{\normalfont\bf ??}}%
	{\setcounter{openquestions}{\numquestions}%
	\addtocounter{openquestions}{-\exam@multquescounter}%
	\theopenquestions}%  output the number of open questions
}%
%% We need to write the accumulated number of m.c questions to the
%% aux file for later use, because the first time it's not known...
\AtEndDocument{%
  \if@filesw
  \immediate\write\@mainaux
      {\string\gdef\string\exam@multquescounter{\themultquescounter}}%
  \fi
}% AtEndDocument


%% Fancy headers and footers...
%% Set these at the beginning of the document, after the exam info is set up
%% by the user.
\pagestyle{headandfoot}
\runningfootrule
\runningfooter{\oddeven{\ifprintanswers\tisdexam@uitwerkingenspel\ \fi\tisdexam@toetsnaamkort}{\thepage\,/\,\numpages}}{\tisdexam@toetsdatumkort}{\oddeven{\thepage\,/\,\numpages}{\ifprintanswers\tisdexam@uitwerkingenspel\ \fi\tisdexam@toetsnaamkort}}
\fi

\endinput
%%
%% End of file `tisdexam.cls'.
