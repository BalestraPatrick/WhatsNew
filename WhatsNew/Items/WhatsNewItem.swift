//
//  WhatsNewItem.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/30/17.
//

import Foundation

public enum WhatsNewItem {
    case text(title: String, subtitle: String)
    case image(title: String, subtitle: String, image: UIImage)
}

@objc public protocol WhatsNewItemCustomizable {
    weak var titleLabel: UILabel! { get set }
    weak var subtitleLabel: UILabel! { get set }
}

public extension WhatsNewItemCustomizable {

    public func setDefaultFonts() {
        set(titleFont: nil, subtitleFont: nil)
    }

    // Default implementation.
    public func set(titleFont: UIFont? = nil, subtitleFont: UIFont? = nil) {
        if let titleFont = titleFont, let subtitleFont = subtitleFont {
            titleLabel.font = titleFont
            subtitleLabel.font = subtitleFont
            return
        }
        // Use dynamic font size based on user preference if we're on > iOS 10.
        if #available(iOS 10, *) {
            titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
            subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        } else {
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
}
