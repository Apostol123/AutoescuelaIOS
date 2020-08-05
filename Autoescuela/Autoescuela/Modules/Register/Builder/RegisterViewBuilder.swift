//
//  RegisterViewBuilder.swift
//  Autoescuela
//
//  Created by user159106 on 8/5/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

public class RegisterViewBuilder: Builder {
    
    func build() -> UIViewController {
        let presenter = RegisterViewPresenter()
        let view = RegisterViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
