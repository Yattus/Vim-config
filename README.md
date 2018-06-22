# Vim-config
Vim customization for python and web developer django.

C'est une petite retouche de la configuration
du répertoire " https://github.com/ets-labs/vimrc. "

J'ai remarqué un petit manque de tuto sur #vim 
en français bien sûr, donc j'ai décidé de partager 
cette celle-ci...

Installation:
Avant de passer à l'installation assurez vous de sauvegarder vos anciens fichiers
( Vimrc et .vim) sinon ils pourront être écrasé.

Réquire Vundle: 
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim.

go sur https://github.com/VundleVim/Vundle.vim pour plus d'informations.

Exécuter ces differentes commandes dans votre terminale: 
clone le repertoire.
$ git clone https://github.com/Yattus/Vim-config.git

Deplace vous dans le répertoire Vim-config
$ cd Vim-config

À l'intérieur, copie le vimrc filé dans le répertoire principal.
Vim-config$ cp vimrc ~/

Rénommé le vimrc en .vimrc (si vous en aviez déjà un, deplacez le
dans d'un autre répertoire afin de la pas l'ecrasé).
$ mv vimrc .vimrc

exécute vim, ignoré les erreurs ce sont des plugins non installés.
Pour installer les plugins, une fois dans vim exécute la commande suivante:
:PluginInstall

have fun ;)!
