//
//  DetailViewController.swift
//  CustomCell
//
//  Created by lee on 2018. 1. 7..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailData = [String: String]()

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var valueLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
        
        nameLable.text = detailData["name"]!
        amountLable.text = detailData["amount"]!
        valueLable.text = detailData["value"]!
        
        imgView.image = UIImage(named: detailData["image"]!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
