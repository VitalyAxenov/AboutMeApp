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
    
    
    
    @IBAction func fogotLogin() {
        promptAlert(remindMe: .login)
    }
    
    @IBAction func fogotPassword() {
        promptAlert(remindMe: .password)
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginInputField.text = ""
        passwordInputField.text = ""
    }
    
}

extension ViewController {
    
    
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
}

