//
//  AlarmTableViewCell.swift
//  ChoniAlarm
//
//  Created by 김초원 on 2022/11/04.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var isRedLabel: Bool? {
        didSet {
            if isRedLabel == true {
                contentLabel.backgroundColor = .red
            } else {
                contentLabel.backgroundColor = .white
            }
        }
    }

}
