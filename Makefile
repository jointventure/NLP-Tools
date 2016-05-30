SHELL = /bin/bash
NOPUNCT = sed "s/\W/\n/g"
 
t2:
	wget http://ufal.mff.cuni.cz/~zabokrtsky/courses/npfl092/html/data/skakalpes-il2.txt
 
t3:
	cat skakalpes-il2.txt | less
 
t4:
	iconv -f iso-8859-2 -t utf-8 skakalpes-il2.txt > skakalpes-utf8.txt

t5:
	cat skakalpes-utf8.txt | less

t6:
	wc -l skakalpes-utf8.txt

t7:
	head -15 skakalpes-utf8.txt; \
	tail -15 skakalpes-utf8.txt; \
	head -20 skakalpes-utf8.txt | tail -10

t8:
	cut -d' ' -f1,2 skakalpes-utf8.txt

t9:
	grep -E '[0-9]+' skakalpes-utf8.txt

t10:
	$(NOPUNCT) skakalpes-utf8.txt

t11:
	$(NOPUNCT) skakalpes-utf8.txt | grep -v '^$$'

t12:
	$(NOPUNCT) skakalpes-utf8.txt | grep -v '^$$' | sort

t13:
	wc -w skakalpes-utf8.txt

t14:
	$(NOPUNCT) skakalpes-utf8.txt | grep -v '^$$' | sort | uniq | wc -w

t15:
	$(NOPUNCT) skakalpes-utf8.txt | grep -v '^$$' | sort | uniq -c | sort -nr

t16:
	$(NOPUNCT) skakalpes-utf8.txt | grep -o '[a-zA-Z]' | sort | uniq -c | sort -nr

t17:
	$(NOPUNCT) skakalpes-utf8.txt | grep -v '^$$' > skakalpes-bi.txt; \
	sed -e '1d' skakalpes-bi.txt > skakalpes-gram.txt; \
	paste skakalpes-bi.txt skakalpes-gram.txt | sort | uniq -c | sort -nr; \
	rm skakalpes-gram.txt skakalpes-bi.txt

t18:
	wget www.idnes.cz; \
	iconv -f windows-1250 -t utf8 index.html > index-utf8.html; \
	rm index.html; \
	$(NOPUNCT) index-utf8.html | grep -v '^$$' > index-bi.html; \
	cat index-bi.html | sed -e '1d' > index-gram.html; \
	paste index-bi.html index-gram.html | grep '^[A-Z].*[A-Z][A-Za-z]*$$' | sort | uniq -c | sort -nr | less; \
	rm index-gram.html index-bi.html; \
	grep -o '\<[^\>]\+\>' index-utf8.html | sort | uniq -c | sort -nr | less
