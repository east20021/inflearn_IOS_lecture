//
//  ViewController.swift
//  ImageDownload
//
//  Created by lee on 2018. 1. 8..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//URLSessionDownloadDelegate
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    var downloadTask: URLSessionDownloadTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        
    }

//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        let tempProgress: Float = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
//        self.progressView.setProgress(tempProgress, animated: true)
//    }
//
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        let tempData: Data = try! Data(contentsOf: location)
//        self.imgView.image = UIImage(data: tempData)
//        indicator.stopAnimating()
//        indicator.isHidden = true
//    }


    @IBAction func downloadAction(_ sender: Any) {
        self.imgView.image = nil
        self.progressView.setProgress(0.0, animated: false)
        indicator.isHidden = false
        indicator.startAnimating()
        
        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        
//        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!, completionHandler: {(data, response, error) -> Void in
            self.imgView.image = UIImage(data: try! Data(contentsOf: data!))
            self.indicator.stopAnimating()
        })

        downloadTask.resume()
        
    }
    
    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
        self.progressView.setProgress(0.0, animated: false)
        indicator.stopAnimating()
    }
    
}

