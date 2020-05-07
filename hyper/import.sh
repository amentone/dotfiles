if ! type hyper > /dev/null; then
	echo "Hyper.js: command not found, check if the program has been installed!"
else
	hyper i hyper-search 
	hyper i hyper-highlight-active-pane
	hyper i hyper-fading-scrollbar
	ln -s -f -v $PWD/hyper.js.link $HOME/.hyper.js
	echo "Import completed!"
fi

