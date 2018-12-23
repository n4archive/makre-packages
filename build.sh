rm -rdf tar-files/*
for X in `cd src;find . -mindepth 1 -maxdepth 1 -type d;cd ..`;do
	cd src/$X
	tar Jcf ../../tar-files/${X}.txz *
	cd ../..
done
git add .
git commit -m "Update compiled packages. (build.sh)"
git push origin master
