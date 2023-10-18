pg1065:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

# this is a good start, though you're capturing the lines themselves and not the count,
# so something like `grep -w -i -E "raven" pg1065.txt | wc -l > raven_lines.txt; cat raven_lines.txt` would
# get you the count, and then as a separate action, note the `;`, cat that number to the command line.
# So we can just adjust these lines, but before you do that look at the next comment...
raven_lines:
	grep -w -i -E "raven" pg1065.txt > raven_lines.txt

# just realized, there is a bug related to the OS, a bug really in the assignment... I must have used different names
# when I was testing, because linux is treating ANY variation of spelling as the same.  In other words
# it's case insensitive.  Thus the file names collide.  To fix this plese replace the `number_of_` part with
# `one_`, `two_`, etc.. that should avoid the collision.
number_of_Raven:
	grep -w -c -E "Raven" pg1065.txt > number_of_Raven.txt

# another change we need in general, is that the job name, if not a `.PHONY:`, needs to match the name of the file
# it generates, so the job name should end in `.txt`
number_of_RAVEN:
	grep -w -c -E "RAVEN" pg1065.txt > number_of_RAVEN.txt

number_of_raven:
	grep -w -c -E "raven" pg1065.txt > number_of_raven.txt

# although this works, we want to use the makefile method for the dependency, 
# so put all the upstream jobs to `all` on the same line, like `all: pg1065.txt raven_lines.txt...` etc
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

