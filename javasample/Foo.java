import java.lang.String;
import java.lang.Integer;
import java.util.List;

abstract class Foo {
    public static Integer mystaticfunc(int x) {return null;}

    public abstract Foo makeFoo(int x, String y, float z);
    public abstract List<Integer> makeList(long n);
}
