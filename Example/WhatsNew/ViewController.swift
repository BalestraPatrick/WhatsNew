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

        if WhatsNew.shouldPresent() {
            let whatsNew = WhatsNewViewController(items: [
                WhatsNewItem.image(title: "Nice Icons", subtitle: "Completely customize colors, texts and icons.", image: #imageLiteral(resourceName: "love")),
                WhatsNewItem.image(title: "Such Easy", subtitle: "Setting this up only takes 2 lines of code, impressive you say?", image: #imageLiteral(resourceName: "threed")),
                WhatsNewItem.image(title: "Very Sleep", subtitle: "It helps you get more sleep by writing less code.", image: #imageLiteral(resourceName: "night")),
                WhatsNewItem.text(title: "Text Only", subtitle: "No icons? Just go with plain text."),
                ])
            whatsNew.titleText = "What's New"
            whatsNew.itemSubtitleColor = .darkGray
            whatsNew.buttonText = "Continue"
            present(whatsNew, animated: true, completion: nil)
            //whatsNew.presentIfNeeded(on: self)
        }
    }

    @IBAction func clear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "LatestAppVersionPresented")
        UserDefaults.standard.synchronize()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            exit(0)
        }
    }
}
