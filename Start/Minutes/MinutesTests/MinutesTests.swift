//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Fabian Lopez on 1/22/21.
//  Copyright © 2021 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    var entryUnderTest : Entry!

    override func setUp(){
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        entryUnderTest = nil
        super.tearDown()
    }
    
    func testSerialization(){
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
}
