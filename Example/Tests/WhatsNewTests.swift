//
//  WhatsNewTests.swift
//  Tests
//
//  Created by BalestraPatrick on 10/16/2017.
//  Copyright (c) 2017 BalestraPatrick. All rights reserved.
//

import XCTest
@testable import WhatsNew

class WhatsNewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Clear user defaults.
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    func testShouldPresentAlways_WhenFirstVersionInstalled() {
        XCTAssertTrue(WhatsNew.shouldPresent(with: .always))
    }

    func testShouldPresentAlways_WhenUpdatingVersion() {
        UserDefaults.standard.set("0.9", forKey: WhatsNew.userDefaultsKey)
        XCTAssertTrue(WhatsNew.shouldPresent(with: .always))
    }

    func testShouldNotPresentAlways_WhenNotUpdatingVersion() {
        UserDefaults.standard.set("1.0", forKey: WhatsNew.userDefaultsKey)
        XCTAssertFalse(WhatsNew.shouldPresent(with: .always))
    }

    func testShouldPresentMajorVersion_WhenUpdatingVersionMajor() {
        UserDefaults.standard.set("0.9", forKey: WhatsNew.userDefaultsKey)
        XCTAssertTrue(WhatsNew.shouldPresent(with: .majorVersion))
    }

    func testShouldNotPresentMajorVersion_WhenUpdatingVersionMinor() {
        UserDefaults.standard.set("1.0.1", forKey: WhatsNew.userDefaultsKey)
        XCTAssertFalse(WhatsNew.shouldPresent(with: .majorVersion))
    }

    func testShouldNotPresentNever_WhenUpdatingVersion() {
        UserDefaults.standard.set("0.9", forKey: WhatsNew.userDefaultsKey)
        XCTAssertFalse(WhatsNew.shouldPresent(with: .never))
    }
    
    func testShouldPresent_WhenDebugPresentationOption() {
        UserDefaults.standard.set("1.0", forKey: WhatsNew.userDefaultsKey)
        XCTAssertTrue(WhatsNew.shouldPresent(with: .debug))
    }
}
