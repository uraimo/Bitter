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
    
    func testUInt8ManualMask() {
        var sut: UInt8 = 0x95
        sut[0] |= 0b11110000
        XCTAssertEqual(sut, 0b11110101)
        
        sut = 0x95
        sut[0] |= 0b00001111
        XCTAssertEqual(sut, 0b10011111)
    }
    
    func testUInt64Mask() {
        let sut: UInt64 = 0x1122334455660088
        
        XCTAssertEqual(UInt64().mask(bits: sut, msb: false), 0xFFFFFFFF55660088)
        XCTAssertEqual(UInt64().mask(bits: sut, msb: true), 0x11223344FFFFFFFF)
    }
    
    func testUInt32Mask() {
        let sut: UInt32 = 0x11220044
        
        XCTAssertEqual(UInt32().mask(bits: sut, msb: false), 0xFFFF0044)
        XCTAssertEqual(UInt32().mask(bits: sut, msb: true), 0x1122FFFF)
    }
    
    func testUInt16Mask() {
        let sut: UInt16 = 0x0044
        
        XCTAssertEqual(UInt16().mask(bits: sut, msb: false), 0xFF44)
        XCTAssertEqual(UInt16().mask(bits: sut, msb: true), 0x00FF)
        
    }
    
    func testUInt8Mask() {
        let sut: UInt8 = 0x44
        
        XCTAssertEqual(UInt8().mask(bits: sut, msb: false), 0xF4)
        XCTAssertEqual(UInt8().mask(bits: sut, msb: true), 0x4F)
        
    }
}

