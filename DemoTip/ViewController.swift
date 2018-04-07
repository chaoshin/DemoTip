//
//  ViewController.swift
//  DemoTip
//
//  Created by Chao Shin on 2018/4/7.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var percentageTextField: UITextField!
    @IBOutlet weak var featuresNameLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    
    @IBAction func tapViewPress(_ sender: Any) {    //按畫⾯空⽩白方收鍵盤
        view.endEditing(true)   // 收鍵盤
    }
    
    func caluclationAns() -> String{    // 計算與判斷結果
        if let moneyText = moneyTextField.text , let percentageText = percentageTextField.text {    //確認金額與小費是否為Nil
            if let money = Double(moneyText), let percentage = Double(percentageText){  //確認金額與小費的字串轉為Double是否成功
                return "\(money * percentage / 100)"    //回傳計算結果，並轉為String
            }else {
                return "Error"
            }
        }else {
            return "Error"
        }
    }
    
    func updateUI(result: String){  // 更新計算結果
        ansLabel.text = result
    }
    
    func cleanUI() {    // 清除計算結果、輸入金額與百分比
        ansLabel.text = ""
        moneyTextField.text = ""
        percentageTextField.text = ""
    }
    
    @IBAction func caluclationPress(_ sender: Any) {
        updateUI(result: caluclationAns())  // 呼叫更新計算結果
        view.endEditing(true)   // 收鍵盤

    }
    
    @IBAction func changeFeaturesPress(_ sender: UISegmentedControl) {
        featuresNameLabel.text = sender.selectedSegmentIndex == 0 ? "小費:" : "稅金："   // 切換功能，所以顯示不同文字
        cleanUI()   // 清除計算結果、輸入金額與百分比
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

