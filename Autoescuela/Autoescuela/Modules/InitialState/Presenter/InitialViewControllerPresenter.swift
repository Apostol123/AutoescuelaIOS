//
//  InitialViewControllerPresenter.swift
//  Autoescuela
//
//  Created by user159106 on 7/9/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation

class InitialViewControllerPresenter {
    weak var view: InitialViewControllerViewProtocol?
    var coordinatorOutput: (InitialFlowOutput) -> Void
    
    init(coordinatorOutput: @escaping(InitialFlowOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
}

extension InitialViewControllerPresenter: InitialViewControllerPresenterProtocol {
    func didTapLogin() {
        coordinatorOutput(.login)
    }
    
    func didTapRegister() {
        coordinatorOutput(.register)
    }
    
    var model: InitialViewControllerViewModel {
        return InitialViewControllerViewModel(
            loginButtonTitile: "initialView.loginButton.title".localized,
            registerButtonTitle: "initialView.registerButton.title".localized)
    }
}
