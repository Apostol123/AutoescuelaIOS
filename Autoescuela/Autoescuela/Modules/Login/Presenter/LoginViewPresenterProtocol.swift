//
//  LoginViewPresenterProtocol.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import AutoEscuelaComponents

protocol LoginViewPresenterProtocol {
    var model: LoginViewModel {
        get
    }
    
    func submitPressed(inputs: [ListItemView])
}
