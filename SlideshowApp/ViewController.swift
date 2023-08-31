

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    
    //@IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var nextLabel: UIBarButtonItem!
    @IBOutlet weak var backLabel: UIBarButtonItem!
    let imageArr = ["Apple.jpeg","Apple2.jpeg","Apple3.jpeg","Apple4.jpeg"]
    var currentIndex = 0
    var timer: Timer!
    var timer_sec: Float = 0
    var tapCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let name = imageArr[currentIndex]
        slideImage.image = UIImage(named: name)
    }
    //拡大画面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.orgImage = slideImage
    }

    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= imageArr.count{
            currentIndex = 0
        }
        let name = imageArr[currentIndex]
        slideImage.image = UIImage(named: name)
    }
    //戻るボタン
    @IBAction func backImage(_ sender: Any) {
        currentIndex -= 1
        if currentIndex < 0{
            currentIndex = imageArr.count-1
        }
        let name = imageArr[currentIndex]
        slideImage.image = UIImage(named: name)
    }
    //再生・停止ボタン
    @IBAction func playSlideshow(_ sender: Any) {
        tapCount += 1
        if tapCount % 2 != 0{
            nextLabel.isEnabled = false
            backLabel.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        if tapCount % 2 == 0 {
            nextLabel.isEnabled = true
            backLabel.isEnabled = true
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
    }
    //タイマー更新処理
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1.0
        //self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        if self.timer_sec  >= 2.0{
            currentIndex += 1
            if currentIndex >= imageArr.count{
                currentIndex = 0
            }
            let name = imageArr[currentIndex]
            slideImage.image = UIImage(named: name)
            self.timer_sec  = 0
        }
    }
    
    //画面遷移用
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
