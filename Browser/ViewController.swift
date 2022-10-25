//
//  ViewController.swift
//  Browser
//
//  Created by Даша Волошина on 25.10.22.
//ДЗ: Сделать браузер с базовым фунционалом - вперед, назад, обновить и ввести урл(использовать UISearchBar)(можно посмотреть на NavigationController с SearchBar)

import UIKit
import SnapKit

class ViewController: UIViewController {
    
 let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(button)
        button.setTitle("Go to Browser", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        createConstraintsButtons ()
    }

    func createConstraintsButtons () {
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.left.equalToSuperview().inset(100)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    @objc func buttonTapped(_ sender:UIButton){
        var webVC = WebView()
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
}

