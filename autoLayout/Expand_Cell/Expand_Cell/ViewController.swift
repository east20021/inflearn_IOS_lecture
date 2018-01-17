//
//  ViewController.swift
//  Expand_Cell
//
//  Created by lee on 2018. 1. 17..
//  Copyright © 2018년 smith. All rights reserved.
//
//ctrl + i 자동 간격 맞춤


import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    
}

class ViewController: UIViewController {
    
    var textDataArray: NSArray = ["short Text",
                                  "long long long long long long text",
                                  "long long long long long long long long long long long long long long long long long long long long long longlong long long long long long long long long long long longlong long long long long long long long long long long long text"]
    
    var heightArray: NSMutableArray = []
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //자동 높이 조절
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0...15 {
            heightArray.add(false)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
        cell.myLabel.text = textDataArray[indexPath.row % textDataArray.count] as? String
        
        //라인 수 컨트롤
        if heightArray[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        } else {
            cell.myLabel.numberOfLines = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if heightArray[indexPath.row] as! Bool == false {
            heightArray.replaceObject(at: indexPath.row, with: true)
        } else {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    //자동 높이 조절
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
