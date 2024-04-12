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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeScreenVC = segue.destination as? WelcomeScreenVC
        welcomeScreenVC?.userName = loginInputField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    
}

