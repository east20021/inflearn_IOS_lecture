//
//  ViewController.swift
//  FlightBooking
//
//  Created by lee on 2018. 1. 4..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectDatePicker: UIDatePicker!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var departureDateButton: UIButton!
    
    var buttonTag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectDatePicker.isHidden = true
        self.view.endEditing(true)
    }

    @IBAction func showDatePickerAction(_ sender: Any) {
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else{
            selectDatePicker.isHidden = false
        }
        
        buttonTag = (sender as! UIButton).tag
    }
    
    @IBAction func selectedDateAction(_ sender: Any) {
        let fommatter = DateFormatter()
        fommatter.dateFormat = "YY-MM-d hh:mma"
        //let dateString = fommatter.string(from: selectDatePicker.date)
        let dateString = fommatter.string(from: (sender as! UIDatePicker).date)
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: .normal)
        } else {
            returnDateButton.setTitle(dateString, for: .normal)
        }
        
        
    }
    
    @IBAction func showReturnDateAction(_ sender: Any) {
//        if (sender as! UISwitch).isOn {
//            returnDateLabel.isHidden = false
//            returnDateButton.isHidden = false
//        } else {
//            returnDateLabel.isHidden = true
//            returnDateButton.isHidden = true
//        }
        
        returnDateButton.isHidden = !(sender as! UISwitch).isOn
        returnDateLabel.isHidden = !(sender as! UISwitch).isOn
        
    }
    
}

