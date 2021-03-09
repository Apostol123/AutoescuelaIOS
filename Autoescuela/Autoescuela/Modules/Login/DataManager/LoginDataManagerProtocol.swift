//
//  LoginDataManagerProtocol.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 09/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Firebase

protocol LoginDataManagerProtocol: class {
    func signIn(email: String, password: String, completion: @escaping(Result<AuthDataResult,Error>) -> Void)
}
