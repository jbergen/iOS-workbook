import UIKit

/**
 
 Subclassing UIKit classes can seem tricky at the outset, but is actually not that difficult.
 There are some things to remember that will make your life easier though.
 

 Designated initializers
 ====
 
 Many UIKit classes have what is known as a "Designated Initializer" that must be called by every
 implementation and subclass of that class. Failing to do so will cause compiler errors.

 A simple example of this is UIView has the designated initializer `init(frame: CGRect)` and all
 subclasses must call this in their init implementations

 */


class NamedView: UIView {
    let name: String

    /**
    // this init implementation will give an error because it does not call `super.init(frame: CGRect)`
    
     init(name: String) {
        self.name = name
        super.init() // NOT a designated initializer
    }
    */

    init(name: String) {
        // set any class params before calling `super.init`
        self.name = name
        // this calls the designated initializer, and makes the view 100 x 100 at origin
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // after `super.init` we can perform other actions or call functions needed to set up the view (class)
        backgroundColor = .red
    }

    // necessary garbage
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



/**
 
 While most classes can be subclassed, and most of those can have custom initializers in my experience 
 some classes prefer to not have custom initializers. In those cases, alternate ways should be set up to 
 pass in needed information to the class. 
 
 An example of a class that resists having a custom initializer is UITableCell. Because of the way 
 tables use and reuse cells, I'd avoid passing params in on initialization.
 
 */


/**
 
 while this CustomCell class works fine with a custom initializer, it's a little troublesome imo because of
 how the super init is defined.

 */
class CustomWeirdCell: UITableViewCell {
    let name: String

    init(name: String) {
        self.name = name
        super.init(style: .default, reuseIdentifier: "reuse id")
        contentView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/**
 
 Alternatively, just keep and override the designated initializer and set class properties separately.
 this means that you'll need to make the properties optional, but this is not a bad thing especially
 in the context of a recycling view. The difference is relatively minor, but this cell is generally
 more portable than CustomWeirdCell
 
 */
class CustomCell: UITableViewCell {
    var name: String?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "reuse id")
        contentView.backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
