Subclassing
====

Subclassing is one of the most important aspects of object oriented programming (OOP). The ability to add and modify class functionality. Subclassing is an extrodinarily powerful part of OOP that is both difficult to understand, and easy to abuse.

## Subclassing custom classes

Subclassing your own custom classes is by far the easiest to understand. This is partially because you are more likely to know all about the class and it's properties, and also because the classes you will write are probably going to be native swift classes and you won't have to worry about some of the oddities that come along with subclassing classes from Objective C.

## Subclassing other classes

Subclassing someone else's classes is really not that difficult, but various requirements may make it slightly more tricky. You must be aware that overriding an init or providing a convenience initializer can cause issues if there is a designated initializer in the parent class. You may need to look at the class or its documentation to see exactly what is required.

## Playgrounds

Check out the subclassing playground to see how classes and subclasses work in practice.

- subclassing.playground
- subclassing-uikit.playground

