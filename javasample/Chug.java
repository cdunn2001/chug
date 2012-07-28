// vim: et ts=8 sts=2 sw=2
//import java.lang.reflect.Class;

public class Chug {
  static void p(Object o) {
    System.out.println(o.toString());
  }
  static void findClass(String name) {
    try {
      Class c = Class.forName(name);
      java.lang.reflect.Method methods[] = c.getDeclaredMethods();
      p("Num methods for " + name + ": " + methods.length);
      for (java.lang.reflect.Method m: methods)
        p(m);
    } catch (java.lang.ClassNotFoundException e) {
      throw new java.lang.RuntimeException(e);
    }
  }
  public static void main(String[] args) {
    p("Num args: " + args.length);
    for(String arg: args) {
      p("Searching for class '" + arg + "'");
      findClass(arg);
    }
    System.exit(0);
  }
}

