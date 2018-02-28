//
//  ViewController.swift
//  calculator
//
//  Created by 박기찬 on 2018. 2. 28..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var display: UILabel!
    var first: CLongLong!
    var caltype: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        first = 0
        caltype = -1
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        caltype = sender.tag
        first = CLongLong(display.text!)
        display.text = "0"
    }
    
    @IBAction func equal(_ sender: Any) {
        let second: CLongLong = CLongLong(display.text!)!
        
        if(caltype == 0){
            display.text = String(first + second)
        }else if(caltype == 1){
            display.text = String(first - second)
        }else if(caltype == 2){
            display.text = String(first / second)
        }else if(caltype == 3){
            display.text = String(first * second)
        }
        first = 0
    }
    
    
    @IBAction func erase(_ sender: UIButton) {
        let cnt: Int = (display.text?.characters.count)!
        if(cnt == 1) {
            if(display.text == "0"){
                return
            }
            else{
                display.text = "0"
                return
            }
        }
        var str: String = display.text!
        str = str.substring(to: str.index(before: str.endIndex))
        display.text = str
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let cnt: Int = (display.text?.characters.count)!
        if(cnt > 12) {
            return
        }
        
       if(cnt == 1 && display.text! == "0") {
             display.text = String(sender.tag)
        }else{
            display.text = display.text! + String(sender.tag)
        }
        
    }
    
}
