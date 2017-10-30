//
//  ViewController.swift
//  WhatsNew
//
//  Created by BalestraPatrick on 10/16/2017.
//  Copyright (c) 2017 BalestraPatrick. All rights reserved.
//

import UIKit
import WhatsNew

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let whatsNew = WhatsNewViewController(items: [
            WhatsNewItem.text(title: "Hello", subtitle: "There are many new features."),
            WhatsNewItem.image(title: "Hello", subtitle: "There are many new features.", image: #imageLiteral(resourceName: "love")),
            WhatsNewItem.image(title: "Hello", subtitle: "There are many new features.", image: #imageLiteral(resourceName: "threed"))
        ])
        whatsNew.presentIfNeeded(on: self)
    }
}
