//
//  JoinViewController.swift
//  Week7
//
//  Created by 김초원 on 2022/11/07.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func joinBtnDidTap(_ sender: Any) {
        UserDefaults.standard.set(passwordTextField.text!, forKey: nameTextField.text!)
        dismiss(animated: true)
    }
    
    
    
    @IBAction func cancelBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}
