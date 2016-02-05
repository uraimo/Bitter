//
//  BitterTests.swift
//  BitterTests
//
//  Created by Umberto Raimondi on 31/01/16.
//  Copyright © 2016 Umberto Raimondi. All rights reserved.
//

import XCTest
@testable import Bitter

class BitterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    // MARK: UInt64 Tests
    let iUInt64:UInt64 = (UInt.size==8) ? 0xFFAAFFAAFFAAFFAA : 0xFFAAFFAA
    func testUInt64Conversion() {
        XCTAssert(iUInt64.toUInt == UInt(truncatingBitPattern:iUInt64))
        XCTAssert(iUInt64.toInt.toUInt == UInt(truncatingBitPattern:iUInt64))
        XCTAssert(iUInt64.toU64 == iUInt64)
        XCTAssert(iUInt64.to64.toU64 == iUInt64)
        XCTAssert(iUInt64.toU32==0xFFAAFFAA)
        XCTAssert(iUInt64.to32.toU32==0xFFAAFFAA)
        XCTAssert(iUInt64.toU16==0xFFAA)
        XCTAssert(iUInt64.to16.toU16==0xFFAA)
        XCTAssert(iUInt64.toU8==0xAA)
        XCTAssert(iUInt64.to8.toU8==0xAA)
    }
    let aUInt64:UInt64=0x1122334455667788
    func testUInt64SubscriptGet(){
        XCTAssertEqual(aUInt64[0], 0x88)
        XCTAssertEqual(aUInt64[1], 0x77)
        XCTAssertEqual(aUInt64[2], 0x66)
        XCTAssertEqual(aUInt64[3], 0x55)
        XCTAssertEqual(aUInt64[4], 0x44)
        XCTAssertEqual(aUInt64[5], 0x33)
        XCTAssertEqual(aUInt64[6], 0x22)
        XCTAssertEqual(aUInt64[7], 0x11)
    }
    var asUInt64:UInt64=0x1122334455667788
    func testUInt64SubscriptSet(){
        asUInt64[0]=0xAA;asUInt64[1]=0xAA;asUInt64[2]=0xAA;
        asUInt64[3]=0xAA;asUInt64[4]=0xAA;asUInt64[5]=0xAA;
        asUInt64[6]=0xAA;asUInt64[7]=0xAA;
        XCTAssertEqual(asUInt64[0], 0xAA)
        XCTAssertEqual(asUInt64[1], 0xAA)
        XCTAssertEqual(asUInt64[2], 0xAA)
        XCTAssertEqual(asUInt64[3], 0xAA)
        XCTAssertEqual(asUInt64[4], 0xAA)
        XCTAssertEqual(asUInt64[5], 0xAA)
        XCTAssertEqual(asUInt64[6], 0xAA)
        XCTAssertEqual(asUInt64[7], 0xAA)
    }
     // MARK: Int64 Tests
    let iInt64:Int64 = (Int.size==8) ? 0x6FAAFFAAFFAAFFAA : 0xFFAAFFAA
    func testInt64Conversion() {
        XCTAssert(iInt64.toUInt==UInt(truncatingBitPattern:iInt64))
        XCTAssert(iInt64.toInt.toUInt==UInt(truncatingBitPattern:iInt64))
        XCTAssert(iInt64.toU64==UInt64(bitPattern:iInt64))
        XCTAssert(iInt64.to64.toU64==UInt64(bitPattern:iInt64))
        XCTAssert(iInt64.toU32==0xFFAAFFAA)
        XCTAssert(iInt64.to32.toU32==0xFFAAFFAA)
        XCTAssert(iInt64.toU16==0xFFAA)
        XCTAssert(iInt64.to16.toU16==0xFFAA)
        XCTAssert(iInt64.toU8==0xAA)
        XCTAssert(iInt64.to8.toU8==0xAA)
    }
    let aInt64:Int64=0x1122334455667788
    func testInt64SubscriptGet(){
        XCTAssertEqual(aInt64[0], 0x88)
        XCTAssertEqual(aInt64[1], 0x77)
        XCTAssertEqual(aInt64[2], 0x66)
        XCTAssertEqual(aInt64[3], 0x55)
        XCTAssertEqual(aInt64[4], 0x44)
        XCTAssertEqual(aInt64[5], 0x33)
        XCTAssertEqual(aInt64[6], 0x22)
        XCTAssertEqual(aInt64[7], 0x11)
    }
    var asInt64:Int64=0x1122334455667788
    func testInt64SubscriptSet(){
        asInt64[0]=0xAA;asInt64[1]=0xAA;asInt64[2]=0xAA;
        asInt64[3]=0xAA;asInt64[4]=0xAA;asInt64[5]=0xAA;
        asInt64[6]=0xAA;asInt64[7]=0xAA;
        XCTAssertEqual(asInt64[0], 0xAA)
        XCTAssertEqual(asInt64[1], 0xAA)
        XCTAssertEqual(asInt64[2], 0xAA)
        XCTAssertEqual(asInt64[3], 0xAA)
        XCTAssertEqual(asInt64[4], 0xAA)
        XCTAssertEqual(asInt64[5], 0xAA)
        XCTAssertEqual(asInt64[6], 0xAA)
        XCTAssertEqual(asInt64[7], 0xAA)
    }
    
    // MARK: UInt32 Tests
    let iUInt32:UInt32=0xFFAAFFAA
    func testUInt32Conversion() {
        XCTAssert(iUInt32.toUInt==0xFFAAFFAA)
        XCTAssert(iUInt32.toInt.toUInt==0xFFAAFFAA)
        XCTAssert(iUInt32.toU64==0xFFAAFFAA)
        XCTAssert(iUInt32.to64.toU64==0xFFAAFFAA)
        XCTAssert(iUInt32.toU32==0xFFAAFFAA)
        XCTAssert(iUInt32.to32.toU32==0xFFAAFFAA)
        XCTAssert(iUInt32.toU16==0xFFAA)
        XCTAssert(iUInt32.to16.toU16==0xFFAA)
        XCTAssert(iUInt32.toU8==0xAA)
        XCTAssert(iUInt32.to8.toU8==0xAA)
    }
    let aUInt32:UInt32=0x11667788
    func testUInt32SubscriptGet(){
        XCTAssertEqual(aUInt32[0], 0x88)
        XCTAssertEqual(aUInt32[1], 0x77)
        XCTAssertEqual(aUInt32[2], 0x66)
        XCTAssertEqual(aUInt32[3], 0x11)
    }
    var asUInt32:UInt32=0x11667788
    func testUInt32SubscriptSet(){
        asUInt32[0]=0xAA;asUInt32[1]=0xAA;asUInt32[2]=0xAA;
        asUInt32[3]=0xAA
        XCTAssertEqual(asUInt32[0], 0xAA)
        XCTAssertEqual(asUInt32[1], 0xAA)
        XCTAssertEqual(asUInt32[2], 0xAA)
        XCTAssertEqual(asUInt32[3], 0xAA)
    }
     // MARK: Int32 Tests
    let iInt32:Int32=0x6FAAFFAA
    func testInt32Conversion() {
        XCTAssert(iInt32.toUInt==0x6FAAFFAA)
        XCTAssert(iInt32.toInt.toUInt==0x6FAAFFAA)
        XCTAssert(iInt32.toU64==0x6FAAFFAA)
        XCTAssert(iInt32.to64.toU64==0x6FAAFFAA)
        XCTAssert(iInt32.toU32==0x6FAAFFAA)
        XCTAssert(iInt32.to32.toU32==0x6FAAFFAA)
        XCTAssert(iInt32.toU16==0xFFAA)
        XCTAssert(iInt32.to16.toU16==0xFFAA)
        XCTAssert(iInt32.toU8==0xAA)
        XCTAssert(iInt32.to8.toU8==0xAA)
    }
    let aInt32:Int32=0x11667788
    func testInt32SubscriptGet(){
        XCTAssertEqual(aInt32[0], 0x88)
        XCTAssertEqual(aInt32[1], 0x77)
        XCTAssertEqual(aInt32[2], 0x66)
        XCTAssertEqual(aInt32[3], 0x11)
    }
    var asInt32:Int32=0x11667788
    func testInt32SubscriptSet(){
        asInt32[0]=0xAA;asInt32[1]=0xAA;asInt32[2]=0xAA;
        asInt32[3]=0xAA
        XCTAssertEqual(asInt32[0], 0xAA)
        XCTAssertEqual(asInt32[1], 0xAA)
        XCTAssertEqual(asInt32[2], 0xAA)
        XCTAssertEqual(asInt32[3], 0xAA)
    }
    
     // MARK: UInt16 Tests
    let iUInt16:UInt16=0x6FAA
    func testUInt16Conversion() {
        XCTAssert(iUInt16.toUInt==0x6FAA)
        XCTAssert(iUInt16.toInt.toUInt==0x6FAA)
        XCTAssert(iUInt16.toU64==0x6FAA)
        XCTAssert(iUInt16.to64.toU64==0x6FAA)
        XCTAssert(iUInt16.toU32==0x6FAA)
        XCTAssert(iUInt16.to32.toU32==0x6FAA)
        XCTAssert(iUInt16.toU16==0x6FAA)
        XCTAssert(iUInt16.to16.toU16==0x6FAA)
        XCTAssert(iUInt16.toU8==0xAA)
        XCTAssert(iUInt16.to8.toU8==0xAA)
    }
    let aUInt16:UInt16=0x1188
    func testUInt16SubscriptGet(){
        XCTAssertEqual(aUInt16[0], 0x88)
        XCTAssertEqual(aUInt16[1], 0x11)
    }
    var asUInt16:UInt16=0x1188
    func testUInt16SubscriptSet(){
        asUInt16[0]=0xAA;asUInt16[1]=0xAA
        XCTAssertEqual(asUInt16[0], 0xAA)
        XCTAssertEqual(asUInt16[1], 0xAA)
    }
    // MARK: UInt8 Tests
    let iUInt8:UInt8=0x66
    func testUInt8Conversion() {
        XCTAssert(iUInt8.toUInt==0x66)
        XCTAssert(iUInt8.toInt.toUInt==0x66)
        XCTAssert(iUInt8.toU64==0x66)
        XCTAssert(iUInt8.to64.toU64==0x66)
        XCTAssert(iUInt8.toU32==0x66)
        XCTAssert(iUInt8.to32.toU32==0x66)
        XCTAssert(iUInt8.toU16==0x66)
        XCTAssert(iUInt8.to16.toU16==0x66)
        XCTAssert(iUInt8.toU8==0x66)
        XCTAssert(iUInt8.to8.toU8==0x66)
    }
    let aUInt8:UInt8=0x66
    func testUInt8SubscriptGet(){
        XCTAssertEqual(aUInt8[0], 0x66)
    }
    var asUInt8:UInt8=0x66
    func testUInt8SubscriptSet(){
        asUInt8[0]=0xAA
        XCTAssertEqual(asUInt8[0], 0xAA)
    }
     // MARK: Int8 Tests
    let iInt8:Int8=0x66
    func testInt8Conversion() {
        XCTAssert(iInt8.toUInt==0x66)
        XCTAssert(iInt8.toInt.toUInt==0x66)
        XCTAssert(iInt8.toU64==0x66)
        XCTAssert(iInt8.to64.toU64==0x66)
        XCTAssert(iInt8.toU32==0x66)
        XCTAssert(iInt8.to32.toU32==0x66)
        XCTAssert(iInt8.toU16==0x66)
        XCTAssert(iInt8.to16.toU16==0x66)
        XCTAssert(iInt8.toU8==0x66)
        XCTAssert(iInt8.to8.toU8==0x66)
    }
    let aInt8:Int8=0x66
    func testInt8SubscriptGet(){
        XCTAssertEqual(aInt8[0], 0x66)
    }
    var asInt8:Int8=0x66
    func testInt8SubscriptSet(){
        asInt8[0]=0x1A
        XCTAssertEqual(asInt8[0], 0x1A)
    }
    
}
