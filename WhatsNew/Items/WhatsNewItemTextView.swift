//
//  WhatsNewItemTextView.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/19/17.
//

import UIKit

class WhatsNewItemTextView: UIView, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set(title: String, subtitle: String, textColor: UIColor) {
        titleLabel.text = title
        titleLabel.textColor = textColor
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = textColor
    }
}
