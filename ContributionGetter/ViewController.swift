//
//  ViewController.swift
//  ContributionGetter
//
//  Created by Jun on 2016/07/10.
//  Copyright © 2016年 Jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func getButtonClicked(sender: UIButton) {
        
        let id = idTextField.text!
        if id == "" {
            showAlertMessage(id: id)
            return
        }
        
        guard let (contributions, followers, items) = QiitaUserStatus.getValues(id: id) else {
            showAlertMessage(id: id)
            return
        }
        
        print("contributions=\(contributions)")
        print("followers=\(followers)")
        print("items=\(items)")
        
        resultLabel.text = "\(id) のContributionは \(contributions) です。"
    }
    
    func showAlertMessage(id id: String) {
        
        let message: String
        if id == "" {
            message = "値を入力してください。"
        } else {
            message = "「\(id)」のステータスは取得できませんでした。"
        }
        
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
}
