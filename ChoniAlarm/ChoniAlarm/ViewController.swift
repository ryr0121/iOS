//
//  ViewController.swift
//  ChoniAlarm
//
//  Created by 김초원 on 2022/11/03.
//

import UIKit

protocol alarmSaveProtocol {
    func saveAlarm(savedTimeStr: String, savedTime: Date, content: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, alarmSaveProtocol {
    
    func saveAlarm(savedTimeStr: String, savedTime: Date, content: String) {
        alarmData.append(AlarmDataModel(savedTimeStr: savedTimeStr, savedTime: savedTime, content: content))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let alarmCell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
        
        alarmCell.contentLabel.text = alarmData[indexPath.row].content

        checkAlarm(alarmData: alarmData[indexPath.row], alarmCell: alarmCell)

        return alarmCell
    }
    
    
    
    func checkAlarm(alarmData: AlarmDataModel, alarmCell: AlarmTableViewCell) {
        var switchStatus = true
        DispatchQueue.global().async {
            var timeInterval = alarmData.savedTime.timeIntervalSinceNow
            
            while(switchStatus && timeInterval > 0){
                timeInterval = alarmData.savedTime.timeIntervalSinceNow
                
                // for test
                print(TimeInterval(Int(timeInterval)).formatted() + "초 남음")
                
                sleep(1)
            }
            
            DispatchQueue.main.async {
                if !alarmCell.alarmSwitch.isOn{
                    switchStatus = false
                    return
                } else {
                    self.alarmSwitchOff(alarmCell: alarmCell)
                    self.showAlert(alarmData: alarmData)
                }
            }
        }
    }
        
    func alarmSwitchOff(alarmCell: AlarmTableViewCell){
        alarmCell.alarmSwitch.setOn(false, animated:true)
    }
    
    func showAlert(alarmData: AlarmDataModel) {
        let alert = UIAlertController(title: "알림", message: alarmData.content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in
                    })
        self.present(alert, animated: true, completion: nil) 
    }
    

    
    @IBOutlet weak var alarmTableView: UITableView!
    
    @IBAction func addAlarmBtn(_ sender: Any) {
        guard let addAlarmViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "AddAlarmViewController") as?
        AddAlarmViewController else { return }
    
        addAlarmViewController.modalPresentationStyle = .fullScreen
        addAlarmViewController.delegate = self
        present(addAlarmViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        alarmTableView.reloadData()
    }

    
    var alarmData: [AlarmDataModel] = []
    
}

struct AlarmDataModel {
    let savedTimeStr: String
    let savedTime: Date
    let content: String
}

