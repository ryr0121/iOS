//
//  SecondViewController.swift
//  Week4Prac
//
//  Created by 김초원 on 2022/10/14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: labelChangeProtocol?  // delegate 선언

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBtnDidTap(_ sender: Any) {
        guard let content = textField.text else { return }
        delegate?.onChgange(text: content)   // delegate를 통해 부모뷰에 데이터 전달
        dismiss(animated: true)
    }
}
