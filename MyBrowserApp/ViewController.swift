//
//  ViewController.swift
//  MyBrowserApp
//
//  Created by Atsushi Sakai on 2017/04/15.
//  Copyright © 2017年 Atsushi Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var urlTextView: UITextField!
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var browserActiveIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.browserView.delegate = self
        self.browserActiveIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let urlString = "http://dotinstall.com"
        //let urlString = ""
        self.loadUrl(urlString: urlString)
        self.addBorder()
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.browserActiveIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let urlString = self.browserView.request?.url?.absoluteString{
            self.urlTextView.text = urlString
        }
        self.browserActiveIndicator.stopAnimating()
    }
    
    func addBorder(){
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.browserView.frame.size.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.browserView.layer.addSublayer(topBorder)
    }
    
    func showAlert(_ message: String){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func getValidUrl(urlString: String) -> URL? {
        print(urlString)
        if URL(string: urlString) == nil {
            //print("Invalid URL")
            self.showAlert("Invalid URL")
            
            return nil
        }
        print("OK")
        return URL(string: urlString)
    }
    
    func loadUrl(urlString: String){
        if let url = self.getValidUrl(urlString: urlString){
            let urlRequest = URLRequest(url: url)
            self.browserView.loadRequest(urlRequest)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: Any) {
    }

    @IBAction func goForward(_ sender: Any) {
    }

    @IBAction func reload(_ sender: Any) {
    }
    

}

