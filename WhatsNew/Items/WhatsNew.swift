//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

struct WhatsNew {
    static let bundle = Bundle(for: WhatsNewViewController.self)
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let userDefaultsKey = "LatestAppVersionPresented"

    static func markCurrentVersionAsPresented() {
        UserDefaults.standard.set(appVersion, forKey: userDefaultsKey)
    }

    static func shouldPresent(with option: PresentationOption) -> Bool {
        let previousAppVersion = UserDefaults.standard.string(forKey: userDefaultsKey)
        
        let didUpdate = previousAppVersion != appVersion
        
        // Choose based on the selected presentation option.
        switch option {
        case .debug: return true
        case .never: return false
        case .majorVersion: return didChangeMajorVersion(previous: previousAppVersion, current: appVersion)
        case .always: return didUpdate
        }
    }

    private static func didChangeMajorVersion(previous: String?, current: String?) -> Bool {
        guard let previousMajor = previous?.split(separator: ".").first, let previousMajorInt = Int(previousMajor) else { return false }
        guard let currentMajor = current?.split(separator: ".").first, let currentMajorInt = Int(currentMajor) else { return false }
        return currentMajorInt > previousMajorInt
    }
}
