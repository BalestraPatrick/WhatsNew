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
            WhatsNewItem.image(title: "Nice Icons", subtitle: "Completely customize colors, texts and icons.", image: #imageLiteral(resourceName: "love")),
            WhatsNewItem.image(title: "Such Simplicity", subtitle: "Setting up this view only takes 2 lines of code, impressive you say?", image: #imageLiteral(resourceName: "threed")),
            WhatsNewItem.image(title: "Very Sleep", subtitle: "WhatsNew helps you get more sleep by writing less code.", image: #imageLiteral(resourceName: "night")),
            WhatsNewItem.text(title: "Text Only", subtitle: "No icons? Just go with plain text."),
        ])
        whatsNew.presentIfNeeded(on: self)
    }
}
