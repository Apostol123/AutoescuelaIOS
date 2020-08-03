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
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(frame: .zero)
        titleLabel.configure(text: "Enter your data")
        return titleLabel
    }()
    
    lazy var titleLabelContainer: UIView = {
        let view = UIView(frame: .zero)
        view.fill(view: titleLabel, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: 16))
        return view
    }()
    
    lazy var nameListItem: ListItemView = {
        let nameListItem = ListItemView(frame: .zero)
        nameListItem.configureLabel(text: "", hint: "Name")
        return nameListItem
    }()
    
    lazy var surnameListItem: ListItemView = {
        let surnameListItem = ListItemView(frame: .zero)
        surnameListItem.configureLabel(text: "", hint: "Surname")
        return surnameListItem
    }()
    
    lazy var emailListItem: ListItemView = {
        let emailListitem = ListItemView(frame: .zero)
        emailListitem.configureLabel(text: "", hint: "Email")
        return emailListitem
    }()
    
    lazy var passwordListItem: ListItemView = {
        let passwordListItem = ListItemView(frame: .zero)
        passwordListItem.configureLabel(text: "", hint: "Password")
        return passwordListItem
    }()
    
    lazy var repeatpasswordListItem: ListItemView = {
        let repeatPasswordListItem = ListItemView(frame: .zero)
        repeatPasswordListItem.configureLabel(text: "", hint: "Repeat password")
        return repeatPasswordListItem
    }()
    
    lazy var submitButton: ActionButton = {
        let actionButton = ActionButton(frame: .zero)
        actionButton.configure(title: "Submit", action: nil)
        return actionButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        self.title = "Registrarse"
        
        
        configureStackView()
        configureLabels()
    }
        
        func configureStackView() {
            view.addSubview(mainStackView)
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.height + 40).isActive = true
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            mainStackView.addArrangedSubview(titleLabelContainer)
            mainStackView.addArrangedSubview(nameListItem)
            mainStackView.addArrangedSubview(surnameListItem)
            mainStackView.addArrangedSubview(emailListItem)
            mainStackView.addArrangedSubview(passwordListItem)
            mainStackView.addArrangedSubview(repeatpasswordListItem)
            mainStackView.addArrangedSubview(submitButton)
    }
    
    func configureLabels() {
        nameListItem.listItemText.addTarget(self, action: #selector(clearHint), for: .editingDidBegin)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func clearHint() {
        nameListItem.listItemText.customDelegate?.clearHint()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
