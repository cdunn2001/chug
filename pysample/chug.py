"""Using the Python inspect module.

This will import 'api.py' and print some stuff about its contents.

It is difficult to enforce the use of annotations for all arguments,
but possible.

It is even hard to discern which methods are staticmethods.
 http://stackoverflow.com/questions/949259/how-do-i-infer-the-class-to-which-a-staticmethod-belongs

There are just too many hoops to jump through. I think we will be
missing cases.

It seems better to rely on Java's reflection and type system, and
to dump all info to JSON. Then, chug can be implemented in *any*
language.
"""
import inspect, sys
import api

def PrintAnno(func):
    print(func, func.__annotations__)
def PrintClass(definition):
    print(definition)
    for m in inspect.getmembers(definition):
        if inspect.isfunction(m[1]):
            print("\t", m[1])
            print("\t", inspect.getfullargspec(m[1]))

members = inspect.getmembers(api, lambda member: (inspect.isclass(member) or inspect.isfunction(member)) and member.__module__ == api.__name__)
all = dict(members)
for name, definition in all.items():
    if inspect.isfunction(definition):
        print(definition)
        print(inspect.getfullargspec(definition))
    elif inspect.isclass(definition):
        PrintClass(definition)
    else:
        raise RuntimeError(definition)
    print()
