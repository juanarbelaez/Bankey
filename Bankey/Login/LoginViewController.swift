//
//  ViewController.swift
//  Bankey
//
//  Created by Juan Arbelaez on 17/01/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}




extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Bankey"
        titleLabel.font = .boldSystemFont(ofSize: 40)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .systemFont(ofSize: 24)
        
    }
    
    private func layout(){
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // LoginView Constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // SignInButton Constraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
        
        // ErrorMessageLabel Constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorMessageLabel.widthAnchor.constraint(equalTo: signInButton.widthAnchor)
        ])
        
        //TitleLabel Constraints
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
        
        //subtitleLabel Constraints
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
    
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Juan" || password == "1234" {
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
            
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


