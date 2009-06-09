%=============================================================================
% Angepasste cgDA.cls-Vorlage von der AG Computervisualistik
% URL: http://geri.uni-koblenz.de/Vorlagen/cgDA_Latex.zip
% Seite: http://www.uni-koblenz.de/FB4/Institutes/ICV/AGMueller/DiplomaTheses
% 
% Angepasst von: Erik Hebisch (flegelleicht@gmail.com)
% Versionen ===========================
% 2009-06-03	v0.6 Erik Hebisch
%=============================================================================

% Idenfikation ===============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bachelorbook}[2009/06/03 v0.6
                   Dokumentenklasse fuer die Bachelorarbeit
                   von Elke Hebisch]

% Variablen ==================================================================
\RequirePackage{ifthen}
\newboolean{@isFemale}
\newboolean{@isTimes}
\newboolean{@isPalatino}

% Optionen des Klasse ========================================================
\DeclareOption{w}{\setboolean{@isFemale}{true}}
\DeclareOption{m}{\setboolean{@isFemale}{false}}
\DeclareOption{times}{\setboolean{@isTimes}{true}}
\DeclareOption{palatino}{\setboolean{@isPalatino}{true}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\ProcessOptions

% LaTeX-Klasse "book" laden ==================================================
\LoadClass[a4paper,titlepage,ngerman]{book}

% Pakete laden ===============================================================
% Eingabekodierung: Latin-9
\RequirePackage[latin9]{inputenc}

% Schriftkodierung: T1 (für Ausgabe als Vektorschriften)
\RequirePackage[T1]{fontenc}

% Unterstuetzung englische und neue deutsche Rechtschreibung
\RequirePackage[ngerman]{babel}

% Einbindung von Grafiken
\RequirePackage[pdftex]{graphicx}

% Zitate
\RequirePackage[square,numbers,sort]{natbib}

% Flexible Gestaltung von Tabellen
\RequirePackage{tabularx}

% Bildunterschriften mit Optionen
\RequirePackage[hang,small,bf]{caption}

% Unter-Abbildungen
\RequirePackage[tight, footnotesize, bf, sf, SF,nooneline]{subfigure}

% Übernahme der Unter-Abbildungen ins Inhaltsverzeichnis
\setcounter{lofdepth}{2}

% Verlinkungen von Inhaltverzeichnis und Verweisen sowie Urls
\usepackage[pdftex,bookmarks=true,bookmarksopen=true,bookmarksnumbered=true,colorlinks=false,linkcolor=black,pdfborder={0 0 0}]{hyperref}

\RequirePackage{units}
\RequirePackage{array}
\RequirePackage{enumerate}

% AMS -- Mathesymbole
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsbsy}

%Zeilenabstand ändern
\RequirePackage{setspace}
% \singlespacing %einfach
% \onehalfspacing %1,5-fach
%	\doublespacing %doppelt
%	\linespread{1.25}
% \baselineskip15pt
        
% Kopf- und Fußzeilen
\RequirePackage{fancyhdr}
\fancyhf{}
% Einstellung von Kopf- und Fußzeilen
\ifthenelse{\boolean{@twoside}}{%
	% Zweiseitiger Druck
	\fancypagestyle{plain}{\fancyhf{}\fancyhead[LE,RO]{\thepage}}%
  \fancyhead[RE]{\leftmark}%
	\fancyhead[LO]{\rightmark}%
	\fancyhead[LE,RO]{\thepage}%\scshape \leftmark}
}{
	% Einseitiger Druck
	\fancypagestyle{plain}{\fancyhf{}\fancyhead[RO]{\thepage}}%
	\fancyhead[LO]{\rightmark}%
	\fancyhead[RO]{\thepage}%\scshape \leftmark}
}
% Festlegung des Seitenstils auf "fancy"
\pagestyle{fancy}
% Dicke der Trennlinie der Kopfzeile festlegen
\renewcommand{\headrulewidth}{0.5pt}
% Platz für Kopfzeile definieren (muss > 14.6 pt sein)
\setlength{\headheight}{15pt}

% Schriftarten (Standard: Computer Modern)
\ifthenelse{\boolean{@isTimes}}{%
	% Schriftart Times New Roman
	\RequirePackage{times}%
}{}%
\ifthenelse{\boolean{@isPalatino}}{%
	% Schriftart Book Antiqua/Palatino
	\RequirePackage{mathpazo}%
}{}%

% Noch besserer Blocksatz
\RequirePackage{microtype}

% Neue Befehle ===============================================================
\def\@erstgutachter{}
\newcommand{\erstgutachter}[1]{\def\@erstgutachter{#1}}

\def\@erstgutachterInfo{}
\newcommand{\erstgutachterInfo}[1]{\def\@erstgutachterInfo{#1}}

\def\@zweitgutachter{}
\newcommand{\zweitgutachter}[1]{\def\@zweitgutachter{#1}}

\def\@zweitgutachterInfo{}
\newcommand{\zweitgutachterInfo}[1]{\def\@zweitgutachterInfo{#1}}

\def\@externLogo{}
\newcommand{\externLogo}[2]{\def\@externLogo{\includegraphics[width={#1}]{{#2}}}}

\def\@externName{}
\newcommand{\externName}[1]{\def\@externName{#1}}

% Backslash sichern (Konflikt später mit \raggedleft)
\newcommand{\PBS}[1]{\let\temp=\\#1\let\\=\temp}

% Längensicherung ====================
\newlength{\voffsetBackup}
\setlength{\voffsetBackup}{\voffset}

\newlength{\hoffsetBackup}
\setlength{\hoffsetBackup}{\hoffset}

% Längenänderung =============================================================
% Keine Einrückung bei Absätzen
\setlength{\parindent}{0.0em}
% Größerer Abstand zwischen Absätzen
\setlength{\parskip}{1.3ex plus0.3ex minus0.2ex}


% Neue Titelseite ============================================================
\renewcommand{\maketitle}{
	% Abstand der Seite vom oberen Rand des Papiers festlegen
  \setlength{\voffset}{-.5in}
  %Abstand der Seite vom linken Rand des Papiers festlegen
  \setlength{\hoffset}{-.25in}
   
  % Titelseite
  \begin{titlepage}
		\ifthenelse{\boolean{@twoside}}{%
    	\setcounter{page}{0}
     }{%
      \setcounter{page}{-1}
    }
		% Logo Uni
    \hspace*{-1cm}
    % Mit externem Logo
    %\ifthenelse{\boolean{@isExtern}}{%
		%	\begin{tabular*}{\linewidth}{p{.9cm}p{5cm}@{\hspace{2cm}}>{\PBS\raggedleft}p{6cm}}
 	  %		{\includegraphics[height=.9cm]{logos/UniLogoNeu}}%
 	  %		&%	
    %		%\includegraphics[height=1.2cm]{logos/UniLogoNeu}%
    %		&%
    %		\@externLogo%
	  %   \\[-.1ex] %
	  %   &% 
    %		\footnotesize \hspace{.1em}Fachbereich 4: Informatik%
    %	&%
    %		\footnotesize \@externName%
    %\end{tabular*}
    %}{%
    %	Nur mit Uni-Logo
    %	\begin{tabular*}{\linewidth}{p{1.5cm}p{7cm}}
 	  % 	\raisebox{-.2cm}[1.3cm][1.3cm]{\includegraphics[height=1.2cm]{logos/UniLogoNeu}}%
 	  %		&%	
    % 	%\includegraphics[height=1.3cm]{logos/UniLogoNeu}%
	  %   \\[-1cm] %
	  %   &% 
    %		\footnotesize \hspace{-.25em}Fachbereich 4: Informatik%
    %  \end{tabular*}
    %}      
    
    \normalsize
    \vspace*{1.5cm}      
    
    \begin{center}
    	% Titel
      \doublespacing
      {\huge\bfseries\@title}\\[1.25cm]
      % Beschreibung
      \singlespacing 
     	\LARGE Bachelorarbeit\\[.2cm]
      \normalsize an der Fakult{\"a}t f{\"u}r Physik\\ 
      der Ludwig-Maximilian-Universit{\"a}t M{\"u}nchen\\[.75cm]
      {\large vorgelegt von\\[1ex]\Large\@author}\\[4cm]
			\end{center}
			% Gutachter
			\normalsize	
      {\begin{tabular}{ll}
  	     Erstgutachter:   & \ifthenelse{\equal{\@erstgutachter}{}}{%
            {Prof. Dr. }
            }{\@erstgutachter} \\
  	     { } & \ifthenelse{\equal{\@erstgutachterInfo}{}}{%
  	     		{(Institut f{\"u}r Computervisualistik, AG Computergraphik)}
  	     		}{\@erstgutachterInfo} \\[.2cm]
    	   Zweitgutachter: & \@zweitgutachter \\
    	   { } & \@zweitgutachterInfo \\
       \end{tabular}\\[2cm]}
  		\normalsize
  		\hspace*{.11cm}
      M{\"u}nchen, \@date
   \end{titlepage}

   % Rueckseite der Titelseite
   \ifthenelse{\boolean{@twoside}}{%
      \begin{titlepage}
         \setcounter{page}{0}
         \mbox{}   % Hier muss was stehen, also eine leere Box :-)
      \end{titlepage}
   }{}
   
   \setlength{\voffset}{\voffsetBackup}
   \setlength{\hoffset}{\hoffsetBackup}
   
   
	% Erklärung
	\thispagestyle{empty}
	\noindent
	\Large{Erkl{\"a}rung}\\
	
	\vspace*{2ex}
	\noindent
	\normalsize
	Ich versichere, dass ich die vorliegende Arbeit selbst{\"a}ndig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.\\
	
	\vspace*{2ex}
	
	% Weitere Angaben
	%\begin{flushleft}
	%\begin{tabularx}{\linewidth}{lcc}
	%{} & Ja & Nein \\
	%{} & {} & {} \\
	%Mit der Einstellung der Arbeit in die Bibliothek bin ich einverstanden. & $\square$ & $\square$ \\
	%{} & {} & {} \\	
	%Der Ver{\"o}ffentlichung dieser Arbeit im Internet stimme ich zu. & $\square$ & $\square$ 
	%\end{tabularx}
	%\end{flushleft}
	%\vspace*{3cm}
	\small
	\noindent
	\dotfill \\
	{\small(Ort, Datum)}\hfill{\small (Unterschrift)}
	\normalsize
}
