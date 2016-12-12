import UIKit
import PlaygroundSupport

/**

 Setup parent view for subviews to live in

 to see views if you cannot, go to View > Assistant Editor > Show Assistant Editor

 */
let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
parentView.backgroundColor = .white
PlaygroundPage.current.liveView = parentView

/**
 
 Frame Layouts

 */

// Creating a new UIView that will be red, wide and short padded by an amount on all sides
let redView = UIView()
redView.backgroundColor = .red                          // add background color
redView.frame = CGRect(x: 20,                           // left padding
                       y: 20,                           // top padding
                       width: parentView.bounds.width - 20 - 20, // use the parent view to determine the width of the view taking into account padding
                       height: 50)                      // set an arbitrary height value
parentView.addSubview(redView)                          // Don't forget to add the view as a subview!!

// I'm going to add a green view which will be the same size as redView but below it and padded by 10px
let orangeView = UIView()
orangeView.backgroundColor = .orange
orangeView.frame = CGRect(x: redView.frame.origin.x,    // use the same x origin value as redView
                         y: redView.frame.maxY + 10,    // for the y origin value, take the maximum y value of redView and add 10
                         width: redView.frame.width,    // use the same width & height from redView
                         height: redView.frame.height)
parentView.addSubview(orangeView)                       // Don't forget to add the view!!

// Adding another view with a different way of modifying the frame
let yellowView = UIView()
yellowView.backgroundColor = .yellow
var yellowFrame = orangeView.frame                      // get the frame from orangeView since we're going to copy the size and just change the origin
yellowFrame.origin.y = orangeView.frame.maxY + 10       // change the origin y to be 10 pts below orangeView's max y
yellowView.frame = yellowFrame                          // set the frame
parentView.addSubview(yellowView)

/**
 
 AutoLayout
 
 */

// I'm going to create a green view that does what the frame layouts do above to show the syntax for AutoLayout
let greenView = UIView()
greenView.backgroundColor = .green
parentView.addSubview(greenView)                        // The subview must be added before constraints are added or there will be an error
greenView.translatesAutoresizingMaskIntoConstraints = false // Set this property to `false` for the view you want to use AutoLayout with

// activate the constrains in this array of constraints
NSLayoutConstraint.activate([
    // Set the left edge of greenView
    NSLayoutConstraint(item: greenView,                 // `item` is the view that is being constrained
                       attribute: .left,                // `attribute` is the layout property being constrained on `item`
                       relatedBy: .equal,               // `relatedBy` is the type of constraint. 99% of the time this will be `.equal` for basic layouts
                       toItem: yellowView,              // `toItem` is the view that is being looked at for comparison
                       attribute: .left,                // `attribute` is the property on the `toItem` that is being referenced
                       multiplier: 1.0,                 // `multiplier` can be used to multiply the constraint (a value of 0.5 would make the value be half of what it would be at 1.0, or 2.0 would be two times)
                       constant: 0.0),                  // `constant` is a value to add (or subtract) from the layout value. Good for offsets and such.
    // Set the right edge of greenView
    NSLayoutConstraint(item: greenView,
                       attribute: .right,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .right,
                       multiplier: 1.0,
                       constant: 0.0),
    // Set the top edge of greenView
    NSLayoutConstraint(item: greenView,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .bottom,
                       multiplier: 1.0,
                       constant: 10.0),
    // Set the height of greenView
    NSLayoutConstraint(item: greenView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .height,
                       multiplier: 1.0,
                       constant: 0.0)
    ])

// Using AutoLayout to layout a view in relation to greenView & parentView
let blueView = UIView()
blueView.backgroundColor = .blue
parentView.addSubview(blueView)
blueView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    NSLayoutConstraint(item: blueView,
                       attribute: .left,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .left,
                       multiplier: 1.0,
                       constant: 0.0),
    NSLayoutConstraint(item: blueView,
                       attribute: .right,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .right,
                       multiplier: 1.0,
                       constant: 0.0),
    NSLayoutConstraint(item: blueView,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: greenView,
                       attribute: .bottom,
                       multiplier: 1.0,
                       constant: 10.0),
    // Set the bottom of blueView in relation to the parent view
    NSLayoutConstraint(item: blueView,
                       attribute: .bottom,
                       relatedBy: .equal,
                       toItem: parentView,
                       attribute: .bottom,
                       multiplier: 1.0,
                       constant: -20.0)
    ])

/**
 
 Here's an example of a UILabel being added as a subview of blueView
 Because blueLabel is using AutoLayout, it's going to be easier to use autoLayout on it's subviews as well

 */
let helloWorldLabel = UILabel()
helloWorldLabel.textColor = .white
helloWorldLabel.text = "Hello 🌏!"
helloWorldLabel.font = UIFont.systemFont(ofSize: 50)
helloWorldLabel.textAlignment = .center
blueView.addSubview(helloWorldLabel)
helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    NSLayoutConstraint(item: helloWorldLabel,
                       attribute: .left,
                       relatedBy: .equal,
                       toItem: blueView,
                       attribute: .left,
                       multiplier: 1.0,
                       constant: 20.0),
    NSLayoutConstraint(item: helloWorldLabel,
                       attribute: .right,
                       relatedBy: .equal,
                       toItem: blueView,
                       attribute: .right,
                       multiplier: 1.0,
                       constant: -20.0),
    NSLayoutConstraint(item: helloWorldLabel,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: blueView,
                       attribute: .top,
                       multiplier: 1.0,
                       constant: 20.0),
    NSLayoutConstraint(item: helloWorldLabel,
                       attribute: .bottom,
                       relatedBy: .equal,
                       toItem: blueView,
                       attribute: .bottom,
                       multiplier: 1.0,
                       constant: -20.0)
    ])
