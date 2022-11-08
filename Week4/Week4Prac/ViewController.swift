//
//  ViewController.swift
//  Week4Prac
//
//  Created by 김초원 on 2022/10/14.
//

import UIKit

protocol labelChangeProtocol {
    func onChgange(text: String)
}

class ViewController: UIViewController, labelChangeProtocol {
    
    // 프로토콜에 포함된 최소 요구사항인 함수를 구현
    func onChgange(text: String){
        label.text = text
    }

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnDidTap(_ sender: Any) {
        guard let SecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                
        SecondViewController.modalPresentationStyle = .fullScreen
                
        SecondViewController.delegate = self   // 자식뷰의 delegate를 자기 자신으로 설정
                present(SecondViewController, animated: true)
    }
}

