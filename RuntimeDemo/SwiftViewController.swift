//
//  SwiftViewController.swift
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/4/11.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myBlock = {
            
            (a:Int, b:Int) -> Int in
            return a*a*a + b*b*b
            
        }
        
        myBlock(3,3)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
