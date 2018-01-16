# adds homebrew python packages dir to python paths

echo "import site; site.addsitedir(\"$HOME/Library/Homebrew/lib/python2.7/site-packages\")" >> \
	$HOME/Library/Python/2.7/lib/python/site-packages/homebrew.pth
