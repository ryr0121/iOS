//
//  ViewController.swift
//  Week7
//
//  Created by 김초원 on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginBtnDidTap(_ sender: Any) {
        guard let inputName = nameTextField.text else { return }
        guard let inputPW = passwordTextField.text else { return }
        
        // 1. 유효한 이름 & 없는 비밀번호 -> 회원가입 X
        if UserDefaults.standard.object(forKey: inputName) == nil {
            print("회원가입이 안된 이름입니다.")
        }
        // 2. 유효한 이름 & 틀린 비밀번호
        else if UserDefaults.standard.object(forKey: inputName) as! String != inputPW {
            print("비밀번호가 틀렸습니다.")
        }
        // 유효한 이름 & 맞는 비밀번호 -> 로그인 성공
        else if UserDefaults.standard.object(forKey: inputName) as! String == inputPW {
            print("로그인이 성공했습니다.")
        }
    }

    @IBAction func joinBtnDidTap(_ sender: Any) {
        guard let JoinViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JoinViewController") as? JoinViewController else { return }
               
      present(JoinViewController, animated: true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

