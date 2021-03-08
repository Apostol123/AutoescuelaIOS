//
//  RegisterViewBuilder.swift
//  Autoescuela
//
//  Created by user159106 on 8/5/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

public class RegisterViewBuilder: Builder {
    
    var coordinatorOutput: (RegisterFlowOutput) -> Void
    
    init(coordinatorOutput: @escaping(RegisterFlowOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = RegisterDataManager()
        let presenter = RegisterViewPresenter(dataManager: dataManager, coordinatorOutput: coordinatorOutput)
        let view = RegisterViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
