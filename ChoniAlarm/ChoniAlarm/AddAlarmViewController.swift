//
//  AddAlarmViewController.swift
//  ChoniAlarm
//
//  Created by 김초원 on 2022/11/04.
//

import UIKit

class AddAlarmViewController: UIViewController {

    var delegate: alarmSaveProtocol?
    var dateStrInputed: String?
    var dateInputed: Date?
    
    @IBOutlet weak var timePickerView: UIDatePicker!
    
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBAction func cancelBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        print("ADD View Methods :: saveBtn")
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        dateInputed = dateformatter.date(from: dateformatter.string(from: timePickerView.date))
        print(dateInputed!)
        
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        
        dateStrInputed = dateformatter.string(from: Date())
        print(dateStrInputed!)
        
        delegate?.saveAlarm(savedTimeStr: dateStrInputed!, savedTime: dateInputed!, content: contentTextField.text!)
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
