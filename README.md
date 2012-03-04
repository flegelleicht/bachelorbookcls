bachelorbook.cls
================

Origin
------
This is a modified version of the diploma thesis template provided by the AG Computervisualistik of the University of Koblenz. I made a few adjustments so that the template can be used for a bachelor thesis at LMU Munich. The main purpose was to make it straight forward to use by a LaTeX newbie.

The original can be found on this page: 

* [http://www.uni-koblenz.de/FB4/Institutes/ICV/AGMueller/DiplomaTheses](http://www.uni-koblenz.de/FB4/Institutes/ICV/AGMueller/DiplomaTheses)

or under this URL: 

* [http://geri.uni-koblenz.de/Vorlagen/cgDA_Latex.zip](http://geri.uni-koblenz.de/Vorlagen/cgDA_Latex.zip)

The files are encoded Latin-9 (mirroring the preset inputenc value in the .cls file).

Usage
-----
The class is straight forward to use because almost everything is required within the class file. There is not much left to "\usepackage". However that also means that you will have to change the class file if you disagree with some of the choices made.

Example
-------
    \documentclass[oneside,palatino,12pt]{bachelorbook}  
    \title{My awesome bachelor thesis}  
    \author{Me}

    \begin{document}
    \maketitle

    \chapter{Awesome introduction}
    Awesomeness!
    \end{document}

Options
-------
There are a few options:

* oneside|twoside
* palatino|times
* 12pt|11pt

Acknowledgement
---------------
I thank the creators and contributors of the original template:

* Markus Geimer
* Matthias Raspe

