//
//  KakaoTalkTableViewCell.swift
//  Week4Prac
//
//  Created by 김초원 on 2022/10/14.
//

import UIKit

class KakaoTalkTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMsgLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var msgCountBackgroundView: UIView!
    @IBOutlet weak var msgCountLabel: UILabel!
    
    // ViewController에서의 viewDidLoad와 유사한 메소드 (LifeCycle 메소드)
    override func awakeFromNib() {
        super.awakeFromNib()
//        profileImgView.layer.cornerRadius = 17.6
//        msgCountBackgroundView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(
        
    ){
        
    }

}
