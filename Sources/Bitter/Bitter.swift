// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//
//  Bitter.swift
//  Bitter
//
//  Created by Umberto Raimondi on 01/02/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

import Foundation

// MARK: Int types extensions

/**
Extension that adds a few additional functionalities to Int:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int{
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return self}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(bitPattern:self)}

    /// Create bits mask with one
    public func mask(_ bits: Int, _ msb: Bool) -> Int {
        if (bits >> 3) == Int.size { return Int.max }

        let mask = Int(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int(Int.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<Int>.stride}

    /// Get bit 0 value
    public var b0:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 0)) >> 0 )
    }
    /// Set bit 0 and return a new Int
    public func setb0(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 0)) | (nv << 0) )
    }
    /// Get bit 1 value
    public var b1:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 1)) >> 1 )
    }
    /// Set bit 1 and return a new Int
    public func setb1(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 1)) | (nv << 1) )
    }
    /// Get bit 2 value
    public var b2:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 2)) >> 2 )
    }
    /// Set bit 2 and return a new Int
    public func setb2(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 2)) | (nv << 2) )
    }
    /// Get bit 3 value
    public var b3:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 3)) >> 3 )
    }
    /// Set bit 3 and return a new Int
    public func setb3(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 3)) | (nv << 3) )
    }
    /// Get bit 4 value
    public var b4:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 4)) >> 4 )
    }
    /// Set bit 4 and return a new Int
    public func setb4(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 4)) | (nv << 4) )
    }
    /// Get bit 5 value
    public var b5:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 5)) >> 5 )
    }
    /// Set bit 5 and return a new Int
    public func setb5(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 5)) | (nv << 5) )
    }
    /// Get bit 6 value
    public var b6:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 6)) >> 6 )
    }
    /// Set bit 6 and return a new Int
    public func setb6(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 6)) | (nv << 6) )
    }
    /// Get bit 7 value
    public var b7:Int{
        return Int(bitPattern: ( UInt(bitPattern: self) & (0x1 << 7)) >> 7 )
    }
    /// Set bit 7 and return a new Int
    public func setb7(_ bit:Int)->Int{
        let nv: UInt = bit != 0 ? 1 : 0
        return Int(bitPattern: ( UInt(bitPattern: self) & ~(0x1 << 7)) | (nv << 7) )
    }


    /// Subscript that returns or set one of the bytes of a Int
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int {
        get {
            precondition(index<Int.size,"Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            return Int(bitPattern: (UInt(bitPattern: self) & (0xFF << idx)) >> idx )
        }
        set(newValue) {
            precondition(index<Int.size,"Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            self = Int(bitPattern: (UInt(bitPattern: self) & ~(0xFF << idx)) | (UInt(bitPattern: newValue) << idx) )
        }
    }
}
/**
Extension that adds a few additional functionalities to UInt:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt{
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return self}

    /// Create bits mask with one
    public func mask(_ bits: UInt, _ msb: Bool) -> UInt {
        if (bits >> 3) == UInt.size { return UInt.max }

        let mask = UInt(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt(UInt.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<UInt>.stride}

    /// Get bit 0 value
    public var b0:UInt{
        return ( self & (0x1 << 0)) >> 0
    }
    /// Set bit 0 and return a new UInt
    public func setb0(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        let _ = 1 << Int16(3)
        return ( self & ~(0x1 << 0)) | (nv << 0)
    }
    /// Get bit 1 value
    public var b1:UInt{
        return ( self & (0x1 << 1)) >> 1
    }
    /// Set bit 1 and return a new UInt
    public func setb1(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 1)) | (nv << 1)
    }
    /// Get bit 2 value
    public var b2:UInt{
        return ( self & (0x1 << 2)) >> 2
    }
    /// Set bit 2 and return a new UInt
    public func setb2(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 2)) | (nv << 2)
    }
    /// Get bit 3 value
    public var b3:UInt{
        return ( self & (0x1 << 3)) >> 3
    }
    /// Set bit 3 and return a new UInt
    public func setb3(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 3)) | (nv << 3)
    }
    /// Get bit 4 value
    public var b4:UInt{
        return ( self & (0x1 << 4)) >> 4
    }
    /// Set bit 4 and return a new UInt
    public func setb4(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 4)) | (nv << 4)
    }
    /// Get bit 5 value
    public var b5:UInt{
        return ( self & (0x1 << 5)) >> 5
    }
    /// Set bit 5 and return a new UInt
    public func setb5(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 5)) | (nv << 5)
    }
    /// Get bit 6 value
    public var b6:UInt{
        return ( self & (0x1 << 6)) >> 6
    }
    /// Set bit 6 and return a new UInt
    public func setb6(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 6)) | (nv << 6)
    }
    /// Get bit 7 value
    public var b7:UInt{
        return ( self & (0x1 << 7)) >> 7
    }
    /// Set bit 7 and return a new UInt
    public func setb7(_ bit:Int)->UInt{
        let nv:UInt = bit != 0 ? 1 : 0
        return ( self & ~(0x1 << 7)) | (nv << 7)
    }


    /// Subscript that returns or set one of the bytes of a UInt
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt {
        get {
            precondition(index<Int.size,"Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            return (self & (0xFF << idx)) >> idx
        }
        set(newValue) {
            precondition(index<Int.size,"Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            self = (self & ~(0xFF << idx)) | (newValue << idx)
        }
    }
}

/**
Extension that adds a few additional functionalities to Int8:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int8 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return self}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: Int8, _ msb: Bool) -> Int8 {
        if (bits >> 3) == Int8.size { return Int8.max }

        let mask = Int8(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int8(Int8.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<Int8>.stride}

    /// Get bit 0 value
    public var b0:Int8{
        return ( (self.toU8 & (0x1 << 0)) >> 0 ).to8
    }
    /// Set bit 0 and return a new Int
    public func setb0(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 0)) | (nv.toU8 << 0) ).to8
    }
    /// Get bit 1 value
    public var b1:Int8{
        return ( (self.toU8 & (0x1 << 1)) >> 1 ).to8
    }
    /// Set bit 1 and return a new Int
    public func setb1(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 1)) | (nv.toU8 << 1) ).to8
    }
    /// Get bit 2 value
    public var b2:Int8{
        return ( (self.toU8 & (0x1 << 2)) >> 2 ).to8
    }
    /// Set bit 2 and return a new Int
    public func setb2(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 2)) | (nv.toU8 << 2) ).to8
    }
    /// Get bit 3 value
    public var b3:Int8{
        return ( (self.toU8 & (0x1 << 3)) >> 3 ).to8
    }
    /// Set bit 3 and return a new Int
    public func setb3(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 3)) | (nv.toU8 << 3) ).to8
    }
    /// Get bit 4 value
    public var b4:Int8{
        return ( (self.toU8 & (0x1 << 4)) >> 4 ).to8
    }
    /// Set bit 4 and return a new Int
    public func setb4(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 4)) | (nv.toU8 << 4) ).to8
    }
    /// Get bit 5 value
    public var b5:Int8{
        return ( (self.toU8 & (0x1 << 5)) >> 5 ).to8
    }
    /// Set bit 5 and return a new Int
    public func setb5(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 5)) | (nv.toU8 << 5) ).to8
    }
    /// Get bit 6 value
    public var b6:Int8{
        return ( (self.toU8 & (0x1 << 6)) >> 6 ).to8
    }
    /// Set bit 6 and return a new Int
    public func setb6(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 6)) | (nv.toU8 << 6) ).to8
    }
    /// Get bit 7 value
    public var b7:Int8{
        return ( (self.toU8 & (0x1 << 7)) >> 7 ).to8
    }
    /// Set bit 7 and return a new Int
    public func setb7(_ bit:Int)->Int8{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU8 & ~(0x1 << 7)) | (nv.toU8 << 7) ).to8
    }



    /// Subscript that returns or set one of the bytes of this integer
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int8 {
        get {
            precondition(index<Int8.size,"Byte set index out of range")
            return self
        }
        set(newValue) {
            precondition(index<Int8.size,"Byte set index out of range")
            self = newValue
        }
    }
}

/**
Extension that adds a few additional functionalities to UInt8:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt8 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return self}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: UInt8, _ msb: Bool) -> UInt8 {
        if (bits >> 3) == UInt8.size { return UInt8.max }

        let mask = UInt8(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt8(UInt8.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<UInt8>.stride}

    /// Get bit 0 value
    public var b0:UInt8{
        return (self & (0x1 << 0)) >> 0
    }
    /// Set bit 0 and return a new UInt
    public func setb0(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 0)) | (nv.toU8 << 0)
    }
    /// Get bit 1 value
    public var b1:UInt8{
        return (self & (0x1 << 1)) >> 1
    }
    /// Set bit 1 and return a new UInt
    public func setb1(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 1)) | (nv.toU8 << 1)
    }
    /// Get bit 2 value
    public var b2:UInt8{
        return (self & (0x1 << 2)) >> 2
    }
    /// Set bit 2 and return a new UInt
    public func setb2(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 2)) | (nv.toU8 << 2)
    }
    /// Get bit 3 value
    public var b3:UInt8{
        return (self & (0x1 << 3)) >> 3
    }
    /// Set bit 3 and return a new UInt
    public func setb3(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 3)) | (nv.toU8 << 3)
    }
    /// Get bit 4 value
    public var b4:UInt8{
        return (self & (0x1 << 4)) >> 4
    }
    /// Set bit 4 and return a new UInt
    public func setb4(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 4)) | (nv.toU8 << 4)
    }
    /// Get bit 5 value
    public var b5:UInt8{
        return (self & (0x1 << 5)) >> 5
    }
    /// Set bit 5 and return a new UInt
    public func setb5(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 5)) | (nv.toU8 << 5)
    }
    /// Get bit 6 value
    public var b6:UInt8{
        return (self & (0x1 << 6)) >> 6
    }
    /// Set bit 6 and return a new UInt
    public func setb6(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 6)) | (nv.toU8 << 6)
    }
    /// Get bit 7 value
    public var b7:UInt8{
        return (self & (0x1 << 7)) >> 7
    }
    /// Set bit 7 and return a new UInt
    public func setb7(_ bit:Int)->UInt8{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 7)) | (nv.toU8 << 7)
    }



    /// Subscript that returns or set one of the bytes of this integer
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt8 {
        get {
            precondition(index<Int8.size,"Byte set index out of range")
            return self
        }
        set(newValue) {
            precondition(index<Int8.size,"Byte set index out of range")
            self = newValue
        }
    }
}

/**
Extension that adds a few additional functionalities to Int16:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int16 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return self}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: Int16, _ msb: Bool) -> Int16 {
        if (bits >> 3) == Int16.size { return Int16.max }

        let mask = Int16(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int16(Int16.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<Int16>.stride}

    /// Get bit 0 value
    public var b0:Int16{
        return ( (self.toU16 & (0x1 << 0)) >> 0 ).to16
    }
    /// Set bit 0 and return a new Int
    public func setb0(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 0)) | (nv.toU16 << 0) ).to16
    }
    /// Get bit 1 value
    public var b1:Int16{
        return ( (self.toU16 & (0x1 << 1)) >> 1 ).to16
    }
    /// Set bit 1 and return a new Int
    public func setb1(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 1)) | (nv.toU16 << 1) ).to16
    }
    /// Get bit 2 value
    public var b2:Int16{
        return ( (self.toU16 & (0x1 << 2)) >> 2 ).to16
    }
    /// Set bit 2 and return a new Int
    public func setb2(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 2)) | (nv.toU16 << 2) ).to16
    }
    /// Get bit 3 value
    public var b3:Int16{
        return ( (self.toU16 & (0x1 << 3)) >> 3 ).to16
    }
    /// Set bit 3 and return a new Int
    public func setb3(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 3)) | (nv.toU16 << 3) ).to16
    }
    /// Get bit 4 value
    public var b4:Int16{
        return ( (self.toU16 & (0x1 << 4)) >> 4 ).to16
    }
    /// Set bit 4 and return a new Int
    public func setb4(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 4)) | (nv.toU16 << 4) ).to16
    }
    /// Get bit 5 value
    public var b5:Int16{
        return ( (self.toU16 & (0x1 << 5)) >> 5 ).to16
    }
    /// Set bit 5 and return a new Int
    public func setb5(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 5)) | (nv.toU16 << 5) ).to16
    }
    /// Get bit 6 value
    public var b6:Int16{
        return ( (self.toU16 & (0x1 << 6)) >> 6 ).to16
    }
    /// Set bit 6 and return a new Int
    public func setb6(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 6)) | (nv.toU16 << 6) ).to16
    }
    /// Get bit 7 value
    public var b7:Int16{
        return ( (self.toU16 & (0x1 << 7)) >> 7 ).to16
    }
    /// Set bit 7 and return a new Int
    public func setb7(_ bit:Int)->Int16{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU16 & ~(0x1 << 7)) | (nv.toU16 << 7) ).to16
    }



    /// Subscript that returns or set one of the bytes of a Int16
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int16 {
        get {
            precondition(index<Int16.size,"Byte set index out of range")
            return ((self.toU16 & (0xFF << (index.toU16*8))) >> (index.toU16*8)).to16
        }
        set(newValue) {
            precondition(index<Int16.size,"Byte set index out of range")
            self = ( (self.toU16 & ~(0xFF << (index.toU16*8))) | (newValue.toU16 << (index.toU16*8)) ).to16
        }
    }
}

/**
Extension that adds a few additional functionalities to UInt16:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt16 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return self}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: UInt16, _ msb: Bool) -> UInt16 {
        if (bits >> 3) == UInt16.size { return UInt16.max }

        let mask = UInt16(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt16(UInt16.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<UInt16>.stride}

    /// Get bit 0 value
    public var b0:UInt16{
        return (self & (0x1 << 0)) >> 0
    }
    /// Set bit 0 and return a new UInt
    public func setb0(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 0)) | (nv.toU16 << 0)
    }
    /// Get bit 1 value
    public var b1:UInt16{
        return (self & (0x1 << 1)) >> 1
    }
    /// Set bit 1 and return a new UInt
    public func setb1(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 1)) | (nv.toU16 << 1)
    }
    /// Get bit 2 value
    public var b2:UInt16{
        return (self & (0x1 << 2)) >> 2
    }
    /// Set bit 2 and return a new UInt
    public func setb2(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 2)) | (nv.toU16 << 2)
    }
    /// Get bit 3 value
    public var b3:UInt16{
        return (self & (0x1 << 3)) >> 3
    }
    /// Set bit 3 and return a new UInt
    public func setb3(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 3)) | (nv.toU16 << 3)
    }
    /// Get bit 4 value
    public var b4:UInt16{
        return (self & (0x1 << 4)) >> 4
    }
    /// Set bit 4 and return a new UInt
    public func setb4(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 4)) | (nv.toU16 << 4)
    }
    /// Get bit 5 value
    public var b5:UInt16{
        return (self & (0x1 << 5)) >> 5
    }
    /// Set bit 5 and return a new UInt
    public func setb5(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 5)) | (nv.toU16 << 5)
    }
    /// Get bit 6 value
    public var b6:UInt16{
        return (self & (0x1 << 6)) >> 6
    }
    /// Set bit 6 and return a new UInt
    public func setb6(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 6)) | (nv.toU16 << 6)
    }
    /// Get bit 7 value
    public var b7:UInt16{
        return (self & (0x1 << 7)) >> 7
    }
    /// Set bit 7 and return a new UInt
    public func setb7(_ bit:Int)->UInt16{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 7)) | (nv.toU16 << 7)
    }



    /// Subscript that returns or set one of the bytes of a UInt16
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt16 {
        get {
            precondition(index<Int16.size,"Byte set index out of range")
            return (self & (0xFF << (index.toU16*8))) >> (index.toU16*8)
        }
        set(newValue) {
            precondition(index<Int16.size,"Byte set index out of range")
            self = (self & ~(0xFF << (index.toU16*8))) | (newValue.toU16 << (index.toU16*8))
        }
    }
}

/**
Extension that adds a few additional functionalities to Int32:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int32 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return self}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: Int32, _ msb: Bool) -> Int32 {
        if (bits >> 3) == Int32.size { return Int32.max }

        let mask = Int32(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int32(Int32.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<Int32>.stride}

    /// Get bit 0 value
    public var b0:Int32{
        return ( (self.toU32 & (0x1 << 0)) >> 0 ).to32
    }
    /// Set bit 0 and return a new Int
    public func setb0(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 0)) | (nv.toU32 << 0) ).to32
    }
    /// Get bit 1 value
    public var b1:Int32{
        return ( (self.toU32 & (0x1 << 1)) >> 1 ).to32
    }
    /// Set bit 1 and return a new Int
    public func setb1(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 1)) | (nv.toU32 << 1) ).to32
    }
    /// Get bit 2 value
    public var b2:Int32{
        return ( (self.toU32 & (0x1 << 2)) >> 2 ).to32
    }
    /// Set bit 2 and return a new Int
    public func setb2(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 2)) | (nv.toU32 << 2) ).to32
    }
    /// Get bit 3 value
    public var b3:Int32{
        return ( (self.toU32 & (0x1 << 3)) >> 3 ).to32
    }
    /// Set bit 3 and return a new Int
    public func setb3(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 3)) | (nv.toU32 << 3) ).to32
    }
    /// Get bit 4 value
    public var b4:Int32{
        return ( (self.toU32 & (0x1 << 4)) >> 4 ).to32
    }
    /// Set bit 4 and return a new Int
    public func setb4(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 4)) | (nv.toU32 << 4) ).to32
    }
    /// Get bit 5 value
    public var b5:Int32{
        return ( (self.toU32 & (0x1 << 5)) >> 5 ).to32
    }
    /// Set bit 5 and return a new Int
    public func setb5(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 5)) | (nv.toU32 << 5) ).to32
    }
    /// Get bit 6 value
    public var b6:Int32{
        return ( (self.toU32 & (0x1 << 6)) >> 6 ).to32
    }
    /// Set bit 6 and return a new Int
    public func setb6(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 6)) | (nv.toU32 << 6) ).to32
    }
    /// Get bit 7 value
    public var b7:Int32{
        return ( (self.toU32 & (0x1 << 7)) >> 7 ).to32
    }
    /// Set bit 7 and return a new Int
    public func setb7(_ bit:Int)->Int32{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU32 & ~(0x1 << 7)) | (nv.toU32 << 7) ).to32
    }



    /// Subscript that returns or set one of the bytes of a Int32
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int32 {
        get {
            precondition(index<Int32.size,"Byte set index out of range")
            return ((self.toU32 & (0xFF << (index.toU32*8))) >> (index.toU32*8)).to32
        }
        set(newValue) {
            precondition(index<Int32.size,"Byte set index out of range")
            self = ( (self.toU32 & ~(0xFF << (index.toU32*8))) | (newValue.toU32 << (index.toU32*8)) ).to32
        }
    }
}

/**
Extension that adds a few additional functionalities to UInt32:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt32 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return self}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: UInt32, _ msb: Bool) -> UInt32 {
        if (bits >> 3) == UInt32.size { return UInt32.max }

        let mask = UInt32(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt32(UInt32.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<UInt32>.stride}

    /// Get bit 0 value
    public var b0:UInt32{
        return (self & (0x1 << 0)) >> 0
    }
    /// Set bit 0 and return a new UInt
    public func setb0(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 0)) | (nv.toU32 << 0)
    }
    /// Get bit 1 value
    public var b1:UInt32{
        return (self & (0x1 << 1)) >> 1
    }
    /// Set bit 1 and return a new UInt
    public func setb1(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 1)) | (nv.toU32 << 1)
    }
    /// Get bit 2 value
    public var b2:UInt32{
        return (self & (0x1 << 2)) >> 2
    }
    /// Set bit 2 and return a new UInt
    public func setb2(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 2)) | (nv.toU32 << 2)
    }
    /// Get bit 3 value
    public var b3:UInt32{
        return (self & (0x1 << 3)) >> 3
    }
    /// Set bit 3 and return a new UInt
    public func setb3(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 3)) | (nv.toU32 << 3)
    }
    /// Get bit 4 value
    public var b4:UInt32{
        return (self & (0x1 << 4)) >> 4
    }
    /// Set bit 4 and return a new UInt
    public func setb4(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 4)) | (nv.toU32 << 4)
    }
    /// Get bit 5 value
    public var b5:UInt32{
        return (self & (0x1 << 5)) >> 5
    }
    /// Set bit 5 and return a new UInt
    public func setb5(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 5)) | (nv.toU32 << 5)
    }
    /// Get bit 6 value
    public var b6:UInt32{
        return (self & (0x1 << 6)) >> 6
    }
    /// Set bit 6 and return a new UInt
    public func setb6(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 6)) | (nv.toU32 << 6)
    }
    /// Get bit 7 value
    public var b7:UInt32{
        return (self & (0x1 << 7)) >> 7
    }
    /// Set bit 7 and return a new UInt
    public func setb7(_ bit:Int)->UInt32{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 7)) | (nv.toU32 << 7)
    }



    /// Subscript that returns or set one of the bytes of a UInt32
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt32 {
        get {
            precondition(index<Int32.size,"Byte set index out of range")
            return (self & (0xFF << (index.toU32*8))) >> (index.toU32*8)
        }
        set(newValue) {
            precondition(index<Int32.size,"Byte set index out of range")
            self = (self & ~(0xFF << (index.toU32*8))) | (newValue.toU32 << (index.toU32*8))
        }
    }
}

/**
Extension that adds a few additional functionalities to Int64:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int64 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return self}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(truncatingIfNeeded:self)}

    /// Create bits mask with one
    public func mask(_ bits: Int64, _ msb: Bool) -> Int64 {
        if (bits >> 3) == Int64.size { return Int64.max }

        let mask = Int64(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int64(Int64.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<Int64>.stride}

    /// Get bit 0 value
    public var b0:Int64{
        return ( (self.toU64 & (0x1 << 0)) >> 0 ).to64
    }
    /// Set bit 0 and return a new Int
    public func setb0(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 0)) | (nv.toU64 << 0) ).to64
    }
    /// Get bit 1 value
    public var b1:Int64{
        return ( (self.toU64 & (0x1 << 1)) >> 1 ).to64
    }
    /// Set bit 1 and return a new Int
    public func setb1(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 1)) | (nv.toU64 << 1) ).to64
    }
    /// Get bit 2 value
    public var b2:Int64{
        return ( (self.toU64 & (0x1 << 2)) >> 2 ).to64
    }
    /// Set bit 2 and return a new Int
    public func setb2(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 2)) | (nv.toU64 << 2) ).to64
    }
    /// Get bit 3 value
    public var b3:Int64{
        return ( (self.toU64 & (0x1 << 3)) >> 3 ).to64
    }
    /// Set bit 3 and return a new Int
    public func setb3(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 3)) | (nv.toU64 << 3) ).to64
    }
    /// Get bit 4 value
    public var b4:Int64{
        return ( (self.toU64 & (0x1 << 4)) >> 4 ).to64
    }
    /// Set bit 4 and return a new Int
    public func setb4(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 4)) | (nv.toU64 << 4) ).to64
    }
    /// Get bit 5 value
    public var b5:Int64{
        return ( (self.toU64 & (0x1 << 5)) >> 5 ).to64
    }
    /// Set bit 5 and return a new Int
    public func setb5(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 5)) | (nv.toU64 << 5) ).to64
    }
    /// Get bit 6 value
    public var b6:Int64{
        return ( (self.toU64 & (0x1 << 6)) >> 6 ).to64
    }
    /// Set bit 6 and return a new Int
    public func setb6(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 6)) | (nv.toU64 << 6) ).to64
    }
    /// Get bit 7 value
    public var b7:Int64{
        return ( (self.toU64 & (0x1 << 7)) >> 7 ).to64
    }
    /// Set bit 7 and return a new Int
    public func setb7(_ bit:Int)->Int64{
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 7)) | (nv.toU64 << 7) ).to64
    }



    /// Subscript that returns or set one of the bytes of a Int64
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int64 {
        get {
            precondition(index<Int64.size,"Byte set index out of range")
            return ((self.toU64 & (0xFF << (index.toU64*8))) >> (index.toU64*8)).to64
        }
        set(newValue) {
            precondition(index<Int64.size,"Byte set index out of range")
            self = ( (self.toU64 & ~(0xFF << (index.toU64*8))) | (newValue.toU64 << (index.toU64*8)) ).to64
        }
    }
}

/**
Extension that adds a few additional functionalities to UInt64:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt64 {
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8{return UInt8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return self}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(truncatingIfNeeded:self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(truncatingIfNeeded:self)}

    /// Create bits mask with one
    public func mask(_ bits: UInt64, _ msb: Bool) -> UInt64 {
        if (bits >> 3) == UInt64.size { return UInt64.max }

        let mask = UInt64(truncating: NSDecimalNumber(decimal:(pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt64(UInt64.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return MemoryLayout<UInt64>.stride}

    /// Get bit 0 value
    public var b0:UInt64{
        return (self & (0x1 << 0)) >> 0
    }
    /// Set bit 0 and return a new UInt
    public func setb0(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 0)) | (nv.toU64 << 0)
    }
    /// Get bit 1 value
    public var b1:UInt64{
        return (self & (0x1 << 1)) >> 1
    }
    /// Set bit 1 and return a new UInt
    public func setb1(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 1)) | (nv.toU64 << 1)
    }
    /// Get bit 2 value
    public var b2:UInt64{
        return (self & (0x1 << 2)) >> 2
    }
    /// Set bit 2 and return a new UInt
    public func setb2(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 2)) | (nv.toU64 << 2)
    }
    /// Get bit 3 value
    public var b3:UInt64{
        return (self & (0x1 << 3)) >> 3
    }
    /// Set bit 3 and return a new UInt
    public func setb3(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 3)) | (nv.toU64 << 3)
    }
    /// Get bit 4 value
    public var b4:UInt64{
        return (self & (0x1 << 4)) >> 4
    }
    /// Set bit 4 and return a new UInt
    public func setb4(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 4)) | (nv.toU64 << 4)
    }
    /// Get bit 5 value
    public var b5:UInt64{
        return (self & (0x1 << 5)) >> 5
    }
    /// Set bit 5 and return a new UInt
    public func setb5(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 5)) | (nv.toU64 << 5)
    }
    /// Get bit 6 value
    public var b6:UInt64{
        return (self & (0x1 << 6)) >> 6
    }
    /// Set bit 6 and return a new UInt
    public func setb6(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 6)) | (nv.toU64 << 6)
    }
    /// Get bit 7 value
    public var b7:UInt64{
        return (self & (0x1 << 7)) >> 7
    }
    /// Set bit 7 and return a new UInt
    public func setb7(_ bit:Int)->UInt64{
        let nv = bit != 0 ? 1 : 0
        return (self & ~(0x1 << 7)) | (nv.toU64 << 7)
    }



    /// Subscript that returns or set one of the bytes of a UInt64
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt64 {
        get {
            precondition(index<Int64.size,"Byte set index out of range")
            return (self & (0xFF << (index.toU64*8))) >> (index.toU64*8)
        }
        set(newValue) {
            precondition(index<Int64.size,"Byte set index out of range")
            self = (self & ~(0xFF << (index.toU64*8))) | (newValue.toU64 << (index.toU64*8))
        }
    }
}



// MARK: Operators

/// Double negation operator
prefix operator ~~

/// Double negation operator for Int8
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: Int8)->Int8{
    return (value>0) ? 1 : 0
}
/// Double negation operator for UInt8
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: UInt8)->UInt8{
    return (value>0) ? 1 : 0
}
/// Double negation operator for Int16
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: Int16)->Int16{
    return (value>0) ? 1 : 0
}
/// Double negation operator for UInt16
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: UInt16)->UInt16{
    return (value>0) ? 1 : 0
}
/// Double negation operator for Int32
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: Int32)->Int32{
    return (value>0) ? 1 : 0
}
/// Double negation operator for UInt32
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: UInt32)->UInt32{
    return (value>0) ? 1 : 0
}
/// Double negation operator for Int64
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: Int64)->Int64{
    return (value>0) ? 1 : 0
}
/// Double negation operator for UInt64
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~(value: UInt64)->UInt64{
    return (value>0) ? 1 : 0
}
