//
//  ViewController.swift
//  webUPM
//
//  Created by Ronald Ajila on 19/01/2019.
//  Copyright © 2019 Ronald Ajila. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {

    @IBOutlet weak var _searchBar: UISearchBar!
    
    @IBOutlet weak var _webView: UIWebView!
    
    @IBAction func actionBack(_ sender: Any)
    {
        if _webView.canGoBack
        {
            _webView.goBack()
        }
    }
    
    @IBAction func actionNext(_ sender: Any)
    {
        if _webView.canGoForward
        {
            _webView.goForward()
        }
    }
    
    
    @IBAction func actionRefresh(_ sender: Any)
    {
        _webView.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        _searchBar.resignFirstResponder()
        
        if let _url = URL(string: _searchBar.text! )
        {
            _webView.loadRequest(URLRequest(url: _url))
        }else{
            print("Error!!!")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _webView.loadRequest(URLRequest(url: URL(string: "https://www.google.es")!))
    }

}
