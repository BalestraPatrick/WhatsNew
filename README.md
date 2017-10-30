# WhatsNew

[![CI Status](http://img.shields.io/travis/BalestraPatrick/WhatsNew.svg?style=flat)](https://travis-ci.org/BalestraPatrick/WhatsNew)
[![Version](https://img.shields.io/cocoapods/v/WhatsNew.svg?style=flat)](http://cocoapods.org/pods/WhatsNew)
[![License](https://img.shields.io/cocoapods/l/WhatsNew.svg?style=flat)](http://cocoapods.org/pods/WhatsNew)
[![Platform](https://img.shields.io/cocoapods/p/WhatsNew.svg?style=flat)](http://cocoapods.org/pods/WhatsNew)

<p align="center"><img src ="example.png" width="300px"/></p>

## Description
`WhatsNew` automatically displays a short description of the new features when users update your app. This is similar to what happens in Apple's apps like Pages, Numbers, Keynote, iMovie and TestFlight. 

Simply list your new features (with optional icons), customize the appeareance and when to show it (only on major updates for example).

## Usage
Run the example project from the `Example` directory and check out `ViewController.swift`.

```swift
import WhatsNew

let whatsNew = WhatsNewViewController(items: [
	WhatsNewItem.image(title: "Nice Icons", subtitle: "Completely customize colors, texts and icons.", image: #imageLiteral(resourceName: "love")),
	WhatsNewItem.image(title: "Such Easy", subtitle: "Setting this up only takes 2 lines of code, impressive you say?", image: #imageLiteral(resourceName: "threed")),
	WhatsNewItem.image(title: "Very Sleep", subtitle: "It helps you get more sleep by writing less code.", image: #imageLiteral(resourceName: "night")),
	WhatsNewItem.text(title: "Text Only", subtitle: "No icons? Just go with plain text."),
])
whatsNew.presentIfNeeded(on: self)
```

## Customizations
There are a bunch of customizable properties with relative documentation.

```swift
/// Defines when to present the What's New view controller. Check the `PresentationOption` enum for more details.
public var presentationOption: PresentationOption = .majorVersion

/// Closure invoked when the user dismisses the view controller.
public var onDismissal: (() -> Void)?

/// Text of the top title.
public var titleText: String = "What's New"

/// Color of the top title.
public var titleColor: UIColor = .black

/// Text of the bottom button that dismisses the view controller.
public var buttonText: String = "Continue"

/// Text color of the bottom button that dismisses the view controller.
public var buttonTextColor: UIColor = .yellow

/// Background color of the bottom button that dismisses the view controller.
public var buttonBackgroundColor: UIColor = .black
```

## Installation

`WhatsNew` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

```ruby
pod 'WhatsNew'
```

You can also use [Carthage](https://github.com/Carthage/Carthage) if you prefer. Add this line to your `Cartfile`.

```ruby
github "BalestraPatrick/WhatsNew"
```
## Requirements
iOS 9.3 and Swift 4.0 are required.

## Author

I'm [Patrick Balestra](http://www.patrickbalestra.com).
Email: [me@patrickbalestra.com](mailto:me@patrickbalestra.com)
Twitter: [@BalestraPatrick](http://twitter.com/BalestraPatrick).

## License

`WhatsNew` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.