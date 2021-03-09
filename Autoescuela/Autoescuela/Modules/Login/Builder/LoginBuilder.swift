//
//  LoginBuillder.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 09/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import UIKit

class LoginBuilder: Builder {
    
    var coordinatorOutput: (LoginViewOutput) -> Void
    
    init(coordinatorOutput: @escaping(LoginViewOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = LoginDataManger()
        let presenter = LoginViewPresenter(dataManager: dataManager, coordinatorOutput: coordinatorOutput)
        let viewController = LoginViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }

}
