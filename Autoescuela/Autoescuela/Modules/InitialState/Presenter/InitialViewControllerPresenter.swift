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
    
    init() {
    }
}

extension InitialViewControllerPresenter: InitialViewControllerPresenterProtocol {
    var model: InitialViewControllerViewModel {
        return InitialViewControllerViewModel(
            loginButtonTitile: "initialView.loginButton.title".localized,
            registerButtonTitle: "initialView.registerButton.title".localized)
    }
}
