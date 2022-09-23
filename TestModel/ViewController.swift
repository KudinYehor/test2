//
//  ViewController.swift
//  TestModel
//
//  Created by Yehor Kudin on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let mobileStorage = MobileStorage()
    
    let mobile1 = Mobile(imei: "123n", model: "12")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            try mobileStorage.save(mobile1)
            
        } catch {
            print(error)
        }
        
        print(mobileStorage.getAll())
        
        do {
            try mobileStorage.delete(mobile1)
            
        } catch {
            print(error)
        }
        
        print(mobileStorage.getAll())
    }
}

