// vim: et ts=8 sts=2 sw=2
#include "Foo-plug.h"
#include "Foo-nag.h"

using namespace plug;

extern "C" {

void* Foo_makeFoo(void* obj, int x, char* y, float z)
{
  FooPtr rv = static_cast<Foo*>(obj)->makeFoo(x, y, z);
  return static_cast<void*>(rv.get());
}
/*std::vector<Int>*/
void Foo_makeList(void* obj, long n)
{
  static_cast<Foo*>(obj)->makeList(n);
}
int Foo_mystaticfunc(int x)
{
  return Foo::mystaticfunc(x);
}

}
