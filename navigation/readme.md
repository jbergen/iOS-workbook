Navigation
====

Unless your app is literally one screen, you'll need a way to allow the user to view other screens and make their way back to where they started. Look around at other apps to see how they do this. Some get fancy with animated transitions, some stick to the basic UIKit provided transitions which are not too bad in many situations. In either case though, the concepts are pretty much the same and are generally easy to grasp.

## A Stack of Index Cards

Think about your app as a stack of index cards where each index cards represents a screen on your app. If you have a UITableViewController displaying a list of data that's a card. If you have a settings screen, that's a card. etc etc. 

Now imagine that you've just opened your app and home screen/card is there by itself. One view, nbd. Then you decide to change your settings and press a button on the home screen/card to see that card/screen. When you do this, you take the settings screen card and place it on top of your home screen card in a pile. The home screen is no longer visible, it's still there, it's just covered up by the settings screen. Then when you've decided to go back to the home card/screen, you can just discard the topmost card/screen and reveal the home card/screen. You can imagine a much more complex navigation that goes far deeper, but the concept of the stack remains the same. Screens added get added to the top of the stack and to go navigate backwards, you just need to remove the topmost card or cards to reveal the cards below.


## Two Ways to Navigate

### Present Modally

This is the simplest way to put a view on screen which is generally called a modal. You can present from any visible UIViewController by calling `present(viewController:animated:completion)`. By default, the incoming screen will slide up from the bottom to cover the screen. When dismissing the view controller, the screen will slide down to reveal the underlying view controller.

This type of presentation is ideal for performing short, discrete tasks that belong "in the flow." Many times short forms, data entry, or filters are done modally. 

https://developer.apple.com/reference/uikit/uiviewcontroller/1621380-present


### Push (and pop)

Pushing is also very simple to accomplish, but requires the use of a UINavigationController. By default, the incoming screen will slide in from right to left and cover the screen. It will also place a back arrow in the upper left of the navigation bar which enables default navigation between screens. Dismissing the view controller (Popping) reverses the animation and slides the screen from left to right revealing the view controller underneath.

This type of presentation is ideal for "drilling deep" into content. Like tapping on a user to see their user screen, or tapping on a piece of content in a feed to see the detail view. The Navigation controller makes it easy for users to keep their bearings within your app.

https://developer.apple.com/reference/uikit/uinavigationcontroller/1621887-pushviewcontroller


## Your Friend UINavigationController

The UINavigationController seems like a difficult class to understand, but it really isn't too hard. It's a subclass of UIViewController that provides two primary and valuable services. 1) It has and maintains a `UINavigationBar` which does everything from show titles and buttons, to automatically providing back navigation. 2) It helps maintain the stack of view controllers as users progress through your app with easy functions to push and pop these view controllers.

Most frequently apps will have a UINavigationController as the primary view controller and utilize it's powerful navigation features as the underlying structure for the app.

