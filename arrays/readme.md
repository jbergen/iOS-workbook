Arrays
====


## Filtering Arrays

Filtering an array of items using a few different methods. None of these are "more" correct than others and all should yield the exact same results. In general, the shorter and more readable the code is, the better it is in the long run. You may find as you're writing your own code that you might start with a simpler and more verbose version as you're figuring out the logic needed to correctly filter and then replace with more elegant code later on. As you do this, it's often helpful to draw your loop and logic with pen and paper, write out the steps in pseudo code, and write plenty of in-line comments so you can easily come back to the code and remember what you were thinking and what you've already done.
 
### Nested Loop
 
This type of filter is the probably the most simple and can be read pretty easily. Although it's verbose, it's not bad to start with something like this.
 
Basically, the loop looks at every item in the array and then loops through every category within the `categories` array to compare it with the `categoryFilter` value. These sorts of nested loops are very useful but can quickly get difficult to read. In this case it's not bad, but try not to go further than two nested loops deep for your sanity.

```swift
func nestedLoopFilter(array: [Post], categoryFilter: Int) -> [Post] {

    // define a results array before and outside the initial loop. We only want to initialize this once per filter
    var results = [Post]()

    // start our outer loop where we're going to go through each post item within the array
    for post in array {

        // start our inner loop where we're going to go through each category id in the current post and compare to the categoryFilter
        for catId in post.categories {
            if catId == categoryFilter {
                // if the category ids match, then add it to the results array
                results.append(post)
                // Since a post can only belong to a category once, It's good practice to stop the loop when you meet your requirements
                break
            }
        }
    }
    return results
}
```


### forEach
 
This method performs the same function as the Nested Loops above, but with a (sometimes) more convenient syntax
 
see: https://developer.apple.com/reference/swift/array/1689783-foreach
 
 ```swift
func forEachLoopFilter(array: [Post], categoryFilter: Int) -> [Post] {

    // again, we must define our results array before the loop begins
    var results = [Post]()

    // here is where the syntax differs. The `forEach` function takes a function that is called each time the loop is performed.
    array.forEach { post in
        post.categories.forEach { categoryId in
            if categoryId == categoryFilter {
                results.append(post)
            }
        }
    }
    return results
}
```


### flatMap
 
The flatMap function is an extraordinarily useful function that takes an array and allows you to return another array. `flatMap` takes  a function that returns either the object of type that your resulting array takes, or `nil` if you want to skip putting in a value for that particular loop.

see: https://developer.apple.com/reference/swift/dictionary/1687661-flatmap
https://www.natashatherobot.com/swift-2-flatmap/
 
#### Set
 
In this example I take advantage of a special kind of array called Set. A set is a only one of each item can exist in each Set. It has a few special functions that include `contains` which returns true if the passed value is in the set, or false if it is not included.
 
see: https://developer.apple.com/reference/swift/set

```swift
func flatMapFilter(array: [Post], categoryFilter: Int) -> [Post] {

    // Creating the flat map and setting it to the results array
    let results: [Post] = array.flatMap { post in

        // Creating a set out of our categories array!
        let categorySet = Set(post.categories)

        // Ask if the set contains the category filter
        if categorySet.contains(categoryFilter) {
            // if it does contain the value, then return it for inclusion in the results array
            return post
        }

        // if we get to this point, we have not found a category match, so we return nil and do not any thing to the results array
        return nil
    }

    return results
}
```

### flatMap version 2

Here I do flatmap, but in one line. Take your time and unpack all the things happening in this function:
 
 - flatMap
 - $0 is the loop value (same as `post` in the expression: `array.flatMap { post in`)
 - Making a Set with the post.categories array
 - Using `contains` on the Set
 - Ternary operator to determine whether to pass the post ($0) or not (nil). Ternary is expressed as `var value = Bool ? trueValue : falseValue` See: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID71
 - returning the post on the first line without first assigning to a variable

```swift
func smallFlatMapFilter(array: [Post], categoryFilter: Int) -> [Post] {
    return array.flatMap { return Set($0.categories).contains(categoryFilter) ? $0 : nil }
}
```

### filter

This version uses the `filter` function which takes a function that is called for every element in the array and has to return a Bool depending on whether or not the element should be part of the final array or not.

```swift
func arrayFilter(array: [Post], categoryFilter: Int) -> [Post] {
    return array.filter {
        for catId in $0.categories {
            if catId == categoryFilter {
                return true
            }
        }
        return false
    }
}
```


### filter version 2
 
This version is similar to the previous filter, but condensed down to a single line. Note how since the `contains` function returns a Bool the code becomes very simple and is actually pretty readable.

```swift
func smallArrayFilter(array: [Post], categoryFilter: Int) -> [Post] {
    return array.filter { Set($0.categories).contains(categoryFilter) }
}
```

### Playground

All these examples can be found in working order in filters.playground in this repo
