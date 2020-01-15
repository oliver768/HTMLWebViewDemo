//
//  ViewController.swift
//  HTMLWebViewDemo
//
//  Created by Ravindra Sonkar on 15/05/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding webView content
        do {
            guard let filePath = Bundle.main.path(forResource: "EnglishConsent", ofType: "txt")
                else {
                    // File Error
                    print ("File reading error")
                    return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            //            let data = Data(contents.utf8)
            //            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            //                textView.attributedText = attributedString
            //            }
            let baseUrl = URL(fileURLWithPath: filePath)
            let window =  (UIApplication.shared.delegate as! AppDelegate).window
            webView.frame = CGRect(x: 0, y: 0, width: (window?.frame.width)! - 20, height: (window?.frame.width)! - 20)
            webView.loadHTMLString(contents as String, baseURL: baseUrl)
//            window?.addSubview(webView)
            
        }
        catch {
            print ("File HTML error")
        }
    }
}


