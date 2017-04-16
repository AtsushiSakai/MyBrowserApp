//
//  ViewController.swift
//  MyBrowserApp
//
//  Created by Atsushi Sakai on 2017/04/15.
//  Copyright © 2017年 Atsushi Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var urlTextView: UITextField!
    @IBOutlet weak var browserView: UIWebView!
    
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    @IBOutlet weak var browserActiveIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.browserView.delegate = self
        self.urlTextView.delegate = self
        self.browserActiveIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let urlString = "http://dotinstall.com"
        //let urlString = ""
        self.loadUrl(urlString: urlString)
        self.addBorder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("aa")
        
        if textField != self.urlTextView {
            return true
        }
        
        if let urlString = textField.text {
            self.loadUrl(urlString: urlString)
        }
        
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.browserActiveIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let urlString = self.browserView.request?.url?.absoluteString{
            self.urlTextView.text = urlString
        }
        self.browserActiveIndicator.stopAnimating()
        
        self.backButton.isEnabled = self.browserView.canGoBack
        self.forwardButton.isEnabled = self.browserView.canGoForward
        
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
        print("goback")
        self.browserView.goBack()
    }
    

    @IBAction func goForward(_ sender: Any) {
        print("goForward")
        self.browserView.goForward()
    }

    @IBAction func reload(_ sender: Any) {
        print("reload")
        self.browserView.reload()
    }
    

}

