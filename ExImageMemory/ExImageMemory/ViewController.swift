//
//  ViewController.swift
//  ExImageMemory
//
//  Created by 김종권 on 2023/12/10.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        drawImageV2()
    }
    
    func drawImageV1() {
        let bounds = CGRect(x: 0, y: 0, width: 300, height: 100)
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        
        /// drawing 코드 start
        UIColor.black.setFill()
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: UIRectCorner.allCorners,
            cornerRadii: CGSize(width: 20, height: 20)
        )
        path.addClip()
        UIRectFill(bounds)
        /// drawing 코드 end
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = image
    }
    
    func drawImageV2() {
        let bounds = CGRect(x: 0, y: 0, width: 300, height: 100)
        let renderer = UIGraphicsImageRenderer(size: bounds.size) /// <-
        
        /// drawing 코드
        let image = renderer.image { context in
            UIColor.black.setFill()
            let path = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: UIRectCorner.allCorners,
                cornerRadii: CGSize(width: 20, height: 20)
            )
            path.addClip()
            UIRectFill(bounds)
        }
        
        imageView.image = image
        imageView.tintColor = .black // <-
    }
}
