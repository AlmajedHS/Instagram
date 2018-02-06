//
//  PostDetailsViewController.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/6/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    @IBOutlet weak var imagePostD: UIImageView!
    @IBOutlet weak var captionLabelD: UILabel!
    var photoI: UIImage!
    var stringPassed = ""
    
    @IBAction func backButton(_ sender: UIButton) {
         NotificationCenter.default.post(name: NSNotification.Name("goMain"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePostD.image = photoI
        captionLabelD.text = stringPassed

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PostDetailsViewController
        vc.photoI = photoI
        vc.stringPassed = stringPassed
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
