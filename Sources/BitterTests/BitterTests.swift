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
    
    func testUInt64Conversion() {
        let i:UInt64=0xFFAAFFAAFFAAFFAA
        XCTAssert(i.toU64==0xFFAAFFAAFFAAFFAA)
        XCTAssert(i.toU32==0xFFAAFFAA)
        XCTAssert(i.toU16==0xFFAA)
        XCTAssert(i.toU8==0xAA)
    }
    
}
