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
    
    func testShouldNotPresent_WhenCurrentVersionIsUndefined() {
        XCTAssertFalse(WhatsNew.shouldPresent(with: .always, currentVersion: nil))
    }
    
    func testShouldPresentAlways_WhenFirstVersionInstalled() {
        XCTAssertTrue(WhatsNew.shouldPresent(with: .always, currentVersion: "1.0"))
    }

    func testShouldPresentAlways_WhenUpdatingVersion() {
        UserDefaults.standard.set("1.0", forKey: WhatsNew.userDefaultsKeyLatestAppVersionPresented)
        XCTAssertTrue(WhatsNew.shouldPresent(with: .always, currentVersion: "1.1"))
        XCTAssertTrue(WhatsNew.shouldPresent(with: .always, currentVersion: "1.0.1"))
    }
    
    func testShouldPresentMajorVersion_WhenUpdatingVersionMajor() {
        UserDefaults.standard.set("1.9", forKey: WhatsNew.userDefaultsKeyLatestAppVersionPresented)
        XCTAssertTrue(WhatsNew.shouldPresent(with: .majorVersion, currentVersion: "2.0"))
        XCTAssertTrue(WhatsNew.shouldPresent(with: .majorVersion, currentVersion: "2.0.0"))
    }

    func testShouldNotPresentMajorVersion_WhenUpdatingVersionMinor() {
        UserDefaults.standard.set("1.0", forKey: WhatsNew.userDefaultsKeyLatestAppVersionPresented)
        XCTAssertFalse(WhatsNew.shouldPresent(with: .majorVersion, currentVersion: "1.1"))
        XCTAssertFalse(WhatsNew.shouldPresent(with: .majorVersion, currentVersion: "1.0.1"))
        XCTAssertFalse(WhatsNew.shouldPresent(with: .majorVersion, currentVersion: "2.1"))
    }

    func testShouldNotPresentNever_WhenUpdatingVersion() {
        UserDefaults.standard.set("1.0", forKey: WhatsNew.userDefaultsKeyLatestAppVersionPresented)
        XCTAssertFalse(WhatsNew.shouldPresent(with: .never, currentVersion: "1.0"))
        XCTAssertFalse(WhatsNew.shouldPresent(with: .never, currentVersion: nil))
        XCTAssertFalse(WhatsNew.shouldPresent(with: .never, currentVersion: "2.0"))
    }
    
    func testShouldPresent_WhenDebugPresentationOption() {
        XCTAssertTrue(WhatsNew.shouldPresent(with: .debug, currentVersion: "2.4"))
    }
}
