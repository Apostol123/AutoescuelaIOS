//
//  AppCoordinator.swift
//  Autoescuela
//
//  Created by user159106 on 6/6/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import FirebaseAuth

public class AppCoordinator: Coordinator {
    
    public enum AppCoordinatorState {
        case initial
        case willShowLoginFlow
        case willShowMainMenuFlow
        case willShowInitialFlow
        case didShowInitialFlow(InitialFlowOutput)
        case didShowLoginFlow
        case didShowMainMenuFlow
        case willShowRegisterFlow
        case didShowRegisterFlow
    }
    
    let navigator: UINavigationController
    var currentState: AppCoordinatorState
    var currentCoordintor: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigator = navigationController
        self.currentState = .initial
        
    }
    
    public func start() {
        currentState = .initial
        loop()
    }
    
    func loop() {
        currentState = next(currentState)
        switch currentState {
        case .willShowLoginFlow:
            goToLoginFlow()
        case .willShowInitialFlow:
            goToInitialFlow()
        case .willShowMainMenuFlow:
            goToMainMenuFlow()
        case .willShowRegisterFlow:
            goToRegisterFlow()
        case .didShowMainMenuFlow , .didShowLoginFlow , .initial, .didShowInitialFlow, .didShowRegisterFlow :
            fatalError("Unexpected cases")
        }
    }
    
    func next(_ state: AppCoordinatorState) -> AppCoordinatorState {
        switch state {
        case .initial:
            try! Auth.auth().signOut()
            if Auth.auth().currentUser != nil {
                return .willShowMainMenuFlow
            } else {
                return .willShowInitialFlow
            }
        case .didShowLoginFlow:
            return .willShowMainMenuFlow
        case .didShowInitialFlow(let output):
            switch output {
            case .login:
                return .willShowLoginFlow
            case .register:
                return .willShowRegisterFlow
            }
        case .didShowRegisterFlow:
            return .willShowMainMenuFlow
        case .didShowMainMenuFlow:
            return .initial
        case .willShowLoginFlow ,.willShowMainMenuFlow, .willShowInitialFlow, .willShowRegisterFlow:
            return state
        }
    }
    
    func goToLoginFlow() {
//        self.currentCoordintor = LoginCoordinator(navigator: navigator)
//        currentCoordintor?.start()
        let presenter = LoginViewPresenter()
        let viewController = LoginViewController(presenter: presenter)
       
        navigator.pushViewController(viewController, animated: true)
        
    }
    
    func goToRegisterFlow() {
        let viewController = RegisterViewBuilder(coordinatorOutput: { [weak self] result in
            switch result {
            
            case .goToMainMenu:
                self?.currentState = .didShowRegisterFlow
                self?.loop()
            }
            
        }).build()
        navigator.pushViewController(viewController, animated: true)
        
    }
    
    func goToMainMenuFlow() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navigator.pushViewController(vc, animated: true)
    }
    
    func  goToInitialFlow() {
        
        let view = InitialFlowBuilder(coordinatorOutput: { [weak self] oputput in
            switch oputput {
            case .login:
                self?.currentState = .willShowLoginFlow
                self?.loop()
            case .register:
                self?.currentState = .willShowRegisterFlow
                self?.loop()
            }
        }).build()

        view.modalPresentationStyle = .fullScreen
        navigator.pushViewController(view, animated: true)
    }
}
