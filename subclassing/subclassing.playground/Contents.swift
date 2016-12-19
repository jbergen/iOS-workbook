import Foundation

/**

 Subclassing
 
 Subclassing is one of the most important aspects of object oriented programming (OOP). The ability
 to add and modify class functionality. Subclassing is an extrodinarily powerful part of OOP that 
 is both difficult to understand, and easy to abuse.

 */



/**

 The class `Animal` that can represent any animal by simply giving it a name.
 This class does not specify any individual characteristics about the animal however because it may
 not apply to all types of animals.
 
 */

class Animal {
    let species: String

    init(species: String) {
        self.species = species
    }
}

// Here I define an animal and name it "Kangaroo", this works fine, but is pretty non-specific
let kangaroo = Animal(species: "Kangaroo")




/**

 Because a kangaroo can be different colors and different sexes, I'm going to go further
 and create a Kangaroo subclass of Animal that has properties for `color` and `female`.

 */

class Kangaroo: Animal {

    // I'm using String because it's easier to read in pseudo code
    let color: String

    // I'm using a Bool because I wanted a binary choice for this property
    let female: Bool

    // This initializer only has properties for things related to Kangaroos `color` and `female`
    init(color: String, female: Bool) {
        // first set the properties for the class before the call to `super.init`. failing to do so will result in a compiler error
        self.color = color
        self.female = female

        // because all instances of the Kangaroo class should have the name "Kangaroo" set it here and it will propagate to all instances without having to be passed in explicitly everytime a Kangaroo is created
        super.init(species: "Kangaroo")
    }
}

// here I define three instances of Kangaroo with different properties
let redKangaroo = Kangaroo(color: "red", female: true)
let grayKangaroo = Kangaroo(color: "gray", female: false)
let brownKangaroo = Kangaroo(color: "brown", female: true)

// testing the kangaroo name
redKangaroo.species




/**
 
 lets say I want to add some functionality to the Kangroo class. We have a three basic options:
 
 - we can go back and add it directly to the class (this is generally the most straight forward way of doing this)
 - we could create a new subclass of kangaroo that includes the new functionality (though there should be a good reason for this)
 - we can add a class extension which allows us to add functionality, without touching the original class. This is good when you're adding non-essential logic or want to isolate code for some reason (commonly when a class interacts with an external framework or has imports you want to islate)

 
 I'm going to add an extension function to the Kangaroo class to tell me if the kangaroo has a pouch or not. It will be a dynamic property that will rely on already existing properties

 */

extension Kangaroo {
    /**
     I'm making the assumption that only female kangaroos have pouches.
    */
    var hasPouch: Bool {
        return female
    }
}

// Testing out my extension variable
redKangaroo.hasPouch
grayKangaroo.hasPouch
brownKangaroo.hasPouch




/**
 
 Ok, kangaroos are cool, but what about pets? They're types of animals, but they generally have a name and
 an owner. I'll create a new subclass of Animal and name it Pet to add those properties, but keep it nice
 and generic still
 
 */

class Pet: Animal {
    let name: String // the name of the pet
    let owner: String // the name of the owner

    init(name: String, owner: String, species: String) {
        // set the subclass' properties before `super.init`
        self.name = name
        self.owner = owner

        // call the super init and pass through `species`
        super.init(species: species)
    }
}

// Now I can have that pet hamster I've always wanted!!
let buddy = Pet(name: "Buddy", owner: "Joseph", species: "Hamster")




/**
 
 But lets say I want to further subclass my Pet class to have a dog class and have dog properties
 
 */

class Dog: Pet {
    let breed: String

    init(name: String, breed: String, owner: String) {
        self.breed = breed
        super.init(name: name, owner: owner, species: "Dog")
    }
}

// now I can finally have my dog!!
let bandito = Dog(name: "Bandito", breed: "Mixed", owner: "Joseph")

