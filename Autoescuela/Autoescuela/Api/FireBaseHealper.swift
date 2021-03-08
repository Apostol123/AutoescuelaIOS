//
//  FireBaseHealper.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Foundation
import FirebaseAuth

public class FireBaseUserHelper {
   
     func getUser () -> User? {
        return  Auth.auth().currentUser
    }
    
    func addUser(email: String, password: String, completion: @escaping(Result<User,Error>) -> Void ) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
}
