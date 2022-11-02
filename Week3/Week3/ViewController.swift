//
//  ViewController.swift
//  Week3
//
//  Created by 김초원 on 2022/10/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNum1: UITextField!
    @IBOutlet weak var inputNum2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // method for refactoring
//    func initResultViewController() -> ResultViewController{
//        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(withIdentifier: "ResultViewController") as?
//                ResultViewController else { return }
//
//        return resultViewController
//    }
//
//
//
//    // text field의 값 가져오기
//    func getInputNum(){
//        guard let inputFirstNum = inputNum1.text else {return}
//        guard let inputSecondNum = inputNum2.text else {return}
//    }

    // 더하기 버튼탭에 관한 액션 정의
    @IBAction func plusBtnDidTap(_ sender: Any) {
        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ResultViewController") as?
                ResultViewController else { return }
    
        // 덧셈을 해서 result View에 넘기는 로직
        guard let inputFirstNum = inputNum1.text else {return}
        guard let inputSecondNum = inputNum2.text else {return}

        // 덧셈 결과 담기
        let result = Int(inputFirstNum)! + Int(inputSecondNum)!
        resultViewController.resultString = String(result)
        
        present(resultViewController, animated: true)
    }
    
    // 빼기 버튼탭에 관한 액션 정의
    @IBAction func minusBtnDidTap(_ sender: Any) {
        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ResultViewController") as?
                ResultViewController else { return }
    
        // 빼기를 해서 result View에 넘기는 로직
        guard let inputFirstNum = inputNum1.text else {return}
        guard let inputSecondNum = inputNum2.text else {return}

        // 빼기 결과 담기
        let result = Int(inputFirstNum)! - Int(inputSecondNum)!
        resultViewController.resultString = String(result)
        
        present(resultViewController, animated: true)
    }
    
    // 곱하기 버튼탭에 관한 액션 정의
    @IBAction func multipleBtnDidTap(_ sender: Any) {
        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ResultViewController") as?
                ResultViewController else { return }

        // 곱하기를 해서 result View에 넘기는 로직
        guard let inputFirstNum = inputNum1.text else {return}
        guard let inputSecondNum = inputNum2.text else {return}

        // 곱하기 결과 담기
        let result = Int(inputFirstNum)! * Int(inputSecondNum)!
        resultViewController.resultString = String(result)
        
        present(resultViewController, animated: true)
    }

    // 나누기 버튼탭에 관한 액션 정의
    @IBAction func divideBtnDidTap(_ sender: Any) {
        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ResultViewController") as?
                ResultViewController else { return }

        // 나누기를 해서 result View에 넘기는 로직
        guard let inputFirstNum = inputNum1.text else {return}
        guard let inputSecondNum = inputNum2.text else {return}

        // 나누기 결과 담기
        guard Int(inputSecondNum) != 0 else {
            let resultStr = "나누는 수는 0일 수 없습니다."
            resultViewController.resultString = String(resultStr)
            present(resultViewController, animated: true)
            return
        }
        let result = Int(inputFirstNum)! / Int(inputSecondNum)!
        resultViewController.resultString = String(result)
        
        present(resultViewController, animated: true)
    }
}

