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
        titleLabel.configure(text: "Registrarse")
        return titleLabel
    }()
    
    lazy var titleLabelContainer: UIView = {
        let view = UIView(frame: .zero)
        view.fill(view: titleLabel, edgeInset: UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 16))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.fill(view: mainStackView)
        mainStackView.addArrangedSubview(titleLabelContainer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
