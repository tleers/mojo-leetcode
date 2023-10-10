# FAQ

## How does static typing work in Mojo? How is it different from Python?
Generally, Mojo has syntactically identical features as Python MyPy type annotations.

See https://docs.modular.com/mojo/programming-manual.html#strong-type-checking

### Can I use List[Int]? Can I constrain the size of an object in the argument itself? E.g. Array[Int[8]]?

Yes, and it depends.

You can define the types of arguments in the function definition as you would in Python.

```python
def print_stuff(stuff: str):
    print(stuff)
```

```mojo
def print_stuff(stuff: String):
    print(stuff)
```

are equivalent in their output. However, in the Mojo code we use the builtin "String" module of Mojo.

However, for some object implementations in Mojo, the static type hints can already include information about size and other aspects w.r.t. object initialisation.

For example:
```python
def print_first_element_from_tuple(nums: tuple):
    print(nums[0])
```

```mojo
from utils.static_tuple import StaticTuple
def print_first_element_from_tuple(nums: StaticTuple):
    print(nums[0])
```

TODO: What are the differences between Mojo's "StaticTuple" and Python's tuple implementation? Is it a correct comparison?

## There is no native dictionary or hashmap-table implementation. What do I do?

Use the python object dictionary. If you want to go Mojo-native, you can implement our own hashtable function, since Mojo has a Map object. 

The reason for this, presumably, is that the dictionary class in Python has average O(1) lookup-times, but this is not necessarily guaranteed, and it uses some heuristics and makes assumptions to serve as a nice general class. For systems programming, which is what you (probably) want to do if you're writing in native Mojo, you would preferably implement a more specific hashtable object, that is optimised for your usecase. More generally, you can use a Map data structure, i.e. a key-value data structure, and then write your own hashing function. That's what we did in LC3:
https://github.com/tleers/mojo-leetcode/solutions/3.mojo


Scratch that: See https://www.modular.com/blog/an-easy-introduction-to-mojo-for-python-programmers
There's probably no point to implementing a solution as proposed, because it's not where Mojo shines. Rather just use the Python object dictionary in this case. Maybe it's better to cast it as a graph or search? Would be nice to see if there's a trivial performance increase/loss by using mojo mostly and relying on python objects where it doesn't necessarily make sense to speed things up a lot with mojo.

TBD - should add performance benchmark and add a TODO to convert the pythonobject dict into a Mojo-native dict or hashmap or more performant alternative.

## How do I benchmark my Mojo implementation?

`from Time import now`


## How to do relative imports? 
Doesn't seem to work atm, see 3.mojo. Maybe update Mojo version on this codespace?

## How to do conversion from a Python Int to a Mojo Int

-> don't, not implemented
-> there is a PythonObject.to_float64() implementation
so just use float64 for the time being?

e.g.
```mojo
var hm = Python.dict()
var l: Float64 = 0
hm[0] = 0
l = hm[0].to_float64()
```
works

e.g.
```mojo
var hm = Python.dict()
var l: Int = 0
hm[0] = 0
l = hm[0]
```
doesn't work (can't convert PythonObject to Int)

TODO: Figure out whether there's a more efficient method that we can implement ourselves, probably using MLIR/SIMD?

## How to do a conversion from a Mojo Int to a Mojo Float or vice versa

-> not clear