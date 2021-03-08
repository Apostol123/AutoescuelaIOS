//
//  RegisterViewController.swift
//  Autoescuela
//
//  Created by user159106 on 7/13/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import AutoEscuelaComponents

class RegisterViewController: UIViewController {
    
    let presenter: RegisterViewPresenterProtocol
    let model: RegisterViewModel
    var textFields = [ListItemView]()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(frame: .zero)
        titleLabel.configure(text: model.description)
        return titleLabel
    }()
    
    lazy var titleLabelContainer: UIView = {
        let view = UIView(frame: .zero)
        view.fill(view: titleLabel, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: 16))
        return view
    }()
    
    lazy var nameListItem: ListItemView = {
        let nameListItem = ListItemView(frame: .zero)
        nameListItem.configureLabel(text: nil, placeholder: model.nameListItemHint)
        return nameListItem
    }()
    
    lazy var surnameListItem: ListItemView = {
        let surnameListItem = ListItemView(frame: .zero)
        surnameListItem.configureLabel(text: nil, placeholder: model.surnameListItemHint)
        return surnameListItem
    }()
    
    lazy var emailListItem: ListItemView = {
        let emailListitem = ListItemView(frame: .zero)
        emailListitem.configureLabel(text: nil, placeholder: model.emailListItemHint)
        return emailListitem
    }()
    
    lazy var passwordListItem: ListItemView = {
        let passwordListItem = ListItemView(frame: .zero)
        passwordListItem.listItemText.tag = model.passwordTag
        passwordListItem.configureLabel(text: nil, placeholder: model.passwordListItemHint, isSecure: true)
        return passwordListItem
    }()
    
    lazy var repeatpasswordListItem: ListItemView = {
        let repeatPasswordListItem = ListItemView(frame: .zero)
        repeatPasswordListItem.listItemText.tag = model.repeatPasswordTag
        repeatPasswordListItem.configureLabel(text: nil, placeholder: model.repeatYourPasswordListItemHint, isSecure: true)
        return repeatPasswordListItem
    }()
    
    lazy var submitButton: ActionButton = {
        let actionButton = ActionButton(frame: .zero)
        actionButton.configure(title: model.buttonTitle, action: submitButtonPressed)
        actionButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return actionButton
    }()
    
    lazy var freeSpaceView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        self.title = "initialView.registerButton.title".localized
        textFields.append(nameListItem)
        textFields.append(surnameListItem)
        textFields.append(emailListItem)
        textFields.append(passwordListItem)
        textFields.append(repeatpasswordListItem)
        
        configureStackView()
    }
        
        func configureStackView() {
            view.addSubview(mainStackView)
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.height + 40).isActive = true
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38).isActive = true
            mainStackView.addArrangedSubview(titleLabelContainer)
            mainStackView.addArrangedSubview(nameListItem)
            mainStackView.addArrangedSubview(surnameListItem)
            mainStackView.addArrangedSubview(emailListItem)
            mainStackView.addArrangedSubview(passwordListItem)
            mainStackView.addArrangedSubview(repeatpasswordListItem)
            mainStackView.addArrangedSubview(freeSpaceView)
            mainStackView.addArrangedSubview(submitButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public init(presenter: RegisterViewPresenterProtocol) {
        self.presenter = presenter
        self.model = presenter.registerViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func submitButtonPressed() {
        var passwordsTextField = [ListItemView]()
        for textField in textFields {
            if textField.isEmpty {
                textField.setUpIsError(errorText: model.emptyFieldError)
            } else {
                textField.clearErrorLabel()
            }
            if textField.listItemText.tag == model.passwordTag || textField.listItemText.tag == model.repeatPasswordTag  {
                passwordsTextField.append(textField)
            }
        }
        
        if  !presenter.checkPasswords(passwordListItem: passwordsTextField) {
            passwordListItem.setUpIsError(errorText: model.passwordDontMachError)
        } else {
            passwordListItem.clearErrorLabel()
        }
    }
}

extension RegisterViewController: RegisterViewProtocol {}
