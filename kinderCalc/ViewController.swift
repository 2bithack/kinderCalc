//
//  ViewController.swift
//  kinderCalc
//
//  Created by enzo bot on 11/17/16.
//  Copyright © 2016 GarbageGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var settingValue = false
    
    var settingOperand = false
    
    var calculated = false
    
    var subtracting = false
    
    var a: Int = 0
    var b: Int = 0
    
    var calculationString: String = ""
    
    var calcHistoryTableViewController: CalcHistoryTableViewController!
    
    var calcArray: [String] = []
    
    @IBAction func pressedDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if calculated == true {
            display.text = ""
            calculated = false
        }
        
        if settingValue {
            let displayedDigits = display.text!
            display.text = displayedDigits + digit
        } else {
            display.text = digit
        }
        settingValue = true
    }
    
    
    @IBAction func pressedSubtract(_ sender: UIButton) {
        
        subtracting = true
        a = Int(display.text!)!
        display.text = ""
        
    }
    
    @IBAction func pressedAddition(_ sender: UIButton) {
        
        a = Int(display.text!)!
        display.text = ""
        
    }
    
    
    @IBAction func pressedEraseLast(_ sender: UIButton) {
        display.text = ""
    }
    
    @IBAction func pressedEraseAll(_ sender: UIButton) {
        display.text = ""
        a = 0
        b = 0
    }
    
    @IBAction func pressedCalc(_ sender: UIButton) {
        b = Int(display.text!)!
        
        if subtracting == false {
            display.text = String(a+b)
            calculationString = "\(a) + \(b) = \(a+b)"
        } else {
            display.text = String(a-b)
            calculationString = "\(a) - \(b) = \(a-b)"
        }
        
        calculated = true
        subtracting = false
        
        calcArray.append(calculationString)
        calcCount.text = String(calcArray.count)

    }
    
    @IBOutlet weak var calcCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcHistory(_ sender: UIButton) {
        
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! CalcHistoryTableViewController
        
        destination.calculations = calcArray
        
        
        
    }
    
}

