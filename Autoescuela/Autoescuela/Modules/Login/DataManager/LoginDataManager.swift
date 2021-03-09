//
//  DataManager.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 09/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Firebase

class LoginDataManger: LoginDataManagerProtocol {
    let fireBaseHelper = FireBaseUserHelper()
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        fireBaseHelper.signIn(email: email, password: password) { (result ) in
            switch result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
