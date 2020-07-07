//
//  LoginCoordinator.swift
//  Autoescuela
//
//  Created by user159106 on 6/14/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginCoordinator: Coordinator {
    
    enum State {
        case initial
        case didShowLoginFlow
        case willShowRegisterFlow
        case didShowRegisterFlow
        case willShowMainMenuFlow
    }
    
    let navigator: UINavigationController
    var currentState: State
    
    public init(navigator: UINavigationController) {
        self.navigator = navigator
        self.currentState = .initial
    }
    
    func start() {
        currentState = .initial
        loop()
    }
    
    func loop() {
        currentState = next(state: currentState)
        
        switch currentState {
        case .initial:
            goToLogin()
        case .didShowLoginFlow:
            goToMainMenu()
        case .didShowRegisterFlow:
            goToMainMenu()
        case .willShowRegisterFlow , .willShowMainMenuFlow:
        fatalError("UnexptedCases")
        }
    }
    
    func next(state: State) -> State {
        switch state {
        case .initial:
            return .initial
        case .didShowLoginFlow:
            return .willShowMainMenuFlow
        case .didShowRegisterFlow:
            return .willShowMainMenuFlow
        case .willShowRegisterFlow, .willShowMainMenuFlow:
            return .initial
        }
    }
    
    
    func goToLogin() {
        let view = LoginViewController()
        let navigationController = UINavigationController(rootViewController: view)
        navigator.pushViewController(view, animated: true)
    }
    
    func goToMainMenu() {
        
    }
}
