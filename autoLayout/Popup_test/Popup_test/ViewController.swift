//
//  ViewController.swift
//  Popup_test
//
//  Created by lee on 2018. 1. 12..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let popupVC: PopUpViewController = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopUpViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false) { }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showPopUp(_ sender: Any) {
        let popupVC: PopUpViewController = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopUpViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false) { }
    }
    

}

