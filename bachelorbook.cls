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
\DeclareOption{draft}{\PassOptionsToClass{draft}{book}}
\ProcessOptions

% LaTeX-Klasse "book" laden ==================================================
\LoadClass[a4paper,ngerman,12pt,oneside]{book}

% Pakete laden ===============================================================
% Eingabekodierung: Latin-9
%\RequirePackage[latin1]{inputenc}

% Schriftkodierung: T1 (für Ausgabe als Vektorschriften)
%\RequirePackage[T1]{fontenc}

% Unterstuetzung englische und neue deutsche Rechtschreibung
\RequirePackage[ngerman]{babel}

% Einbindung von Grafiken
%\RequirePackage[pdftex]{graphicx}

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

\RequirePackage{units}
\RequirePackage{array}
\RequirePackage{enumerate}

% AMS -- Mathesymbole
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsbsy}

% Weitere Textsymbole
\RequirePackage{textcomp}

%Zeilenabstand ändern
%\RequirePackage{setspace}
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
%\RequirePackage{microtype}

\RequirePackage{helvet} % serifenlos
\RequirePackage{times} % mit Serifen

% Verlinkungen von Inhaltverzeichnis und Verweisen sowie Urls
\RequirePackage[pdftex,
								bookmarks=true,
								bookmarksopen=true,
								bookmarksnumbered=true,
								colorlinks=false,
								linkcolor=black,
								pageanchor=true,
								plainpages=false,
								pdfborder={0 0 0}]{hyperref}


% Formatierung ===============================================================
\RequirePackage[DIV15,BCOR14mm]{typearea}
%\typearea[14mm]{15}
%\setcapindent{0.0em}
%\addtokomafont{caption}{\footnotesize\sffamily}
%\addtokomafont{captionlabel}{\footnotesize\sffamily\bfseries}
%\addtokomafont{pagehead}{\sffamily\mdseries}
% Keine Einrückung bei Absätzen
\setlength{\parindent}{0.0em}
% Größerer Abstand zwischen Absätzen
\setlength{\parskip}{1.3ex plus0.3ex minus0.2ex}
\renewcommand{\floatpagefraction}{0.75}


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

% Neue Titelseite ============================================================
\renewcommand{\maketitle}{
		\thispagestyle{empty}
		\ifthenelse{\boolean{@twoside}}{%
			\setcounter{page}{0}
		}{%
			\setcounter{page}{-1}
		}
		\vspace*{\stretch{1}}
		{\parindent0cm\rule{\linewidth}{.5ex}}
		\begin{center}
		 	\vspace*{\stretch{0.5}}
		 	\sffamily\bfseries\LARGE\@title\\
		 	\vspace*{\stretch{1}}
		 	\sffamily\bfseries\large\@author
			\vspace*{\stretch{0.5}}
		\end{center}
		\rule{\linewidth}{.5ex}
		\vspace*{\stretch{5}}
		\begin{center}
			%includegraphics{UniLogo}
		\end{center}
		\vspace*{\stretch{1}}
		\begin{center}
			\sffamily\large M{\"u}nchen 2009
		\end{center}
		\newpage
		\thispagestyle{empty}
		\mbox{}
		\cleardoublepage
		%
		\thispagestyle{empty}
		\vspace*{\stretch{1}}
    {\parindent0cm\rule{\linewidth}{.5ex}}
    \begin{center}
    	\vspace*{\stretch{0.5}}
    	\sffamily\bfseries\LARGE\@title\\
    	\vspace*{\stretch{1}}
    	\sffamily\bfseries\large\@author
    	\vspace*{\stretch{0.5}}
    \end{center}
    \rule{\linewidth}{.5ex}
		\vspace*{\stretch{3}}
		\begin{center}
			\sffamily\large Bachelorarbeit\\
			an der Fakultät für Physik\\
			der Ludwig-Maximilians-Universität\\
			München\\
			\vspace*{\stretch{1}}
			vorgelegt von\\
			\@author\\
			aus Köthen\\
			\vspace*{\stretch{2}}
			München, den \@date
		\end{center}
		\newpage
		%
		\thispagestyle{empty}
		\vspace*{\stretch{1}}
		\begin{flushleft}
			\sffamily\large Erstgutachter:\\[1mm]
			Zweitgutachter:
		\end{flushleft}
		\cleardoublepage
		% Erklärung
		\thispagestyle{empty}
		\noindent\Large{Erkl{\"a}rung}\\
	
		\vspace*{2ex}
		\noindent
		\normalsize
		Ich versichere, dass ich die vorliegende Arbeit selbst{\"a}ndig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.\\
	
		\vspace*{2ex}
	
		\small
		\noindent
		\dotfill \\
		{\small(Ort, Datum)}\hfill{\small (Unterschrift)}
		\normalsize
		\cleardoublepage
}
