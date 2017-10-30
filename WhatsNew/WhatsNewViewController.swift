//
//  WhatsNewViewController.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/15/17.
//  Copyright © 2017 Patrick Balestra. All rights reserved.
//

import UIKit

struct Constants {
    static let bundle = Bundle(for: WhatsNewViewController.self)
    static let appVersion = Bundle.main.infoDictionary?["CFBundleInfoDictionaryVersion"] as? String
    static let userDefaultsKey = "LatestAppVersionPresented"
    static var canPresent = true // (UserDefaults.standard.string(forKey: userDefaultsKey) ?? "") != appVersion
}

public class WhatsNewViewController: UIViewController {

    /// Closure invoked when the user dismisses the view controller.
    public var onDismissal: (() -> Void)?

    private let items: [WhatsNewItem]

    @IBOutlet private weak var stackView: UIStackView!

    public init(items: [WhatsNewItem]) {
        self.items = items
        super.init(nibName: "WhatsNew", bundle: Constants.bundle)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Unsupported, please use init(items:)")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setUp(with: items)
    }

    public func presentIfNeeded(on parentViewController: UIViewController) {
        parentViewController.present(self, animated: true, completion: nil)
    }

    private func setUp(with items: [WhatsNewItem]) {
        items.forEach { item in
            let view: UIView
            switch item {
            case .image(let title, let subtitle, let image):
                let itemView = WhatsNewItemImageView.loadFromNib()
                itemView.set(image: image, title: title, subtitle: subtitle)
                view = itemView

            case .text(let title, let subtitle):
                let itemView = WhatsNewItemTextView.loadFromNib()
                itemView.set(title: title, subtitle: subtitle)
                view = itemView
            }
            stackView.addArrangedSubview(view)
        }
    }

    @IBAction func `continue`(_ sender: Any) {
        UserDefaults.standard.set(Constants.appVersion, forKey: Constants.userDefaultsKey)
        dismiss(animated: true, completion: onDismissal)
    }
}
