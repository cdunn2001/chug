// vim: et ts=8 sts=2 sw=2
#include <boost/filesystem.hpp>
#include <boost/intrusive_ptr.hpp>
#include <string>
#include <vector>

namespace plug {
  typedef std::string String;
  typedef int Int;
  typedef int LongInt;
  typedef float Float;

  class Foo;
  typedef boost::intrusive_ptr<Foo> FooPtr;

  class Foo
  {
  public:
    virtual FooPtr makeFoo(Int x, String y, Float z);
    virtual std::vector<Int> makeList(LongInt n);
    static Int mystaticfunc(Int x);  
  };
}
