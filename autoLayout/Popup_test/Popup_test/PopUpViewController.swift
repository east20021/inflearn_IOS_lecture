//
//  PopUpViewController.swift
//  Popup_test
//
//  Created by lee on 2018. 1. 12..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popupImageView: UIImageView!
    @IBOutlet weak var popupImageHeight: NSLayoutConstraint!
    @IBOutlet weak var popupCenterY: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupCenterY.constant = 1000
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (popupImageView.image?.size.width)! / popupImageView.frame.size.width
        
        let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        popupImageHeight.constant = calcHeight
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        popupCenterY.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
