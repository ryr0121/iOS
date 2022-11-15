import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 3,  animations: {
            self.orangeViewTopConstraint.constant = 50
            self.orangeViewHeightConstraint.constant = 500
            self.view.layoutIfNeeded()
        })
    }
    
}

