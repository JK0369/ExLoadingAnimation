//
//  ViewController.swift
//  ExTypeInit
//
//  Created by 김종권 on 2023/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
printByPassInstance(a: BaseA())
printByPassInstance(a: SubA())
        
printByPassType(type: BaseA.self)
printByPassType(type: SubA.self)
    }
    
    
    func printByPassInstance(a: BaseA) {
        print(a.value)
    }
    
func printByPassType(type: BaseA.Type) {
    let instance = type.init()
    print(instance.value)
}
}

class BaseA {
    var value: String {
        "BaseA"
    }
    
    required init() {
    }
}

class SubA: BaseA {
    override var value: String {
        "SubA"
    }
    
    required init() {
        super.init()
    }
}
