import java.lang.String;
import java.lang.Integer;
import java.util.List;

/**
 Foo is the API we are "hugging".
 Eventually, we will separate it from Hug, of course, but
 for now it is our canonical API.
 */
abstract class Foo {
    public static Integer mystaticfunc(int x) {return null;}

    public abstract Foo makeFoo(int x, String y, float z);
    public abstract List<Integer> makeList(long n);
}
