![Bitter](https://github.com/uraimo/Bitter/raw/master/logo.png)

**A Swift Bits Manipulation Toolkit**

<p>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift2-compatible-4BC51D.svg?style=flat" alt="Swift 2 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/Bitter/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<!-- <a href="https://travis-ci.org/uraimo/Bitter"><img src="https://api.travis-ci.org/uraimo/Bitter.svg" alt="Travis CI"></a> -->
</p>

## Summary

The Bitter library extends all the basic Swift Int types with some useful methods for manipulating bits.
The objective of the library is to make the code dealing with bits and bitwise operations more concise and readable, through the use of shorthand methods where they make sense.

## Installation

If you want to install Bitter manually just include all the Swift files in `Sources/Bitter` in your project or load it as a git submodule.

Bitter also supports all the major dependency managers: CocoaPods, Carthage and SwiftPM.

To use Bitter in your project with [CocoaPods](https://www.cocoapods.org/), add it to your `PodFile`:
```
use_frameworks!

pod 'Bitter'

```
And update your workspace with `pod install`. Import the framework with `import Bitter`.

You can also install Bitter with [Carthage](https://github.com/Carthage/Carthage) adding it to your `Cartfile`:
```
github "uraimo/Bitter"
```
Download the framework with `carthage update` and add it to your embedded binaries. Import the framework with `import Bitter`.

And if you are using the Swift Package Manager just add it to the dependencies of your `Package.swift`:

```
import PackageDescription

let package = Package(
    ...
    dependencies: [
        ...
        .Package(url: "https://github.com/uraimo/Bitter.git", majorVersion: 0, minor: 1)
    ]
)
```
Import the framework with `import Bitter`.

## Usage

Let's see what Bitter provides:

#### Int type conversion

Every time you want to convert an Int containing a bit pattern to a smaller Int you need to perform a *truncating* bit conversion because the conversion will simply **fail at runtime** if the content of your integer is bigger than what the receiving type allows (e.g. try `Int8(1000)`). And let me reiterate that we are performing a bit truncation, not a decimal truncating conversion.

Bit pattern truncating conversions can be easily performed using the constructor `init(truncatingBitPattern:)`, but if you need to do this a lot, your code will become unreadable fast.

With Bitter, every Int*n*/UInt*n* type gains a few methods that allows to perform truncating bit pattern conversions to smaller Int types or simple bit pattern conversion for bigger and same size/different signedness Int types: **.to8, toU8, to16, toU16, to32, toU32, to64, toU64**.
The toU*n* methods perform a conversion to unsigned Int while the number refers to the size of the type, e.g.  `.toU16` will convert the current integer to an UInt16 truncating the bit pattern if necessary.

Let's see an example:
```swift
var i:Int32 = 50000
var u8:UInt8 = i.toU8   //81, Without Bitter: var u8:UInt8 = UInt8(truncatingBitPattern:i)
```

Bitter is also useful in mixed types expression, making the code more concise:
```swift
class Test{
    var content:UInt32=0

    func shiftAndResizeMe(howMuch:Int)->UInt16{
        return  (content << howMuch.toU32).toU16  //Without Bitter: return UInt16(truncatingBitPattern:(content << UInt32(truncatingBitPattern:howMuch)))
    }
}
```

#### Specific Byte subscript

While retrieving and modifying a single byte in a multi-byte Int is easy, having to write always the same code is a bit annoying and Bitter adds subscript to address single bytes to every Int type. Following the same safety-first approach of the Int conversions, trying to modify a byte outside of the range of the current type will result in an error at runtime.

Let's see some examples:
```swift
var i:UInt32 = 0xAABBCCDD

//Let's swap the two bytes
let tmp = i[2]           //Without Bitter: let tmp = (i & (0xFF << 16)) >> 16))
i[2] = i[1]              //                i = (i & ~(0xFF << 16)) | ((i & (0xFF << 8)) << 8)
i[1] = tmp               //                i = (i & ~(0xFF << 8)) | (tmp << 8)

// Let's set to 0 the second bit of the second byte
i[1] &= 0b11111101       //Without Bitter: i = i & (0b11111101 << 8)

// Let's change the third byte
i[3] = 0xAA   //Error! There is no 3rd byte!
``` 
The subscript index start from the LSB to the MSB for little endian multi-byte Ints and in the opposite direction if a big endian conversion has been applied to the Int.

#### Other functionalities

Bitter also adds a few other extensions to Int types:

* Double negation operator `~~`: This new operator has the same function that **!!** has in C or similar languages, it converts every integer value not equal to 0 to 1 and keeps the value 0 the same. Extremely useful when you want to convert the result of an expression to the standard C 0/1 integer boolean to use it in another expression.

* `size` static property for Int types: Shorthand for `strideof(Int*n*)`  

* `.allOnes` static property: We already have `.allZeros` in `BitwiseOperationsType`, now we have this too.

## TODO

- [x] Test for each functionality (XCTest ok, Quick better)
- [ ] Reduce code duplication converting part of the source to .gyb templates
- [ ] Proper documentation using gyb
- [ ] Additional functionalities?
- [ ] Example project?
