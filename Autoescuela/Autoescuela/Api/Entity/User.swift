//
//  User.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import Foundation

struct AutoEscuelaUser: Codable {
    var id = UUID.init().uuidString
    var name: String
    var surname: String
    var password: String
    var email: String
}
