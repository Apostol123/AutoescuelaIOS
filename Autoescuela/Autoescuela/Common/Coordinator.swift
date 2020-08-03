//
//  Coordinator.swift
//  Autoescuela
//
//  Created by user159106 on 6/6/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

public protocol Coordinator {
    func start()
}


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
