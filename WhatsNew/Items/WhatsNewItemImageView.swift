//
//  WhatsNewItemImageView.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/19/17.
//

import UIKit

class WhatsNewItemImageView: UIView, NibLoadable, WhatsNewItemCustomizable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set(image: UIImage, title: String, subtitle: String, textColor: UIColor) {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshFonts), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
        imageView.image = image
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
