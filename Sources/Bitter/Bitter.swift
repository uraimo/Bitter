//
//  Bitter.swift
//  Bitter
//
//  Created by Umberto Raimondi on 01/02/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

// MARK: Int types extensions

extension Int{
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public var toInt:Int{return self}
    public var toUInt:UInt{return UInt(bitPattern:self)}
    public static var allOnes:Int{return Int(bitPattern: UInt.max)}
    public static var size:Int{return strideof(self)}
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
extension UInt{
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public var toInt:Int{return Int(bitPattern:self)}
    public var toUInt:UInt{return self}
    public static var allOnes:UInt{return UInt.max}
    public static var size:Int{return strideof(self)}
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

extension Int8 {
    public var toU8: UInt8{return UInt8(bitPattern:self)}
    public var to8: Int8{return self}
    public var toU16: UInt16{return UInt16(self)}
    public var to16: Int16{return Int16(self)}
    public var toU32: UInt32{return UInt32(self)}
    public var to32: Int32{return Int32(self)}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:Int8{return Int8(bitPattern: UInt8.max)}
    public static var size:Int{return strideof(self)}
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

extension UInt8 {
    public var toU8: UInt8{return self}
    public var to8: Int8{return Int8(bitPattern:self)}
    public var toU16: UInt16{return UInt16(self)}
    public var to16: Int16{return Int16(self)}
    public var toU32: UInt32{return UInt32(self)}
    public var to32: Int32{return Int32(self)}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:UInt8{return UInt8.max}
    public static var size:Int{return strideof(self)}
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

extension Int16 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(bitPattern:self)}
    public var to16: Int16{return self}
    public var toU32: UInt32{return UInt32(self)}
    public var to32: Int32{return Int32(self)}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:Int16{return Int16(bitPattern: UInt16.max)}
    public static var size:Int{return strideof(self)}
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

extension UInt16 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return self}
    public var to16: Int16{return Int16(bitPattern:self)}
    public var toU32: UInt32{return UInt32(self)}
    public var to32: Int32{return Int32(self)}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:UInt16{return UInt16.max}
    public static var size:Int{return strideof(self)}
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

extension Int32 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(bitPattern:self)}
    public var to32: Int32{return self}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:Int32{return Int32(bitPattern: UInt32.max)}
    public static var size:Int{return strideof(self)}
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

extension UInt32 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return self}
    public var to32: Int32{return Int32(bitPattern:self)}
    public var toU64: UInt64{return UInt64(self)}
    public var to64: Int64{return Int64(self)}
    public var toInt:Int{return Int(bitPattern:UInt(self))}
    public var toUInt:UInt{return UInt(self)}
    public static var allOnes:UInt32{return UInt32.max}
    public static var size:Int{return strideof(self)}
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

extension Int64 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{return UInt64(bitPattern:self)}
    public var to64: Int64{return self}
    public var toInt:Int{return Int(truncatingBitPattern:self)}
    public var toUInt:UInt{return UInt(truncatingBitPattern:self)}
    public static var allOnes:Int64{return Int64(bitPattern: UInt64.max)}
    public static var size:Int{return strideof(self)}
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

extension UInt64 {
    public var toU8: UInt8{return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{return self}
    public var to64: Int64{return Int64(bitPattern:self)}
    public var toInt:Int{return Int(truncatingBitPattern:self)}
    public var toUInt:UInt{return UInt(truncatingBitPattern:self)}
    public static var allOnes:UInt64{return UInt64.max}
    public static var size:Int{return strideof(self)}
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

prefix operator ~~ {}

prefix func ~~(value: Int8)->Int8{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: UInt8)->UInt8{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int16)->Int16{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: UInt16)->UInt16{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int32)->Int32{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: UInt32)->UInt32{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int64)->Int64{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: UInt64)->UInt64{
    return (value>0) ? 1 : 0
}
