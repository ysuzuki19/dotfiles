#Command Lists


##Convert \*.md to \*.html
###install package
$ sudo apt install pandoc
###convert \*.md to \*.html stdout
$ pandoc filename.md 
###output html format from \*.md
$ pandoc filename.md > filename.html

##View html file preview on terminal
###install pavkage
$ sudo apt install lynx
###view html preview
$ lynx filename.html

##View html preview from md format file
$ pandoc filename.md | lynx -stdin
