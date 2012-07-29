JAVAC=javac
#JAVAC=/usr/bin/javac
#JAVA=/usr/bin/java -classpath=.

default: sample
sample: hug
hug: Hug.class Foo.class
	java Hug Foo

%.class: %.java
	${JAVAC} $<
clean:
	\rm -f *.class
