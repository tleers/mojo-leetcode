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
