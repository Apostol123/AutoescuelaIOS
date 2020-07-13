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
        case closeFlow
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
        case .closeFlow:
            closeFlow()
        case .didShowLoginFlow:
            fatalError("unexpectedCase")
        }
    }
    
    func next(state: State) -> State {
        switch state {
        case .initial:
            return .initial
        case .didShowLoginFlow:
            return .closeFlow
        case .closeFlow:
            fatalError("UnexpectedCase")
        }
    }
    
    func goToLogin() {
       print("ShouldGoToLogin")
    }
    
    func closeFlow() {
        
    }
}
