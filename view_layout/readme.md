View Layout
====

Most UI elements in UIKit are subclasses of UIView and behave in very similar ways to one another. So if you can understand how to create layouts in a simple UIView you will have a much easier time creating layouts using any of the more specialized views provided by UIKit.

There are three primary ways to define layouts each with pros and cons:

## Interface Builder
Interface builder (IB) is Apple's visual layout interface which makes it simple to create, drag & drop views and edit attributes for views and subviews. Despite being a very visual person, personally I find mixing code & visual layouts to be cumbersome difficult to maintain. Small projects may benefit more using IB, but in larger projects it would be a hinderance IMO. I will not be covering IB in these documents.

## AutoLayout
Autolayout is used extensively in IB, but can also be used programmatically to great effect. While the syntax can be a little verbose, it can actually enable very flexible layouts with minimal calculations in the code.

####Pros 
- Create solid, flexible layouts that work for a variety of devices and sizes
- Layouts can be very simple or very complex and can also be modified
- Great for when you're creating a view that does not know how large it will be when drawn. It will adjust its layout dynamically depending on its frame (depending on your design & constraints)
- Some built-in goodies (like auto-height for UITableViewCell)
- Using AutoLayout on UILabels can make life easier (for sizing)

####Cons
- Constraints can be difficult to debug. If one constraint breaks, it may be difficult to determine which one is acting up
- The code to create constraints is ugly
- Changing and updating constraints requires keeping track of them which may not be fun
- Animating constraints is possible, but not awesome
- More than four constraints or having to deal with constraint priorities gets complicated quickly

*note: as a rule of thumb, I use AutoLayout when I wont be able to calculate the frame of the enclosing view.* 

## Frames
Laying out views using their frames is the most dependable and easiest to understand because you're explicitly telling where to layout in the view.

#### Pros
- Frames are easy to understand and calculating them is often easier and faster than autolayout
- Animations are trivial using frames
- No need to retain anything if you need to change the frame later
- Easy to see changes and propagate variables throughout the layout

#### Cons
- May not be ideal for views that are likely to drastically change size (shrink or grow)
- More complicated layouts can require more complicated calculations