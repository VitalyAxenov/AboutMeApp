//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Виталий Аксенов on 12.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginInputField: UITextField!
    @IBOutlet var passwordInputField: UITextField!
    
    private let trueLogin = "q"
    private let truePassword = "a"
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        let welcomeScreenVC = segue.destination as? WelcomeScreenVC
        welcomeScreenVC?.userName = loginInputField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        
        guard
            loginInputField.text != nil,
            loginInputField.text != ""
        else {
            credsAlert(wrong: .login)
            return false
        }
        
        guard
            passwordInputField.text != nil,
            passwordInputField.text != ""
        else {
            credsAlert(wrong: .password)
            return false
        }
        
        guard
            loginInputField.text == trueLogin,
            passwordInputField.text == truePassword
        else {
            credsAlert(wrong: .creds)
            return false
        }
        
        return true
    }
    
    
    @IBAction func fogotLogin() {
        promptAlert(remindMe: .login)
    }
    
    @IBAction func fogotPassword() {
        promptAlert(remindMe: .password)
    }
    
    
    @IBAction func userNameReturnKeyTapped() {
        print("return key tapped")
        passwordInputField.becomeFirstResponder()
    }
    
    @IBAction func passwordReturnKeyTapped() {
        print("PSWD return key tapped")
        self.view.endEditing(true)
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginInputField.text = ""
        passwordInputField.text = ""
    }
    
}

extension ViewController {
    
    // MARK: Prompts
    enum Prompt {
        case login
        case password
    }
    
    fileprivate func promptAlert(remindMe: Prompt) {
        
        let message: String
        
        switch remindMe {
        case .login:
            message = "Your User Name is: " + trueLogin
        case .password:
            message = "Your Password is: " + truePassword
        }
        
        let alert = UIAlertController(
            title: "Prompt",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default)
        )
        
        present(alert, animated: true)
    }
    
    
    // MARK: Alerts
    enum Alert {
        case login
        case password
        case creds
    }
    
    fileprivate func credsAlert(wrong: Alert) {
        
        let message: String
        let alertAction: UIAlertAction
        
        switch wrong {
        case .login:
            message = "Empty User Name"
            alertAction = UIAlertAction(
                title: "OK",
                style: .default
            )
        case .password:
            message = "Empty Password"
            alertAction = UIAlertAction(
                title: "OK",
                style: .default
            )
        case .creds:
            message = "Wrong User Name or Password"
            alertAction = UIAlertAction(
                title: "OK",
                style: .default
            ) { _ in
                self.passwordInputField.text = ""
            }
        }
        
        let alert = UIAlertController(
            title: "Wrong credentials",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
}

