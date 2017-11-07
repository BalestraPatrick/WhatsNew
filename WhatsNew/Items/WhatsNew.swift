//
//  Constants.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

public struct WhatsNew {
    internal static let bundle = Bundle(for: WhatsNewViewController.self)
    internal static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    internal static let userDefaultsKey = "LatestAppVersionPresented"

    public static func markCurrentVersionAsPresented() {
        UserDefaults.standard.set(appVersion, forKey: userDefaultsKey)
    }

    internal static func shouldPresent(with option: PresentationOption) -> Bool {
        let previousAppVersion = UserDefaults.standard.string(forKey: userDefaultsKey)
        let didUpdate = previousAppVersion != appVersion
        // If main bundle was not updated, never present.
        guard didUpdate else { return false }
        // Choose based on the selected presentation option.
        switch option {
        case .always: return true
        case .majorVersion: return didChangeMajorVersion(previous: previousAppVersion, current: appVersion)
        case .never: return false
        }
    }

    private static func didChangeMajorVersion(previous: String?, current: String?) -> Bool {
        guard let previousMajor = previous?.split(separator: ".").first, let previousMajorInt = Int(previousMajor) else { return false }
        guard let currentMajor = current?.split(separator: ".").first, let currentMajorInt = Int(currentMajor) else { return false }
        return currentMajorInt > previousMajorInt
    }
}
