//
//  WebView.swift
//  Browser
//
//  Created by Даша Волошина on 25.10.22.
//

import UIKit
import WebKit
import SnapKit

class WebView: UIViewController {
    
    var webView = WKWebView()
    var buttonBack = UIButton()
    var buttonForward = UIButton()
    var buttonUptade = UIButton()
    var searhController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searhController
        view.backgroundColor = .white
        view.addSubview(webView)
        view.addSubview(buttonBack)
        view.addSubview(buttonForward)
        view.addSubview(buttonUptade)
        
        let url = URL(string: "http://www.google.com")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        createButton()
        createConstraintsWebView()
    }
    

    
    func createButton () {
        
        buttonBack.setTitle("Back", for: .normal)
        buttonBack.backgroundColor = .orange
        buttonBack.layer.cornerRadius = 10
        buttonBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        buttonBack.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).inset(20)
            make.bottom.equalTo(view.snp.bottom).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    
        buttonForward.setTitle("Forward", for: .normal)
        buttonForward.backgroundColor = .orange
        buttonForward.layer.cornerRadius = 10
        buttonForward.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        buttonForward.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).inset(140)
            make.bottom.equalTo(view.snp.bottom).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
            
        }
        
        buttonUptade.setTitle("Update", for: .normal)
        buttonUptade.backgroundColor = .orange
        buttonUptade.layer.cornerRadius = 10
        buttonUptade.addTarget(self, action: #selector(update), for: .touchUpInside)
        buttonUptade.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).inset(20)
            make.bottom.equalTo(view.snp.bottom).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
            
        }
        
    }
    
    func createConstraintsWebView() {
        webView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(buttonBack.snp.top)
            make.top.equalTo(view.snp.top)
        }
    }
    
    @objc func goBack(_ sender:UIButton){
        
        if   webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goForward(_ sender:UIButton){
        
        if  webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func update (_ sender:UIButton){
        webView.reload()
        
    }
}
