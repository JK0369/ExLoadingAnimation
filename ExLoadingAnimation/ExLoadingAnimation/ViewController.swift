//
//  ViewController.swift
//  ExLoadingAnimation
//
//  Created by 김종권 on 2023/12/28.
//

import UIKit

class ViewController: UIViewController {
    
    var loadingView: LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView = LoadingView()
        loadingView.center = view.center
        view.addSubview(loadingView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loadingView.stopAnimating()
    }
}

final class LoadingView: UIView {
    init() {
        super.init(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        backgroundColor = superview?.backgroundColor
        setupLoader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLoader()
    }
    
    private func setupLoader() {
        /// 원형 모양의 경로 생성
        let circularPath = UIBezierPath(ovalIn: bounds.insetBy(dx: 10, dy: 10))
        
        let shapeLayer = {
            let l = CAShapeLayer()
            l.path = circularPath.cgPath
            l.fillColor = UIColor.clear.cgColor
            l.strokeColor = UIColor.blue.cgColor
            l.lineWidth = 5
            l.strokeEnd = 1
            return l
        }()
        
        // 0~1값을 주어 채워지는 시작점을 20%로 설정
        shapeLayer.strokeStart = 0.2
        
        layer.addSublayer(shapeLayer)
    }
    
    func startAnimating() {
        // 회전 애니메이션
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.byValue = 2 * Double.pi
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.duration = 1
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func stopAnimating() {
        layer.removeAllAnimations()
    }
}
