//
//  ViewController.swift
//  graph_Test
//
//  Created by lee on 2018. 1. 12..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph1height: NSLayoutConstraint!
    @IBOutlet weak var graph2height: NSLayoutConstraint!
    @IBOutlet weak var graph3height: NSLayoutConstraint!
    @IBOutlet weak var graph4height: NSLayoutConstraint!
    @IBOutlet weak var graph5height: NSLayoutConstraint!
    @IBOutlet weak var graph6height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func changeValue(_ sender: UIButton) {
        if sender.tag == 1 {
            graph1height = graph1height.changeMultiplier(changeMultiplier: 0.1)
            graph2height = graph2height.changeMultiplier(changeMultiplier: 0.3)
            graph3height = graph3height.changeMultiplier(changeMultiplier: 0.5)
            graph4height = graph4height.changeMultiplier(changeMultiplier: 0.7)
            graph5height = graph5height.changeMultiplier(changeMultiplier: 0.9)
            graph6height = graph6height.changeMultiplier(changeMultiplier: 1.0)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        } else if sender.tag == 2 {
            graph1height = graph1height.changeMultiplier(changeMultiplier: 1.0)
            graph2height = graph2height.changeMultiplier(changeMultiplier: 0.9)
            graph3height = graph3height.changeMultiplier(changeMultiplier: 0.7)
            graph4height = graph4height.changeMultiplier(changeMultiplier: 0.5)
            graph5height = graph5height.changeMultiplier(changeMultiplier: 0.3)
            graph6height = graph6height.changeMultiplier(changeMultiplier: 0.1)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                              attribute: self.firstAttribute,
                                              relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: changeMultiplier, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

