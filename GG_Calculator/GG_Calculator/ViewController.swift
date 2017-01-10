//
//  ViewController.swift
//  GG_Calculator
//
//  Created by Deetpanshu Malik on 1/9/17.
//  Copyright © 2017 Deetpanshu Malik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var cGradeField: UITextField!
  
  @IBOutlet weak var dGradeField: UITextField!
  
  @IBOutlet weak var fWeightField: UITextField!
  
  @IBOutlet weak var pNeededLabel: UILabel!
  
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onCalculate(_ sender: Any) {
    print("Calculating")
    
    //A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met. 
    //https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Statements.html
    guard let cGrade = cGradeField.text, !cGrade.isEmpty else {
      errorLabel.isHidden = false
      errorLabel.text = "Error"
      return
    }
    
    guard let dGrade = dGradeField.text, !dGrade.isEmpty else {
      errorLabel.isHidden = false
      errorLabel.text = "Error"
      return
    }
    
    guard let fWeight = fWeightField.text, !fWeight.isEmpty else {
      errorLabel.isHidden = false
      errorLabel.text = "Error"
      return
    }
   
    let cGradeVal = Double(cGrade)!
    let dGradeVal = Double(dGrade)!
    let fWeightVal = Double(fWeight)!
    
    // ((100 - finalWeight) / 100) * cGrade
    // diffGrade = gradeWeWant - gradeWeHave
    // diffGrade / finalWeight * 100
    
    let UWGrade = ((100 - fWeightVal) / 100) * cGradeVal
    
    let diffGrade = dGradeVal - UWGrade
    
    let fGrade = diffGrade / fWeightVal * 100
    
    pNeededLabel.text = "\(fGrade)%"
  }
}

