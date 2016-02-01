//
//  BitterSwift.swift
//  BitterSwift
//
//  Created by Umberto Raimondi on 01/02/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

// MARK: Int types extensions

extension Int{
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(truncatingBitPattern:self)}}
    public var to32: Int32{get{return Int32(truncatingBitPattern:self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:Int{return Int(bitPattern: UInt.max)}
}
extension UInt{
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(truncatingBitPattern:self)}}
    public var to32: Int32{get{return Int32(truncatingBitPattern:self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:UInt{return UInt.max}
}

extension Int8 {
    public var toU8: UInt8{ get{return UInt8(bitPattern:self)} }
    public var to8: Int8{ get{return self} }
    public var toU16: UInt16{get{return UInt16(self)}}
    public var to16: Int16{get{return Int16(self)}}
    public var toU32: UInt32{get{return UInt32(self)}}
    public var to32: Int32{get{return Int32(self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:Int8{return Int8(bitPattern: UInt8.max)}
}
extension UInt8 {
    public var toU8: UInt8{ get{return self} }
    public var to8: Int8{ get{return Int8(bitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(self)}}
    public var to16: Int16{get{return Int16(self)}}
    public var toU32: UInt32{get{return UInt32(self)}}
    public var to32: Int32{get{return Int32(self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:UInt8{return UInt8.max}
}

extension Int16 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(bitPattern:self)}}
    public var to16: Int16{get{return self}}
    public var toU32: UInt32{get{return UInt32(self)}}
    public var to32: Int32{get{return Int32(self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:Int16{return Int16(bitPattern: UInt16.max)}
}
extension UInt16 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return self}}
    public var to16: Int16{get{return Int16(bitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(self)}}
    public var to32: Int32{get{return Int32(self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:UInt16{return UInt16.max}
}

extension Int32 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(bitPattern:self)}}
    public var to32: Int32{get{return self}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:Int32{return Int32(bitPattern: UInt32.max)}
}
extension UInt32 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return self}}
    public var to32: Int32{get{return Int32(bitPattern:self)}}
    public var toU64: UInt64{get{
        return UInt64(self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:UInt32{return UInt32.max}
}

extension Int64 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(truncatingBitPattern:self)}}
    public var to32: Int32{get{return Int32(truncatingBitPattern:self)}}
    public var toU64: UInt64{get{
        return UInt64(bitPattern:self) //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return self //No difference if the platform is 32 or 64
        }}
    public static var allOnes:Int64{return Int64(bitPattern: UInt64.max)}
}
extension UInt64 {
    public var toU8: UInt8{ get{return UInt8(truncatingBitPattern:self)} }
    public var to8: Int8{ get{return Int8(truncatingBitPattern:self)} }
    public var toU16: UInt16{get{return UInt16(truncatingBitPattern:self)}}
    public var to16: Int16{get{return Int16(truncatingBitPattern:self)}}
    public var toU32: UInt32{get{return UInt32(truncatingBitPattern:self)}}
    public var to32: Int32{get{return Int32(truncatingBitPattern:self)}}
    public var toU64: UInt64{get{
        return self //No difference if the platform is 32 or 64
        }}
    public var to64: Int64{get{
        return Int64(bitPattern:self) //No difference if the platform is 32 or 64
        }}
    public static var allOnes:UInt64{return UInt64.max}
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

