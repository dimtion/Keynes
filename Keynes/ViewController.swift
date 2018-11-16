//
//  ViewController.swift
//  Keynes
//
//  Created by Loïc Carr on 16/11/2018.
//  Copyright © 2018 dimtion. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let myURL = URL(string:"https://www.economist.com")
        let myRequest = URLRequest(url: myURL!)
        
        let blockRules = """
         [{
             "trigger": {
                 "url-filter": "doubleclick.net"
             },
             "action": {
                 "type": "block"
             }
         },
         {
             "trigger": {
                 "url-filter": "adsense"
             },
             "action": {
                 "type": "block"
             }
         },
         {
             "trigger": {
                 "url-filter": "google.*.com/"
             },
             "action": {
                 "type": "block"
             }
         },
         {
             "trigger": {
                 "url-filter": "amazon-adsystem.com/"
             },
             "action": {
                 "type": "block"
             }
         },
         {
             "trigger": {
                 "url-filter": ".*"
             },
             "action": {
                 "type": "css-display-none",
                 "selector": ".ad-panel__container, .ad-panel__container--styled, .ad-panel__googlead, .classified-ads, .fe-blogs__top-ad-wrapper, .fe-blogs__top-ad, .fe-blogs__sidebar-ad-wrapper"
             }
         }]
      """

        let scriptContent = """
        var elements = document.getElementsByClassName("sticky-scroller");
        elements[0].classList.remove("sticky-scroller");
        """
        let script = WKUserScript(source: scriptContent, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        WKContentRuleListStore.default().compileContentRuleList(
            forIdentifier: "ContentBlockingRules",
            encodedContentRuleList: blockRules) {(contentRuleList, error) in
                
                if let error = error {
                    // TODO: print error
                    return
                }
                self.webView.configuration.userContentController.addUserScript(script)
                self.webView.configuration.userContentController.add(contentRuleList!)
        }
        webView.allowsBackForwardNavigationGestures = true
        webView.load(myRequest)
    }
}

