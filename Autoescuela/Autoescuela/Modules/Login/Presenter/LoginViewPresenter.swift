//
//  LoginViewPresenter.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import AutoEscuelaComponents

class LoginViewPresenter: LoginViewPresenterProtocol {
    var model: LoginViewModel = {
       return LoginViewModel(
        imageTitle: "Manage your Buisness",
        title: "Sign In",
        subtitle: "Hi there nice to see you again",
        emailTitle: "Email",
        emailPlaceHolder: "Enter Your Email",
        passwordTitle: "Password",
        passwordPlaceHolder: "Enter Your Password",
        buttonTitle: "Sign In",
        emptyFieldError: "Field is Empty"
       )
    }()

    let dataManager: LoginDataManagerProtocol
    weak var view: LoginViewProtocol?
    var coordinatorOutput: (LoginViewOutput) -> Void
    
    init(dataManager: LoginDataManagerProtocol, coordinatorOutput: @escaping(LoginViewOutput) -> Void) {
        self.dataManager = dataManager
        self.coordinatorOutput = coordinatorOutput
    }
    
    func submitPressed(inputs: [ListItemView]) {
        var validationHelper = SignInValidationHelper()
        
        for input in inputs {
            if input.isEmpty {
                input.setUpIsError(errorText: model.emptyFieldError )
                validationHelper.emailIsNotEmpty = false
            } else if !input.isEmpty{
                input.clearErrorLabel()
            }
        }
        if validationHelper.isReadyToSignIn {
            dataManager.signIn(email: inputs[0].listItemText.text!, password: inputs[1].listItemText.text!) { (result) in
                switch result {
                case .success(_):
                    self.coordinatorOutput(.mainMenu)
                case .failure(let error):
                    self.view?.show(errorMessage: error.localizedDescription)
                }
            }
        }
    }
}

struct SignInValidationHelper {
   var passwordIsNotEmpty = true
   var emailIsNotEmpty = true
    
    var isReadyToSignIn: Bool {
        get {
            return passwordIsNotEmpty  && emailIsNotEmpty
        }
    }
}
