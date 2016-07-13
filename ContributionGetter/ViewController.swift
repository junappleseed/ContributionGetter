//
//  ViewController.swift
//  ContributionGetter
//
//  Created by Jun on 2016/07/10.
//  Copyright © 2016年 Jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* Qiita ID 入力テキストボックス */
    @IBOutlet weak var idTextField: UITextField!
    /* 結果表示ラベル */
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /* GETボタン押下時の処理です。 */
    @IBAction func getButtonClicked(sender: UIButton) {
        if let id = idTextField.text {
            resultLabel.text = "「\(id)」です。"
        }
    }
}
