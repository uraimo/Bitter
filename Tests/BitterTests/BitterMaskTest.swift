//
//  BitterTempTest.swift
//  BitterTests
//
//  Created by Alessio Roberto on 30/09/2017.
//  Copyright © 2017 Umberto Raimondi. All rights reserved.
//

import XCTest
@testable import Bitter

class BitterTempTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUIntMask() {
        let sut = UInt.max
        
        XCTAssertEqual(sut & (UInt().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & UInt().mask(3, true), 0xE000000000000000)
        XCTAssertEqual(UInt().mask(64, true), sut)
        XCTAssertEqual(UInt().mask(64, false), sut)
    }
    
    func testIntMask() {
        let sut = Int.max
        
        XCTAssertEqual(sut & (Int().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & (Int().mask(3, true) >> 1), 0x7000000000000000)
        XCTAssertEqual(Int().mask(64, true), sut)
        XCTAssertEqual(Int().mask(64, false), sut)
    }
    
    func testUInt64Mask() {
        let sut = UInt64.max
     
        XCTAssertEqual(sut & (UInt64().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & UInt64().mask(3, true), 0xE000000000000000)
        XCTAssertEqual(UInt64().mask(64, true), sut)
        XCTAssertEqual(UInt64().mask(64, false), sut)
    }
    
    func testInt64Mask() {
        let sut = Int64.max
        
        XCTAssertEqual(sut & (Int64().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & (Int64().mask(3, true) >> 1), 0x7000000000000000)
        XCTAssertEqual(Int64().mask(64, true), sut)
        XCTAssertEqual(Int64().mask(64, false), sut)
    }
    
    func testUInt32Mask() {
        let sut = UInt32.max
        
        XCTAssertEqual(sut & (UInt32().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & UInt32().mask(3, true), 0xE0000000)
        XCTAssertEqual(UInt32().mask(32, true), sut)
        XCTAssertEqual(UInt32().mask(32, false), sut)
    }
    
    func testInt32Mask() {
        let sut = Int32.max
        
        XCTAssertEqual(sut & (Int32().mask(2, false) << 4), 0x0030)
        XCTAssertEqual(sut & (Int32().mask(3, true) >> 1), 0x70000000)
        XCTAssertEqual(Int32().mask(32, true), sut)
        XCTAssertEqual(Int32().mask(32, false), sut)
    }
    
    func testUInt16Mask() {
        let sut = UInt16.max
        
        XCTAssertEqual(sut & (UInt16().mask(2, false) << 4), 0b0000000000110000)
        XCTAssertEqual(sut & UInt16().mask(3, true), 0b1110000000000000)
        XCTAssertEqual(UInt16().mask(16, true), sut)
        XCTAssertEqual(UInt16().mask(16, false), sut)
    }
    
    func testInt16Mask() {
        let sut = Int16.max
        
        XCTAssertEqual(sut & (Int16().mask(2, false) << 4), 0b0000000000110000)
        XCTAssertEqual(sut & (Int16().mask(3, true) >> 1), 0b0111000000000000)
        XCTAssertEqual(Int16().mask(16, true), sut)
        XCTAssertEqual(Int16().mask(16, false), sut)
    }
    
    func testUInt8Mask() {
        let sut = UInt8.max
        
        XCTAssertEqual(sut & (UInt8().mask(2, false) << 4), 0b00110000)
        XCTAssertEqual(sut & UInt8().mask(2, true), 0b11000000)
        XCTAssertEqual(UInt8().mask(8, true), sut)
        XCTAssertEqual(UInt8().mask(8, false), sut)
    }
    
    func testInt8Mask() {
        let sut = Int8.max
        
        XCTAssertEqual(sut & (Int8().mask(2, false) << 4), 0b00110000)
        XCTAssertEqual(sut & Int8().mask(2, true), 0b1000000)
        XCTAssertEqual(Int8().mask(8, true), sut)
        XCTAssertEqual(Int8().mask(8, false), sut)
    }
}

