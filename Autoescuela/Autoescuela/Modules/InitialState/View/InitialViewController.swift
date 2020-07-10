//
//  InitialViewController.swift
//  Autoescuela
//
//  Created by user159106 on 6/14/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import AutoEscuelaComponents

class InitialViewController: UIViewController {
    
    @IBOutlet var loginButton: ActionButton!
    @IBOutlet var registerButton: ActionButton!
    
    var presenter: InitialViewControllerPresenterProtocol
    var model: InitialViewControllerViewModel
    
    init(presenter: InitialViewControllerPresenterProtocol) {
        self.presenter = presenter
        self.model = presenter.model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLoginButton()
        setUpRegisterButton()
    }
    
    func setupLoginButton() {
        loginButton.configure(title: model.loginButtonTitile, action: presenter.didTapLogin)
    }
    
    func setUpRegisterButton() {
        registerButton.configure(title: model.registerButtonTitle, action: presenter.didTapRegister)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension InitialViewController: InitialViewControllerViewProtocol {
    
}
