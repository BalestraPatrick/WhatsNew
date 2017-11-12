//
//  WhatsNewItemTextView.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/19/17.
//

import UIKit

class WhatsNewItemTextView: UIView, NibLoadable, WhatsNewItemCustomizable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set(title: String, subtitle: String, textColor: UIColor) {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshFonts), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
        titleLabel.text = title
        titleLabel.textColor = textColor
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = textColor
        setDefaultFonts()
    }

    @objc func refreshFonts() {
        setDefaultFonts()
    }
}
