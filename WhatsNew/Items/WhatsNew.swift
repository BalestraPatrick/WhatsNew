//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

public struct WhatsNew {
    static let bundle = Bundle(for: WhatsNewViewController.self)
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let userDefaultsKey = "LatestAppVersionPresented"

    static func markCurrentVersionAsPresented() {
        UserDefaults.standard.set(appVersion, forKey: userDefaultsKey)
        UserDefaults.standard.synchronize()
    }

    public static func shouldPresent(with option: PresentationOption = .always) -> Bool {
        guard let currentAppVersion = appVersion else { return false }
        let previousAppVersion = UserDefaults.standard.string(forKey: userDefaultsKey)
        let didUpdate = previousAppVersion != appVersion
        
        switch option {
        case .debug: return true
        case .never: return false
        case .majorVersion: return didUpdate && isMajorVersion(version: currentAppVersion)
        case .always: return didUpdate
        }
    }
    
    private static func isMajorVersion(version: String) -> Bool {
        let components = version.split(separator: ".")
        // ensure minor version or hotfix version is either nil or 0
        
        guard components.count > 1 else { return true }
        let minorUpdate = components[1]
        guard minorUpdate == "0" else { return false }
        
        guard components.count > 2 else { return true }
        let hotfixUpdate = components[2]
        guard hotfixUpdate == "0" else { return false }
        
        return true
    }
}
