//
//  AppCoordinator.swift
//  Autoescuela
//
//  Created by user159106 on 6/6/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

public class AppCoordinator: Coordinator {
    
    public enum AppCoordinatorState {
        case initial
        case willShowLoginFlow
        case willShowMainMenuFlow
        case didShowLoginFlow
        case didShowMainMenuFlow
    }
    
    let navigationController: UINavigationController
    var currentState: AppCoordinatorState
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        case .willShowMainMenuFlow:
            goToMainMenuFlow()
        case .didShowMainMenuFlow , .didShowLoginFlow , .initial :
            fatalError("Unexpecrted cases")
        }
    }
    
    func next(_ state: AppCoordinatorState) -> AppCoordinatorState {
        switch state {
        case .initial:
            return .willShowLoginFlow
        case .didShowLoginFlow:
            return .willShowMainMenuFlow
        case .didShowMainMenuFlow:
            return .willShowLoginFlow
        case .willShowLoginFlow ,.willShowMainMenuFlow:
            return state
        }
    }
    
    func goToMainMenuFlow() {
        //WORK IN PROGRESS
    }
    
    func  goToLoginFlow() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBlue
        navigationController.pushViewController(vc, animated: false)
    }
}
