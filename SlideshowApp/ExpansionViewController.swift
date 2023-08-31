//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by SeitoMitsuhashi on 2023/08/20.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var expansionImage: UIImageView!
    var orgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        expansionImage.image = orgImage.image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
