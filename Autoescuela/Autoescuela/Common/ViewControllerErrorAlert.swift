//
//  ViewControllerErrorAlert.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import UIKit

protocol ViewControllerErrorAlert: class {
    func show(errorMessage: String)
}

extension ViewControllerErrorAlert where Self: UIViewController {
    func show(errorMessage: String) {
        let alertController = UIAlertController(title: "Validation Error", message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
