//
//  Bitter.swift
//  Bitter
//
//  Created by Umberto Raimondi on 01/02/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
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
    
    /// Returns a Int with all ones
    public static var allOnes:Int{return Int(bitPattern: UInt.max)}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

    /// Subscript that returns or set one of the bytes of a Int
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> Int {
        get {
            precondition(index<Int.size,"Byte set index out of range")
            if(Int.size == 8){
                return Int(bitPattern: UInt((self.toU64 & (0xFF << (index.toU64*8))) >> (index.toU64*8)) )
            }else{
               return Int(bitPattern: UInt((self.toU32 & (0xFF << (index.toU32*8))) >> (index.toU32*8)) )
            }
        }
        set(newValue) {
            precondition(index<Int.size,"Byte set index out of range")
            if(Int.size == 8){
                self = Int(bitPattern: UInt((self.toU64 & ~(0xFF << (index.toU64*8))) | (newValue.toU64 << (index.toU64*8))) )
            }else{
                self = Int(bitPattern: UInt((self.toU32 & ~(0xFF << (index.toU32*8))) | (newValue.toU32 << (index.toU32*8))) )
            }
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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
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
    
    /// Returns a UInt with all ones
    public static var allOnes:UInt{return UInt.max}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

    /// Subscript that returns or set one of the bytes of a UInt
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt {
        get {
            precondition(index<Int.size,"Byte set index out of range")
            if(UInt.size == 8){
                return UInt(self.toU64 & (0xFF << (index.toU64*8))) >> (index*8).toUInt
            }else{
                return UInt(self.toU32 & (0xFF << (index.toU32*8))) >> (index*8).toUInt
            }
        }
        set(newValue) {
            precondition(index<Int.size,"Byte set index out of range")
            if(UInt.size == 8){
                self = UInt((self.toU64 & ~(0xFF << (index.toU64*8))) | (newValue.toU64 << (index.toU64*8)))
            }else{
                self = UInt((self.toU32 & ~(0xFF << (index.toU32*8))) | (newValue.toU32 << (index.toU32*8)))
            }
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
        /// Returns a Int8 with all ones
    public static var allOnes:Int8{return Int8(bitPattern: UInt8.max)}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
        /// Returns a UInt8 with all ones
    public static var allOnes:UInt8{return UInt8.max}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
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
        /// Returns a Int16 with all ones
    public static var allOnes:Int16{return Int16(bitPattern: UInt16.max)}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
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
        /// Returns a UInt16 with all ones
    public static var allOnes:UInt16{return UInt16.max}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
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
        /// Returns a Int32 with all ones
    public static var allOnes:Int32{return Int32(bitPattern: UInt32.max)}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
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
        /// Returns a UInt32 with all ones
    public static var allOnes:UInt32{return UInt32.max}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return UInt64(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return self}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(truncatingBitPattern:self)}
        /// Returns a Int64 with all ones
    public static var allOnes:Int64{return Int64(bitPattern: UInt64.max)}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64{return self}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64{return Int64(bitPattern:self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt:Int{return Int(truncatingBitPattern:self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt:UInt{return UInt(truncatingBitPattern:self)}
        /// Returns a UInt64 with all ones
    public static var allOnes:UInt64{return UInt64.max}

    /// Returns the size of this type (number of bytes)
    public static var size:Int{return strideof(self)}

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
prefix operator ~~ {}

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
