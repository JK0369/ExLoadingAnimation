//
//  ViewController.swift
//  ExButtonAction
//
//  Created by 김종권 on 2023/10/01.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = {
            let button = UIButton()
            button.setTitle("button", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitleColor(.blue, for: .highlighted)
//            button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
            
            button.addAction(
                UIAction { _ in
                    print("tap button!")
                },
                for: .touchUpInside
            )
            
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc
    private func handleTap() {
        print("tap button!")
    }
}
