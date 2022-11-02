//
//  ViewController.swift
//  Week2Practice
//
//  Created by 김초원 on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tadayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func profileBtn(_ sender: Any) {
        tadayLabel.text = "클릭됨"
    }
    
}

