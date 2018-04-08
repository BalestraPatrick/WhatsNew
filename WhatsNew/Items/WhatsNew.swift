//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

public struct WhatsNew {
    public static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let bundle = Bundle(for: WhatsNewViewController.self)
    static let userDefaultsKeyLatestAppVersionPresented = "LatestAppVersionPresented"

    static func markCurrentVersionAsPresented() {
        UserDefaults.standard.set(appVersion, forKey: userDefaultsKeyLatestAppVersionPresented)
    }

    public static func shouldPresent(with option: PresentationOption = .always, currentVersion: String? = appVersion) -> Bool {
        guard let currentAppVersion = currentVersion else { return false }
        let previousAppVersion = UserDefaults.standard.string(forKey: userDefaultsKeyLatestAppVersionPresented)
        let didUpdate = previousAppVersion != currentAppVersion
        switch option {
        case .debug: return true
        case .never: return false
        case .majorVersion: return didUpdate && didChangeMajorVersion(previous: previousAppVersion, current: currentAppVersion)
        case .always: return didUpdate
        }
    }

    private static func didChangeMajorVersion(previous: String?, current: String?) -> Bool {
        // If there is no previous installation, return true.
        guard let previous = previous else { return true }
        guard let previousMajor = previous.split(separator: ".").first, let previousMajorInt = Int(previousMajor) else { return false }
        guard let currentMajor = current?.split(separator: ".").first, let currentMajorInt = Int(currentMajor) else { return false }
        return currentMajorInt > previousMajorInt
    }
}
