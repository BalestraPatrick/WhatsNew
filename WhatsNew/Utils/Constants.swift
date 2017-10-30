//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

struct Constants {
    static let bundle = Bundle(for: WhatsNewViewController.self)
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let userDefaultsKey = "LatestAppVersionPresented"
    static var canPresent: Bool {
        return (UserDefaults.standard.string(forKey: userDefaultsKey) ?? "") != appVersion
    }
}
