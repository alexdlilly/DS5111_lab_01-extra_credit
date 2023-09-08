pg1065:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

raven_lines:
	grep -w -i -E "raven" pg1065.txt > raven_lines.txt

number_of_Raven:
	grep -w -c -E "Raven" pg1065.txt > number_of_Raven.txt

number_of_RAVEN:
	grep -w -c -E "RAVEN" pg1065.txt > number_of_RAVEN.txt

number_of_raven:
	grep -w -c -E "raven" pg1065.txt > number_of_raven.txt

all:
	make pg1065
	make raven_lines
	make number_of_Raven
	make number_of_RAVEN
	make number_of_raven

clean:
	rm pg1065.txt
	rm raven_lines.txt
	rm number_of_Raven.txt
	rm number_of_RAVEN.txt
	rm number_of_raven.txt

