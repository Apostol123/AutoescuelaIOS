//
//  LoginBuilder.swift
//  Autoescuela
//
//  Created by user159106 on 6/14/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation

class LoginBuilder: Builder {
    
    init() {
        
    }
    
    func build() -> ViewController {
        let view = LoginViewController()
        return view
    }
}
