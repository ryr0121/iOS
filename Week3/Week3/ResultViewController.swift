//
//  ResultViewController.swift
//  Week3
//
//  Created by 김초원 on 2022/10/04.
//

import UIKit

class ResultViewController: UIViewController {
    var resultString = "" // 연산 결과
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString
        
    }
    
}
