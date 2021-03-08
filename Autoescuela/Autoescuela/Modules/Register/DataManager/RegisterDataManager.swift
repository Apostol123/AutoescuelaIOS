//
//  RegisterDataManager.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Foundation

class RegisterDataManager: RegisterDataManagerProtocol {
    let firebaseHelper = FireBaseUserHelper()
    
    func addUser(user: AutoEscuelaUser, completion: @escaping (Result<AutoEscuelaUser, Error>) -> Void) {
        firebaseHelper.addUser(email: user.email, password: user.password) { (result) in
            switch result {
            case .success(_) :
                completion(.success(user))
            case .failure(let error) :
                completion(.failure(error))
            }
        }
    }
}
