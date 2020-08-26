//
//  ViewController.swift
//  GuessNumber
//
//  Created by max on 2020/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var minNumberLabel: UILabel!
    @IBOutlet weak var maxNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    var answer = Int.random(in: 1...100)
    var chanceCount = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //底色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [CGColor(srgbRed: 72/255, green: 61/255, blue: 139/255, alpha: 1), CGColor(srgbRed: 28/255, green: 28/255, blue: 28/255, alpha: 1)]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //數字輸入框
        let textFieldPath = UIBezierPath(ovalIn: CGRect(x: 137, y: 217, width: 150, height: 150))
        let textFieldLayer = CAShapeLayer()
        textFieldLayer.fillColor = UIColor.white.cgColor
        textFieldLayer.path = textFieldPath.cgPath
        view.layer.insertSublayer(textFieldLayer, at: 1)
        
        //送出按鈕
        let enterButtomPath = UIBezierPath(ovalIn: CGRect(x: 222, y: 323, width: 60, height: 60))
        let enterButtomLayer = CAShapeLayer()
        enterButtomLayer.fillColor = CGColor(srgbRed: 1, green: 193/255, blue: 37/255, alpha: 1)
        enterButtomLayer.path = enterButtomPath.cgPath
        view.layer.insertSublayer(enterButtomLayer, at: 2)
        
        //再一次按鈕
        let againButtomPath = UIBezierPath(roundedRect: CGRect(x: 95, y: 568, width: 225, height: 53), cornerRadius: 20)
        let againButtomLayer = CAShapeLayer()
        againButtomLayer.fillColor = CGColor(srgbRed: 1 , green: 106/255 , blue: 106/255 , alpha: 1 )
        againButtomLayer.path = againButtomPath.cgPath
        view.layer.insertSublayer(againButtomLayer, at:     2)
    }

    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text!
        let number = Int(numberText)
        if number != nil {
            let guessNumber = number!
            if guessNumber == answer {
                resultLabel.text = "答對了"
            } else if guessNumber < answer {
                resultLabel.text = "數字有點小囉"
                minNumberLabel.text = "\(guessNumber)"
                chanceCount = chanceCount - 1
                chanceLabel.text = "\(chanceCount)"
            } else {
                resultLabel.text = "數字有點大了"
                maxNumberLabel.text = "\(guessNumber)"
                chanceCount = chanceCount - 1
                chanceLabel.text = "\(chanceCount)"
            }
            if chanceCount == 0{
                resultLabel.text = "結束了！！答案是 \(answer)"
            } else if chanceCount < 0 {
                resultLabel.text = "嘖！不是已經告訴你答案了嗎😤"
            }
        }
        numberTextField.text = ""
        view.endEditing(true)
    }
    @IBAction func replay(_ sender: Any) {
        answer = Int.random(in: 0...100)
        chanceCount = 6
        chanceLabel.text = "\(chanceCount)"
        minNumberLabel.text = "1"
        maxNumberLabel.text = "100"
        resultLabel.text = ""
    }
    
}

