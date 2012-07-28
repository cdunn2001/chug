JAVAC=javac
#JAVAC=/usr/bin/javac
#JAVA=/usr/bin/java -classpath=.

default: sample
sample: chug
chug: Chug.class Foo.class
	java Chug Foo

%.class: %.java
	${JAVAC} $<
clean:
	\rm -f *.class
