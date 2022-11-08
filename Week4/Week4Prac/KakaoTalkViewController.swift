//
//  KakaoTalkViewController.swift
//  Week4Prac
//
//  Created by 김초원 on 2022/10/14.
//

import UIKit
import Lottie

class KakaoTalkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 카톡 채팅방 수 => 테이블에 깔릴 셀의 개수()
        return chattingRoomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return 테이블 뷰에 넣을 셀
        
        print("tableView 메소드 호출됨")
        print(indexPath)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTalkTableViewCell", for: indexPath) as? KakaoTalkTableViewCell else { return UITableViewCell() }
        // indexPath = 셀이 몇 번째 행에 들어갈 것인지에 대한 인덱스
        
        cell.nameLabel.text =  chattingRoomData[indexPath.row].name
        cell.profileImgView.image = chattingRoomData[indexPath.row].profileImg
        cell.lastMsgLabel.text = chattingRoomData[indexPath.row].lastMessage
        
        if let memberCnt = chattingRoomData[indexPath.row].memberCount {
            cell.memberCountLabel.text = memberCnt
        } else {
            cell.memberCountLabel.isHidden = true
        }
        
        cell.timeLabel.text = chattingRoomData[indexPath.row].time
        cell.msgCountLabel.text = chattingRoomData[indexPath.row].messageCount
        
        
        return cell
    }
    
    @IBOutlet weak var kakaoTalkTableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTalkTableView.delegate = self
        kakaoTalkTableView.dataSource = self
        initRefreshControl()
    }
    
    func initRefreshControl(){
        kakaoTalkTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl(){
        print("새로고침 됨!!!")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.kakaoTalkTableView.refreshControl?.endRefreshing()
        }
    }
    
    let chattingRoomData: [ChattingRoomDataModel] = [
        ChattingRoomDataModel(
//            profileImg: UIImage(named: String),
            profileImg: nil,
            name: "iOS 단톡방",
            lastMessage: "사진을 보냈습니다",
            memberCount: "200",
            time: "오전 1:06",
            messageCount: "61"
        ),
        ChattingRoomDataModel(
            profileImg: nil,
            name: "UMC 3기 단톡방",
            lastMessage: "다들 미션 다 끝내셨나요?",
            memberCount: "15",
            time: "오전 12:31",
            messageCount: "3"
        ),
        ChattingRoomDataModel(
            profileImg: nil,
            name: "홍길동",
            lastMessage: "어휴 진짜 개졸리네",
            memberCount: nil,
            time: "오전 2:01",
            messageCount: "3"
        ),
        ChattingRoomDataModel(
            profileImg: nil,
            name: "지각대장",
            lastMessage: "그래서 환연 언제 나오냐고요",
            memberCount: nil,
            time: "오후 10:09",
            messageCount: "7"
        ),
        ChattingRoomDataModel(
            profileImg: nil,
            name: "어무니",
            lastMessage: "수업 끝났냐?",
            memberCount: nil,
            time: "오후 7:42",
            messageCount: "1"
        )
    ]
}

struct ChattingRoomDataModel {
    let profileImg: UIImage?
    let name: String
    let lastMessage: String
    let memberCount: String?
    let time: String
    let messageCount: String
}
