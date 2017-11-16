//
//  WhatsNewItemImageView.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/19/17.
//

import UIKit

class WhatsNewItemImageView: UIView, NibLoadable, WhatsNewItemView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set(image: UIImage, title: String, subtitle: String, titleColor: UIColor, subtitleColor: UIColor, titleFont: UIFont, subtitleFont: UIFont) {
        imageView.image = image
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = subtitleColor
        subtitleLabel.font = subtitleFont
    }
}
