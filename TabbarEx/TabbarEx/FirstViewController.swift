//
//  FirstViewController.swift
//  TabbarEx
//
//  Created by lee on 2018. 1. 7..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        resultLabel.text = "1번 눌림"
    }

}
