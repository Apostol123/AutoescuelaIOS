//
//  RegisterViewPresenterProtocol.swift
//  Autoescuela
//
//  Created by user159106 on 8/5/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
import AutoEscuelaComponents

public protocol RegisterViewPresenterProtocol: class {
    var registerViewModel: RegisterViewModel { get }
    func checkPasswords(passwordListItem: [ListItemView]) -> Bool
    func login(name: String, surname: String, email: String, password: String)
    func submitButtonPressed(textFields: [ListItemView])
}
