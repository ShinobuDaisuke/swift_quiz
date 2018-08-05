//
//  ViewController.swift
//  ○×クイズ
//
//  Created by Daisuke Shinobu on 2018/08/05.
//  Copyright © 2018年 Daisuke Shinobu２. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentQuestionNum:Int = 0
    let questions:[[String:Any]] = [
    
    [
        "q":"iPhoneアプリを開発する統合環境はZcodeである",
        "a":false
    ],
    [
        "q":"Xcode画面の右端にはユーティリティーズがある",
        "a":true
    ],
    [
        "q":"UILabelは文字列を表示する際に利用する",
        "a":true
    ]
    
    ]
    
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showQuestion()
    }

    

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }


    func showQuestion() {
       let question = questions[currentQuestionNum]

        if let questionText = question["q"] as? String {
            questionLabel.text = questionText
        }
    }


    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        if let ans = question["a"] as? Bool {
            if yourAnswer == ans {
            //正解
            // currentQuestionNumを１足して次の問題に進む
            currentQuestionNum += 1
        }else{
            //不正解
        }
        
        //問題を表示します。
        //正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
            if yourAnswer == ans {
                //正解
                //currentQuestionNumを１足して次の問題に進む
                currentQuestionNum += 1
                showAlert(message: "正解！")
            } else {
                //不正解
                showAlert(message: "不正解！")
                
            }
        }
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
            showQuestion()
        
    }
        func showAlert(message:String){
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let close = UIAlertAction(title:"閉じる", style: .cancel, handler:nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }



}
