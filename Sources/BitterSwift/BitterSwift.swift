//
//  BitterSwift.swift
//  BitterSwift
//
//  Created by Umberto Raimondi on 01/02/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

//MARK: Int types extensions


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
}


//MARK: Operators

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

