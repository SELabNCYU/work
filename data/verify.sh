#!/bin/bash
set -e


cd work
cat data/graph.txt
git checkout $PROJECT_BRANCH
git log --graph --abbrev-commit --decorate --format=format:'%C(white)%s%C(reset) %C(dim white)' $PROJECT_BRANCH > ../ex_graph.txt
cd ..
cat ex_graph.txt
if [ `diff ex_graph.txt work/data/graph.txt | wc -l` -ne 0 ]; then
	echo "Your rebase or merge operation is incorrect!"
	exit 1
fi

if [ `diff 1A_elements.txt work/data/data.txt | wc -l` -ne 0 ]; then
	echo "1A_elements.txt content is incorrect!"
	exit 1
fi

exit 0
