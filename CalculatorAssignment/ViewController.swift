//
//  ViewController.swift
//  CalculatorAssignment
//
//  Created by Admin on 18/02/2022.
//

import UIKit

class ViewController: UIViewController {

    var val1: Double = 0.0
    var val2: Double = 0.0
    var total: Double = 0.0
    var op: Character = " "
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var zeroBtn: UIView!
    @IBOutlet weak var decBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func zeroBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "0"
        }
        else {
            totalLabel.text?.append("0")
        }
    }
    
    @IBAction func decBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "0."
        }
        else {
            totalLabel.text?.append(".")
        }
    }
    @IBAction func equalsBtnClick(_ sender: Any) {
        val2 = Double(totalLabel.text!) ?? 0.0
        if op == "+" {
            total = val1 + val2
        }
        else if op == "-" {
            total = val1 - val2
        }
        else if op == "x" {
            total = val1 * val2
        }
        else {
            total = val1 / val2
        }
        val1 = 0.0
        val2 = 0.0
        totalLabel.text = String(total)
    }
    @IBAction func oneBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "1"
        }
        else {
            totalLabel.text?.append("1")
        }
    }
    @IBAction func twoBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "2"
        }
        else {
            totalLabel.text?.append("2")
        }
    }
    @IBAction func threeBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "3"
        }
        else {
            totalLabel.text?.append("3")
        }
    }
    @IBAction func addBtnClick(_ sender: Any) {
        if val1 == 0.0 {
            val1 = Double(totalLabel.text!) ?? 0.0
            op = "+"
            totalLabel.text = "0"
        }
        else {
            val2 = Double(totalLabel.text!) ?? 0.0
            if op == "+" {
                val1 = val1 + val2
                op = "+"
                totalLabel.text = "0"
            }
            else if op == "-" {
                val1 = val1 - val2
                op = "+"
                totalLabel.text = "0"
            }
            else if op == "x" {
                val1 = val1 * val2
                op = "+"
                totalLabel.text = "0"
            }
            else {
                val1 = val1 / val2
                op = "+"
                totalLabel.text = "0"
            }
        }
    }
    @IBAction func fourBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "4"
        }
        else {
            totalLabel.text?.append("4")
        }
    }
    @IBAction func fiveBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "5"
        }
        else {
            totalLabel.text?.append("5")
        }
    }
    @IBAction func sixBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "6"
        }
        else {
            totalLabel.text?.append("6")
        }
    }
    @IBAction func minusBtnClick(_ sender: Any) {
        if val1 == 0.0 {
            val1 = Double(totalLabel.text!) ?? 0.0
            op = "-"
            totalLabel.text = "0"
        }
        else {
            val2 = Double(totalLabel.text!) ?? 0.0
            if op == "+" {
                val1 = val1 + val2
                op = "-"
                totalLabel.text = "0"
            }
            else if op == "-" {
                val1 = val1 - val2
                op = "-"
                totalLabel.text = "0"
            }
            else if op == "x" {
                val1 = val1 * val2
                op = "-"
                totalLabel.text = "0"
            }
            else {
                val1 = val1 / val2
                op = "-"
                totalLabel.text = "0"
            }
        }
    }
    @IBAction func sevenBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "7"
        }
        else {
            totalLabel.text?.append("7")
        }
    }
    @IBAction func eightBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "8"
        }
        else {
            totalLabel.text?.append("8")
        }
    }
    @IBAction func nineBtnClick(_ sender: Any) {
        if totalLabel.text == "0" {
            totalLabel.text = "9"
        }
        else {
            totalLabel.text?.append("9")
        }
    }
    @IBAction func multiBtnClick(_ sender: Any) {
        if val1 == 0.0 {
            val1 = Double(totalLabel.text!) ?? 0.0
            op = "x"
            totalLabel.text = "0"
        }
        else {
            val2 = Double(totalLabel.text!) ?? 0.0
            if op == "+" {
                val1 = val1 + val2
                op = "x"
                totalLabel.text = "0"
            }
            else if op == "-" {
                val1 = val1 - val2
                op = "x"
                totalLabel.text = "0"
            }
            else if op == "x" {
                val1 = val1 * val2
                op = "x"
                totalLabel.text = "0"
            }
            else {
                val1 = val1 / val2
                op = "x"
                totalLabel.text = "0"
            }
        }
    }
    @IBAction func clearBtnClick(_ sender: Any) {
        totalLabel.text = "0"
        val1 = 0.0
        val2 = 0.0
        total = 0.0
        op = " "
    }
    @IBAction func divBtnClick(_ sender: Any) {
        if val1 == 0.0 {
            val1 = Double(totalLabel.text!) ?? 0.0
            op = "/"
            totalLabel.text = "0"
        }
        else {
            val2 = Double(totalLabel.text!) ?? 0.0
            if op == "+" {
                val1 = val1 + val2
                op = "/"
                totalLabel.text = "0"
            }
            else if op == "-" {
                val1 = val1 - val2
                op = "/"
                totalLabel.text = "0"
            }
            else if op == "x" {
                val1 = val1 * val2
                op = "/"
                totalLabel.text = "0"
            }
            else {
                val1 = val1 / val2
                op = "/"
                totalLabel.text = "0"
            }
        }
    }
}

