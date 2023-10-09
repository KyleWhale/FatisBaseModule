//
//  HTClassWebVC.swift
//  ProjectSwift
//
//  Created by wmz on 2023/6/10.
//

import UIKit
import WebKit

class HTClassWebVC: HTClassBaseVC {
    override func ht_setupViews() {
        var_webViewConfiguration.dataDetectorTypes = .phoneNumber
        userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
        view.addSubview(var_webView)
        var_webView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    var var_url:String?
    var var_webViewConfiguration: WKWebViewConfiguration = WKWebViewConfiguration()
    var var_webViewKeyValueObservations: [AnyKeyPath: NSKeyValueObservation] = [:]
    lazy var var_webView: WKWebView = {
        let var_webView =   WKWebView(frame: .zero, configuration: self.var_webViewConfiguration)
        var_webView.allowsBackForwardNavigationGestures = true
        var_webView.navigationDelegate = self
        var_webView.uiDelegate = self
        var_webViewKeyValueObservations[\WKWebView.title] = var_webView.observe(\.title, options: .new) { webView, _ in
            self.title = webView.title
        }
        return var_webView
    }()
    
    override func ht_getNewData() {
        if let var_url = var_url {
            let var_mURL = URL(string: var_url)
            if let var_mURL = var_mURL {
                let var_request = URLRequest(url: var_mURL)
                self.var_webView.load(var_request)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userActivity?.becomeCurrent()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userActivity?.invalidate()
    }
}

extension HTClassWebVC: WKNavigationDelegate {

    open func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webView.scrollView.refreshControl?.endRefreshing()
    }

    open func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.scrollView.refreshControl?.endRefreshing()
    }

    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.scrollView.refreshControl?.endRefreshing()
    }

    open func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }

    open func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
}

extension HTClassWebVC: WKUIDelegate {

    open func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return nil
    }

    open func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
    }

    open func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
    }

    open func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
    }

    open func webViewDidClose(_ webView: WKWebView) {

    }
}
