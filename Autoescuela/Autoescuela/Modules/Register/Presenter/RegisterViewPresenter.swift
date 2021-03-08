//
//  RegisterViewPresenter.swift
//  Autoescuela
//
//  Created by user159106 on 8/5/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
import AutoEscuelaComponents

class  RegisterViewPresenter: RegisterViewPresenterProtocol {

    weak var view: RegisterViewProtocol?
    
    init() {
    }
    
    var registerViewModel: RegisterViewModel {
        return RegisterViewModel (
            title: "initialView.registerButton.title".localized,
            description: "registerView.titleLabel".localized,
            buttonTitle: "registerView.button.title".localized,
            nameListItemHint: "registerView.nameListItem.hint".localized,
            surnameListItemHint: "registerView.surnameListItem.hint".localized,
            emailListItemHint: "registerView.emailListItem.hint".localized,
            passwordListItemHint: "registerView.passwordListItem.hint".localized,
            repeatYourPasswordListItemHint: "registerView.repeatPasswordListItem.hint".localized,
            passwordTag: 1000,
            repeatPasswordTag: 2000,
            emptyFieldError: "Field is empty",
            passwordDontMachError: "Password dont match"
        )
    }
    
    func checkPasswords(passwordListItem: [ListItemView]) -> Bool {
        return passwordListItem[0].listItemText.text == passwordListItem[1].listItemText.text
    }
   
}
