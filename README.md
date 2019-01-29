# VariousTextFields

[![Version](https://img.shields.io/cocoapods/v/VariousTextFields.svg?style=flat)](http://cocoapods.org/pods/VariousTextFields)
[![License](https://img.shields.io/cocoapods/l/VariousTextFields.svg?style=flat)](http://cocoapods.org/pods/VariousTextFields)
[![Platform](https://img.shields.io/cocoapods/p/VariousTextFields.svg?style=flat)](http://cocoapods.org/pods/VariousTextFields)

A set of UITextField subclasses for form inputs:

1. amount(price) picker
2. picker view
3. date picker

![Example gif](Example/VariousTextFields/example.gif)


###AmountTextField
Easy to input decimal or float numbers, best input field for the price of a product.

###OptionsTextField
Pick a value from a given array of strings.

###DateTextField
A UITextField with a built in UIDatePicker.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

VariousTextFields is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "VariousTextFields"
```

Run `pod install`, then import any of the required text fields:

```
#import "AmountTextField.h"
#import "OptionsTextField.h"
#import "DateTextField.h"
```
If using storyboards/xibs don't forget to replace your class type from ***UITextField*** to ***AmountTextField (OptionsTextField, or  DateTextField)***

## Author

Cristian Azov <cristian.azov@yahoo.com>

## License

VariousTextFields is available under the MIT license. See the LICENSE file for more info.
