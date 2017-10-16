//
//  WhatsNewViewController.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/15/17.
//  Copyright © 2017 Patrick Balestra. All rights reserved.
//

import UIKit

public enum WhatsNewItem {
    case text(title: String, subtitle: String)
    case image(title: String, subtitle: String, image: UIImage)
}

public class WhatsNewViewController: UIViewController {

    public var onDismissal: (() -> Void)?

    private struct Constants {
        static let bundle = Bundle(for: WhatsNewViewController.self)
        static let appVersion = Bundle.main.infoDictionary?["CFBundleInfoDictionaryVersion"] as? String
        static let userDefaultsKey = "LatestAppVersionPresented"
        static var canPresent = true // (UserDefaults.standard.string(forKey: userDefaultsKey) ?? "") != appVersion
    }

    public init?(items: [WhatsNewItem]) {
        guard Constants.canPresent && items.count > 0 else { return nil }
        super.init(nibName: "WhatsNew", bundle: Constants.bundle)
        setUp()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Unsupported, please use init?(items:)")
    }

    private func setUp() {
        // TODO: set up view hierarchy
    }

    @IBAction func `continue`(_ sender: Any) {
        UserDefaults.standard.set(Constants.appVersion, forKey: Constants.userDefaultsKey)
        dismiss(animated: true, completion: onDismissal)
    }
}
