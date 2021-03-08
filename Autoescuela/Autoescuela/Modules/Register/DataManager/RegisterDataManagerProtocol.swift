//
//  RegisterDataManagerProtocol.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Foundation

protocol RegisterDataManagerProtocol {
    func addUser(user: AutoEscuelaUser, completion: @escaping(Result<AutoEscuelaUser,Error>) -> Void)
}
