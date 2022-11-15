import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var orangeViewTapGestureRecognizer: UITapGestureRecognizer!
    
    var tagFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeViewTapGestureRecognizer.addTarget(self, action: #selector(orangeViewDidTap(_:)))
    }
    
    @objc func orangeViewDidTap(_ sender: UITapGestureRecognizer){
        
        if !tagFlag{
            UIView.animate(withDuration: 1, animations: {
                self.orangeViewTopConstraint.constant = 50
                self.orangeViewHeightConstraint.constant = 500
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.tagFlag = true
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.orangeViewTopConstraint.constant = 121
                self.orangeViewHeightConstraint.constant = 128
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.tagFlag = false
            })
        }
    }
    
}

