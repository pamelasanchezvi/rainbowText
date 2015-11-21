//
//  ViewController.swift
//  rainbow
//
//  Created by Pamela Sanchez on 11/20/15.
//  Copyright (c) 2015 Pamela Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var inputPrompt:String = "Type here!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = inputPrompt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPushButton(button: PButtonView) {
        if button.isMore {
            changeTextColor()
        }
        
    }
    
    func changeTextColor(){
        // randomly change the color on push
        myLabel.textColor = UIColor.randomColor()
        myLabel.backgroundColor = UIColor.randomColor()
    }
    
    // textfield delegate functions
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if (textField.text == ""){
            textField.text == inputPrompt
        }else{
            myLabel.text = textField.text
            changeTextColor()
        }
    }

    
}

// Random number generator
func randomCGFloat() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
