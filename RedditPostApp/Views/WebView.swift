//
//  WebView.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-12.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    let req : URLRequest
    let webView : WKWebView?
    
    init(req: URLRequest, webView: WKWebView?){
        
        self.req = req
        self.webView = WKWebView()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(req)
    
    }
    
    
    
    
    
    
}
