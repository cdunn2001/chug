// vim: et ts=8 sts=2 sw=2
#include <boost/intrusive_ptr.hpp>
#include <string>
#include <vector>

namespace plug {
  class RefCounter
  {
    unsigned count;
  public:
    virtual ~RefCounter() {}
    void Inc() {
      ++count;
    }
    void Dec() {
      if (!--count) delete this;
    }
  };

  typedef std::string String;
  typedef int Int;
  typedef int LongInt;
  typedef float Float;

  class Foo;
  typedef boost::intrusive_ptr<Foo> FooPtr;

  class Foo: public RefCounter
  {
  public:
    virtual FooPtr makeFoo(Int x, String y, Float z);
    virtual std::vector<Int> makeList(LongInt n);
    static Int mystaticfunc(Int x);  
  };

  void intrusive_ptr_add_ref(Foo* p) {p->Inc();}
  void intrusive_ptr_release(Foo* p) {p->Dec();}
}
