//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

public struct WhatsNew {
    static let bundle = Bundle(for: WhatsNewViewController.self)
    public static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let userDefaultsKeyLatestAppVersionPresented = "LatestAppVersionPresented"

    static func markCurrentVersionAsPresented() {
        UserDefaults.standard.set(appVersion, forKey: userDefaultsKeyLatestAppVersionPresented)
    }

    public static func shouldPresent(with option: PresentationOption = .onUpdate, currentVersion: String? = appVersion) -> Bool {
        guard let currentAppVersion = currentVersion else { return false }
        let previousAppVersion = UserDefaults.standard.string(forKey: userDefaultsKeyLatestAppVersionPresented)
        let didUpdate = previousAppVersion != currentAppVersion
        
        switch option {
        case .debug: return true
        case .never: return false
        case .onMajorUpdate: return didUpdate && isMajorVersion(version: currentAppVersion)
        case .onUpdate: return didUpdate
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
