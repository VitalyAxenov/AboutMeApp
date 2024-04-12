//
//  WelcomeScreenVC.swift
//  AboutMeApp
//
//  Created by Виталий Аксенов on 12.04.2024.
//

import UIKit

class WelcomeScreenVC: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Привет, " + userName + "!"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
