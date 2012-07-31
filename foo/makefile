#BOOST=/opt/local/include
BOOST?=/opt/boost/include
CPPFLAGS+=-I${BOOST}

default: plug nag #swog
plug: Foo-plug.o
nag: Foo-nag.o
swog: Foo-cpp.o

Foo-plug.o: Foo-plug.cc
	${CXX} ${CPPFLAGS} -c -o $@ $<
Foo-nag.o: Foo-nag.cc
	${CXX} ${CPPFLAGS} -c -o $@ $<
clean:
	\rm -f *.o *.class
