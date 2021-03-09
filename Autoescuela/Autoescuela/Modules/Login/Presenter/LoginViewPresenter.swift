//
//  LoginViewPresenter.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Foundation

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
        buttonTitle: "Sign In")
    }()
}
