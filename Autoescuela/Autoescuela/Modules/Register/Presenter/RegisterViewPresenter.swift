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
    var dataManager: RegisterDataManagerProtocol
    var coordinatorOutput: (RegisterFlowOutput) -> Void
    
    init(dataManager: RegisterDataManagerProtocol, coordinatorOutput: @escaping(RegisterFlowOutput) -> Void) {
        self.dataManager = dataManager
        self.coordinatorOutput = coordinatorOutput
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
            passwordDontMachError: "Passwords dont match"
        )
    }
    
    func checkPasswords(passwordListItem: [ListItemView]) -> Bool {
        return passwordListItem[0].listItemText.text == passwordListItem[1].listItemText.text
    }
    
    func submitButtonPressed(textFields: [ListItemView]) {
        var passwordsTextField = [ListItemView]()
        var validationHelper = RegisterViewValidationHelper()
        for textField in textFields {
            if textField.isEmpty {
                textField.setUpIsError(errorText:registerViewModel.emptyFieldError)
                validationHelper.allFieldsAreFilled = false
            } else {
                textField.clearErrorLabel()
            }
            if textField.listItemText.tag == registerViewModel.passwordTag || textField.listItemText.tag == registerViewModel.repeatPasswordTag  {
                passwordsTextField.append(textField)
            }
        }
        
        if  !checkPasswords(passwordListItem: passwordsTextField) {
            validationHelper.passwordMatch = false
            view?.togglePasswordError(errorMessage: registerViewModel.passwordDontMachError)
        } else {
            view?.togglePasswordError(errorMessage: nil)
        }
        if validationHelper.isReadyToLogin {
            view?.login()
        }
    }
    
    func login(name: String, surname: String, email: String, password: String) {
        let user = AutoEscuelaUser(name: name, surname: surname, password: password, email: email)
        dataManager.addUser(user: user) { (result) in
            switch result {
            case .success(let user):
                self.coordinatorOutput(.goToMainMenu)
            case .failure(let error):
                self.view?.show(errorMessage: error.localizedDescription)
            }
        }
    }
   
}

struct RegisterViewValidationHelper {
    var allFieldsAreFilled = true
    var passwordMatch = true
    
    var isReadyToLogin: Bool {
        get {
            return allFieldsAreFilled && passwordMatch
        }
    }
}
