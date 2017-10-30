//
//  NibLoadable.swift
//  WhatsNew
//
//  Created by Patrick Balestra on 10/21/17.
//

import Foundation

protocol NibLoadable: class { }

extension NibLoadable where Self: UIView {

    static func loadFromNib(owner: Self = Self()) -> Self {
        let layoutAttributes: [NSLayoutAttribute] = [.top, .leading, .bottom, .trailing]
        for view in UINib(nibName: String(describing: self), bundle: Bundle(for: self)).instantiate(withOwner: owner, options: nil) {
            if let view = view as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
                owner.addSubview(view)
                layoutAttributes.forEach {
                    owner.addConstraint(NSLayoutConstraint(item: view, attribute: $0, relatedBy: .equal, toItem: owner, attribute: $0, multiplier: 1, constant: 0.0))
                }
            }
        }
        return owner
    }
}
