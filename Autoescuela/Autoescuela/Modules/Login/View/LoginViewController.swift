//
//  LoginViewController.swift
//  Autoescuela
//
//  Created by Apostol, Alexandru on 08/03/2021.
//  Copyright © 2021 user159106. All rights reserved.
//

import UIKit
import AutoEscuelaComponents

class LoginViewController: UIViewController {
    
    var presenter: LoginViewPresenterProtocol
    var model: LoginViewModel
    
    lazy  var headerContainer: UIView = {
        let view = UIView(frame: .zero)
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        model.loginLogo.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(model.loginLogo)
        view.fill(view: stackView,edgeInset: UIEdgeInsets(top: -40, left: -100, bottom: -100, right: -100))
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleContainer)
        stackView.addArrangedSubview(inputContainer)
        stackView.addArrangedSubview(freeSpaceView)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    lazy var button: UIView = {
        let button = ActionButton(frame: .zero)
        button.configure(title: model.buttonTitle, action: nil)
        let view = UIView(frame: .zero)
        view.fill(view: button)
        return view
    }()
    
    lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(frame: .zero)
        titleLabel.configure(text: model.title)
        return titleLabel
    }()
    
    lazy var subtitleContainer: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = model.subtitle
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = model.emailTitle
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = model.passwordTitle
        return label
    }()
    
    lazy var emailInput : ListItemView = {
        let emailInput = ListItemView(frame: .zero)
        emailInput.configureLabel(text: nil, placeholder: model.emailPlaceHolder)
        return emailInput
    }()
    
    lazy var passwordInput : UIView = {
        let passwordInput = ListItemView(frame: .zero)
        passwordInput.configureLabel(text: nil, placeholder: model.passwordPlaceHolder, isSecure: true)
        let view = UIView(frame: .zero)
        return passwordInput
    }()
    
    let freeSpaceView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var inputContainer: UIView = {
        let view = UIView(frame: .zero)
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        let emailHeaderView = UIView(frame: .zero)
        emailHeaderView.fill(view: emailLabel, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: -16))
        let passwordHeaderView = UIView(frame: .zero)
        passwordHeaderView.fill(view: passwordLabel, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: -16))
        stackView.addArrangedSubview(emailHeaderView)
        stackView.addArrangedSubview(emailInput)
        stackView.addArrangedSubview(passwordHeaderView)
        stackView.addArrangedSubview(passwordInput)
        view.fill(view: stackView)
        return view
    }()
    
    lazy var titleContainer: UIView = {
        let view = UIView(frame: .zero)
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        let titleLabelContainer = UIView(frame: .zero)
        titleLabelContainer.fill(view: titleLabel,edgeInset: UIEdgeInsets(top: 0, left: -16, bottom: 0, right: -16))
        let subtitileLabelContainer = UIView(frame: .zero)
        subtitileLabelContainer.fill(view: subtitleContainer, edgeInset: UIEdgeInsets(top: 0, left: -16, bottom: 0, right: -16))
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(subtitileLabelContainer)
        view.fill(view: stackView)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerContainer)
        headerContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.height-48).isActive = true
        headerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    public init(presenter: LoginViewPresenterProtocol) {
        self.presenter = presenter
        self.model = presenter.model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
