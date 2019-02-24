//
//  TitleViewController.swift
//  MemorablePlaces
//
//  Created by IMCS2 on 2/23/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var subTitleTextField: UITextField!
    
    @IBAction func DoneButton(_ sender: Any) {
        titles.append(titleTextField.text!)
        subTitles.append(subTitleTextField.text!)
        UserDefaults.standard.set(titles, forKey: "titles")
    UserDefaults.standard.set(subTitles, forKey: "subTitles")
        performSegue(withIdentifier: "InputToMap", sender: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! ViewController
//        vc.myTitle = titleTextField.text!
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
