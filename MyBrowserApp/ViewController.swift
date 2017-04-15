//
//  ViewController.swift
//  MyBrowserApp
//
//  Created by Atsushi Sakai on 2017/04/15.
//  Copyright © 2017年 Atsushi Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTextView: UITextField!
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "http://dotinstall.com"
        //let urlString = ""
        self.loadUrl(urlString: urlString)
        
        
    }
    
    func getValidUrl(urlString: String) -> URL? {
        print(urlString)
        if URL(string: urlString) == nil {
            print("Invalid URL")
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

