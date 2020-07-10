//
//  LoginBuilder.swift
//  Autoescuela
//
//  Created by user159106 on 6/14/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

class InitialViewControllerBuilder: Builder {
    
    var coordinatorOutput: (InitialFlowOutput) -> Void
    
    init(coordinatorOutput: @escaping(InitialFlowOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let presenter = InitialViewControllerPresenter(coordinatorOutput: coordinatorOutput)
        let view = InitialViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
