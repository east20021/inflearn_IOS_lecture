//
//  ViewController.swift
//  Email_List_Lecture
//
//  Created by lee on 2018. 1. 17..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var contentsTitle: UILabel!
}

class ViewController: UIViewController {

    @IBOutlet weak var emailTableView: UITableView!
    
    var emailData: NSMutableArray = ["title", "long title", "long long long long long long long long long long long long title"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as! MyCell
        
        cell.contentsTitle.text = emailData[indexPath.row % emailData.count] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
