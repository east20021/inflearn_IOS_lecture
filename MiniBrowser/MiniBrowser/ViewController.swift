//
//  ViewController.swift
//  MiniBrowser
//
//  Created by lee on 2018. 1. 3..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var bookMarkSegmentControl: UISegmentedControl!
    @IBOutlet weak var mainWebView: UIWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let googleUrl = "https://www.google.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: googleUrl )!))
        urlTextField.text = googleUrl
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        urlTextField.text = urlString
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        return true
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkUrl = bookMarkSegmentControl.titleForSegment(at: bookMarkSegmentControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkUrl!).com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString )!))
        urlTextField.text = urlString
        
    }
    
}

