//
//  DummyViewController.swift
//  Bankey
//
//  Created by Juan Arbelaez on 21/01/25.
//

import UIKit

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logOutButton = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.configuration = .filled()
        logOutButton.setTitle("Log Out", for: [])
        logOutButton.addTarget(self, action: #selector(logOutTapped), for: .primaryActionTriggered)
    }
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logOutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func logOutTapped(sender: UIButton){
        logoutDelegate?.didLogout()
    }
}
