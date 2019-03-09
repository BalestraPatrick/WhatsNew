//
//  WhatsNewViewController.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/15/17.
//  Copyright © 2017 Patrick Balestra. All rights reserved.
//

import UIKit

/// Shows new features added in this app update.
public class WhatsNewViewController: UIViewController {

    /// Defines when to present the What's New view controller. Check the `PresentationOption` enum for more details.
    public var presentationOption: PresentationOption = .always
    /// Closure invoked when the user dismisses the view controller.
    public var onDismissal: (() -> Void)?
    /// Text of the top title.
    public var titleText: String = "What’s New" {
        didSet {
            titleLabel?.text = titleText
        }
    }
    /// Color of the top title.
    public var titleColor: UIColor = .black {
        didSet {
            titleLabel?.textColor = titleColor
        }
    }
    /// Font of the top title.
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 26, weight: .bold) {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    /// Tint color of the feature item image, if one exists.
    public var itemImageTintColor: UIColor? = nil {
        didSet {
            setUp(with: items)
        }
    }
    /// Title color of the feature items.
    public var itemTitleColor: UIColor = .black {
        didSet {
            setUp(with: items)
        }
    }
    /// Subtitle color of the feature items.
    public var itemSubtitleColor: UIColor = .black {
        didSet {
            setUp(with: items)
        }
    }
    /// Title font of the feature items
    public var itemTitleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold) {
        didSet {
            setUp(with: items)
        }
    }
    /// Subtitle font of the feature items
    public var itemSubtitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular) {
        didSet {
            setUp(with: items)
        }
    }
    /// Text of the bottom button that dismisses the view controller.
    public var buttonText: String = "Continue" {
        didSet {
            continueButton?.setTitle(buttonText, for: .normal)
        }
    }
    /// Text color of the bottom button that dismisses the view controller.
    public var buttonTextColor: UIColor = .yellow {
        didSet {
            continueButton?.setTitleColor(buttonTextColor, for: .normal)
        }
    }
    /// Text font of the bottom button that dismisses the view controller.
    public var buttonFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular) {
        didSet {
            continueButton?.titleLabel?.font = buttonFont
        }
    }
    /// Background color of the bottom button that dismisses the view controller.
    public var buttonBackgroundColor: UIColor = .black {
        didSet {
            continueButton?.backgroundColor = buttonBackgroundColor
        }
    }

    private let items: [WhatsNewItem]
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var continueButton: UIButton!

    public init(items: [WhatsNewItem]) {
        self.items = items
        super.init(nibName: "WhatsNew", bundle: WhatsNew.bundle)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Unsupported initializer, please use init(items:)")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    public func presentIfNeeded(on parentViewController: UIViewController) {
        guard WhatsNew.shouldPresent(with: presentationOption) else { return }
        parentViewController.present(self, animated: true, completion: nil)
    }

    private func configureUI() {
        // Use dynamic font size if available
        if #available(iOS 10, *) {
            if let titleFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title2).withSymbolicTraits(.traitBold) {
                titleFont = UIFont(descriptor: titleFontDescriptor, size: 0)
            }
            itemSubtitleFont = UIFont.preferredFont(forTextStyle: .body)
        }
        titleLabel?.text = titleText
        titleLabel?.textColor = titleColor
        titleLabel?.font = titleFont
        continueButton?.setTitle(buttonText, for: .normal)
        continueButton?.setTitleColor(buttonTextColor, for: .normal)
        continueButton?.titleLabel?.font = buttonFont
        continueButton?.backgroundColor = buttonBackgroundColor

        setUp(with: items)

        NotificationCenter.default.addObserver(self, selector: #selector(refreshFonts), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    private func setUp(with items: [WhatsNewItem]) {
        stackView?.arrangedSubviews.forEach {
            if $0 is WhatsNewItemView {
                stackView?.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
        }
        items.forEach { item in
            let view: UIView
            switch item {
            case .image(let title, let subtitle, let image):
                let itemView = WhatsNewItemImageView.loadFromNib()
                if let imageTintColor = itemImageTintColor {
                    itemView.imageView.tintColor = imageTintColor
                }
                itemView.set(image: image, title: title, subtitle: subtitle, titleColor: itemTitleColor, subtitleColor: itemSubtitleColor, titleFont: itemTitleFont, subtitleFont: itemSubtitleFont)
                view = itemView
            case .text(let title, let subtitle):
                let itemView = WhatsNewItemTextView.loadFromNib()
                itemView.set(title: title, subtitle: subtitle, titleColor: itemTitleColor, subtitleColor: itemSubtitleColor, titleFont: itemTitleFont, subtitleFont: itemSubtitleFont)
                view = itemView
            }
            stackView?.addArrangedSubview(view)
        }
    }

    @objc private func refreshFonts() {
        if #available(iOS 10, *) {
            titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
            continueButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
            let fontDescriptor = UIFont.preferredFont(forTextStyle: .headline).fontDescriptor
            itemTitleFont = UIFont(descriptor: fontDescriptor, size: fontDescriptor.pointSize + 5)
            itemSubtitleFont = UIFont.preferredFont(forTextStyle: .body)
        }
    }

    @IBAction func `continue`() {
        WhatsNew.markCurrentVersionAsPresented()
        dismiss(animated: true, completion: onDismissal)
    }
}
