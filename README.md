![Bitter](https://github.com/uraimo/Bitter/raw/master/logo.png)

**A Swift Bits Manipulation Toolkit**

<p>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift3-compatible-orange.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/Bitter/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg"/></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-brightgreen.svg"/></a>
<a href="https://cocoapods.org/pods/Bitter"><img src="https://img.shields.io/cocoapods/v/Bitter.svg"/></a>
<a href="https://travis-ci.org/uraimo/Bitter"><img src="https://api.travis-ci.org/uraimo/Bitter.svg" alt="Travis CI"></a>
</p>

## Summary

The Bitter library extends all the basic Swift 3.0 Int types with some useful methods for manipulating bits.
The objective of the library is to make the code dealing with bits and bitwise operations more concise and readable, through the use of shorthand methods where they make sense.
With Bitter you'll be able for example, to replace this:

```swift
var i:UInt32 = 0xAABBCCDD
let tmp = (i & (0xFF << 16)) >> 16 // Let's swap the 2nd and 3rd byte...
i = (i & ~(0xFF << 16)) | ((i & (0xFF << 8)) << 8)
i = (i & ~(0xFF << 8)) | (tmp << 8)
i = (i & ~((0x1 << 3) << 8)) | (i & ((0x1 << 3) << 8)) // Set the 4th bit of the 2nd byte
```
With this:
```swift
let tmp = i[2] // Let's swap the 2nd and 3rd byte!
i[2] = i[1]
i[1] = tmp 
i[1] = i[1].setb3(1) // Set the 4th bit of the 2nd byte
i[1] = i[1].setb3(0).setb4(1).setb5(0).setb6(1) // Let's set some other bit
```


## Installation

If you want to install Bitter manually just include all the Swift files in `Sources/Bitter` in your project or load it as a git submodule.

Bitter also supports all the major dependency managers: CocoaPods, Carthage and SwiftPM.

To use Bitter in your project with [CocoaPods](https://www.cocoapods.org/), add it to your `PodFile`:
```
use_frameworks!

pod 'Bitter'

```
And update your workspace with `pod install`. 

Bitter is also available through Carthage. To install just write into your Cartfile:
```
github "uraimo/Bitter"
```
Download the framework with `carthage update` and add it to your embedded binaries.

And if you are using the Swift Package Manager just add it to the dependencies of your `Package.swift`:

```
import PackageDescription

let package = Package(
    ...
    dependencies: [
        ...
        .Package(url: "https://github.com/uraimo/Bitter.git", majorVersion: 1, minor: 1)
    ]
)
```
Regardless of how you added Bitter to your project, import it with `import Bitter`.

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
let tmp = i[2]           //Without Bitter: let tmp = (i & (0xFF << 16)) >> 16
i[2] = i[1]              //                i = (i & ~(0xFF << 16)) | ((i & (0xFF << 8)) << 8)
i[1] = tmp               //                i = (i & ~(0xFF << 8)) | (tmp << 8)

// Let's set to 0 the second bit of the second byte
i[1] &= 0b11111101       //Without Bitter: i = i & (0b11111101 << 8)

// Let's change the third byte
i[3] = 0xAA   //Error! There is no 3rd byte!
``` 
The subscript index start from the LSB to the MSB for little endian multi-byte Ints and in the opposite direction if a big endian conversion has been applied to the Int.

#### Modifying specific bits

Every Int type, signed or not, gains 8 properties and 8 functions that allow to set or get a single bit in the first byte of the integer. They are supposed to be used in tandem with the byte subscript:

```swift
var i:UInt32 = 0xAABBCCDD
i[2].b2 //0
i[2].b3 //1

i[2] = i[2].setb2(1).setb3(0)
i[2].b2 //1
i[2].b3 //0
```
The `.bN` property returns the value of the bit at the specific position, while the `.setbN(value)` function sets a specific bit in a integer (the indexes refer to the 8 less significant bits) and return the modified 8 bits integer (if used on integers with content larger than 8 bits, the rest is truncated).

Considering that every `.setbN(value)` function returns a new integer, these functions can be concatenated to modify more than one bit. This function can be used in conjunction with byte indexed subscripts as shown above where on the right side we build a new byte value for the position 2 of the array that will be then assigned to the same position of the same array.

#### Other functionalities

Bitter also adds a few other extensions to Int types:

* Double negation operator `~~`: This new operator has the same function that **!!** has in C or similar languages, it converts every integer value not equal to 0 to 1 and keeps the value 0 the same. Extremely useful when you want to convert the result of an expression to the standard C 0/1 integer boolean to use it in another expression.

* `size` static property for Int types: Shorthand for `strideof(Int*n*)`  

* `.allOnes` static property: We already have `.allZeros` in `BitwiseOperationsType`, now we have this too.

#### Bitwise operations

To learn more about bitwise operations in Swift, see the article "[Dealing with Bit Sets in Swift](https://www.uraimo.com/2016/02/05/Dealing-With-Bit-Sets-In-Swift/)" on my blog.

## Contributing

First of all, thanks for considering contributing to this project, all PRs are welcome!

Please notice that the sources for this library are not written directly in Swift but are generated using the GYB tool from the Swift project. The main Bitter template is located at `Templates/Bitter.swift.gyb` and if you need directions on how to modify GYB templates, check out my [tutorial](https://www.uraimo.com/2016/02/09/a-short-swift-gyb-tutorial/).

To compile the template and save the result as `Sources/Bitter/Bitter.swift` run `./compile.sh` from the `Templates/` directory, GYB will be downloaded and used to compile the template.

Modifying .gyb templates requires minimal knowledge of python and GYB itself provide just a few flow control directive but, lickily, examples of all the directives you could need are already in the template.

When your template has an error, GYB will show the specific line where the error occurred, remove `--line-directive ''` from the compile script to enable this debug mode.

## Swift 2.x

A specific branch [has been created](https://github.com/uraimo/Bitter/tree/swift-2.x) before the move to Swift 3.0, releases older than 2.0.0 support Swift 2.

