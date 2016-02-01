//
//  BitterSwift.swift
//  BitterSwift
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
    public static var allOnes:Int{return Int(bitPattern: UInt.max)}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> Int {
        get {
            if(Int.size == 8){
                return Int(bitPattern: UInt((self.toU64 & (0xFF << index.toU64)) >> index.toU64) )
            }else{
               return Int(bitPattern: UInt((self.toU32 & (0xFF << index.toU32)) >> index.toU32) )
            }
        }
        set(newValue) {
            if(Int.size == 8){
                self = Int(bitPattern: UInt(self.toU64 | (newValue.toU64 << index.toU64)) )
            }else{
                self = Int(bitPattern: UInt(self.toU32 | (newValue.toU32 << index.toU32)) )
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
    public static var allOnes:UInt{return UInt.max}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> UInt {
        get {
            if(Int.size == 8){
                return UInt(self.toU64 & (0xFF << index.toU64) >> index.toU64)
            }else{
                return UInt(self.toU32 & (0xFF << index.toU32) >> index.toU32)
            }
        }
        set(newValue) {
            if(Int.size == 8){
                self = UInt(self.toU64 | (newValue.toU64 << index.toU64))
            }else{
                self = UInt(self.toU32 | (newValue.toU32 << index.toU32))
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
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:Int8{return Int8(bitPattern: UInt8.max)}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> Int8 {
        get {
            return ((self.toU8 & (0xFF << index.toU8)) >> index.toU8).to8
        }
        set(newValue) {
            self = (self.toU8 | (newValue.toU8 << index.toU8)).to8
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
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:UInt8{return UInt8.max}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> UInt8 {
        get {
            return self & (0xFF << index.toU8) >> index.toU8
        }
        set(newValue) {
            self = self | (newValue.toU8 << index.toU8)
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
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:Int16{return Int16(bitPattern: UInt16.max)}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> Int16 {
        get {
            return ((self.toU16 & (0xFF << index.toU16)) >> index.toU16).to16
        }
        set(newValue) {
            self = (self.toU16 | (newValue.toU16 << index.toU16)).to16
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
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:UInt16{return UInt16.max}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> UInt16 {
        get {
            return self & (0xFF << index.toU16) >> index.toU16
        }
        set(newValue) {
            self = self | (newValue.toU16 << index.toU16)
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
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:Int32{return Int32(bitPattern: UInt32.max)}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> Int32 {
        get {
            return ((self.toU32 & (0xFF << index.toU32)) >> index.toU32).to32
        }
        set(newValue) {
            self = (self.toU32 | (newValue.toU32 << index.toU32)).to32
        }
    }
}
extension UInt32 {
    public var toU8: UInt8{ return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{ return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return self}
    public var to32: Int32{return Int32(bitPattern:self)}
    public var toU64: UInt64{
        return UInt64(self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:UInt32{return UInt32.max}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> UInt32 {
        get {
            return self & (0xFF << index.toU32) >> index.toU32
        }
        set(newValue) {
            self = self | (newValue.toU32 << index.toU32)
        }
    }
}

extension Int64 {
    public var toU8: UInt8{ return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{ return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{
        return UInt64(bitPattern:self) //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return self //No difference if the platform is 32 or 64
        }
    public static var allOnes:Int64{return Int64(bitPattern: UInt64.max)}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> Int64 {
        get {
            return ((self.toU64 & (0xFF << index.toU64)) >> index.toU64).to64
        }
        set(newValue) {
            self = (self.toU64 | (newValue.toU64 << index.toU64)).to64
        }
    }
}
extension UInt64 {
    public var toU8: UInt8{ return UInt8(truncatingBitPattern:self)}
    public var to8: Int8{ return Int8(truncatingBitPattern:self)}
    public var toU16: UInt16{return UInt16(truncatingBitPattern:self)}
    public var to16: Int16{return Int16(truncatingBitPattern:self)}
    public var toU32: UInt32{return UInt32(truncatingBitPattern:self)}
    public var to32: Int32{return Int32(truncatingBitPattern:self)}
    public var toU64: UInt64{
        return self //No difference if the platform is 32 or 64
        }
    public var to64: Int64{
        return Int64(bitPattern:self) //No difference if the platform is 32 or 64
        }
    public static var allOnes:UInt64{return UInt64.max}
    public static var size:Int{return strideof(self)}
    subscript(index: Int) -> UInt64 {
        get {
            return self & (0xFF << index.toU64) >> index.toU64
        }
        set(newValue) {
            self = self | (newValue.toU64 << index.toU64)
        }
    }
}

// MARK: Operators

prefix operator ~~ {}

prefix func ~~(value: UInt)->UInt{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int)->Int{
    return (value>0) ? 1 : 0
}

prefix func ~~(value: UInt8)->UInt8{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int8)->Int8{
    return (value>0) ? 1 : 0
}

prefix func ~~(value: UInt16)->UInt16{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int16)->Int16{
    return (value>0) ? 1 : 0
}

prefix func ~~(value: UInt32)->UInt32{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int32)->Int32{
    return (value>0) ? 1 : 0
}

prefix func ~~(value: UInt64)->UInt64{
    return (value>0) ? 1 : 0
}
prefix func ~~(value: Int64)->Int64{
    return (value>0) ? 1 : 0
}

