//
//  WhatsNewItemTextView.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/19/17.
//

import UIKit

class WhatsNewItemTextView: UIView, NibLoadable, WhatsNewItemView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set(title: String, subtitle: String, titleColor: UIColor, subtitleColor: UIColor, titleFont: UIFont, subtitleFont: UIFont) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = subtitleColor
        subtitleLabel.font = subtitleFont
    }
}
