//
//  ViewController.swift
//  ExOrientation
//
//  Created by 김종권 on 2023/11/06.
//

import UIKit
import ImageIO

class ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let imageView1 = {
        let view = UIImageView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView1)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        if let image = UIImage(named: "IMG_2467.JPG") {
            printAngle(image)
            imageView1.image = image
            
            let removedOrientationImage = removedOrientationImage(image)
            printAngle(removedOrientationImage)
            imageView1.image = removedOrientationImage
            
            /*
             right
             up
             */
        }
    }
    
    func removedOrientationImage(_ image: UIImage) -> UIImage {
        if image.imageOrientation == .up {
            return image
        }

        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: image.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return normalizedImage ?? image
    }
    
    func printAngle(_ image: UIImage) {
        switch image.imageOrientation {
        case .up:
            print("up")
        case .upMirrored:
            print("upMirrored")
        case .right:
            print("right")
        case .rightMirrored:
            print("rightMirrored")
        case .down:
            print("down")
        case .downMirrored:
            print("downMirrored")
        case .left:
            print("left")
        case .leftMirrored:
            print("leftMirrored")
        default:
            print("unknown")
        }
    }
}
