REPO="https://nift4.github.io/makre-packages"
rm -rdf tar-files/*
MD="# Packages"
for X in `cd src;find . -mindepth 1 -maxdepth 1 -type d;cd ..`;do
	cd src/$X
	tar Jcf ../../tar-files/${X}.tar *
	DESC=`cat DESC`
	MD="${MD}\n## ${X:2}\n### Description\n${DESC}\n### Website\n[Click](${REPO}/src/${X:2}/index.html)"
	cd ../..
done
echo -e $MD > packages.md
git add .
git commit -m "Update compiled packages. (build.sh)"
git push origin master
