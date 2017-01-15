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
  
  @IBOutlet weak var outputLabel: UILabel!
  //
  //  //@IBOutlet weak var pNeededLabel: UILabel!
  
  //@IBOutlet weak var outputLabel: UILabel!
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
    print("\t", cGradeField.text!)
    print("\t", dGradeField.text!)
    print("\t", fWeightField.text!)
    
    var outputMessage: String = ""
    
    let cGrade = cGradeField.text!
    let dGrade = dGradeField.text!
    let fWeight = fWeightField.text!
    
    if cGrade.isEmpty {
      outputMessage += "Error: enter current grade"
    }
    
    if dGrade.isEmpty {
      if outputMessage.characters.count == 0
      {
        outputMessage += "Error: enter desired grade"
      }
      else
      {
        outputMessage += ", enter desired grade"
      }
    }
    
    if fWeight.isEmpty {
      if outputMessage.characters.count == 0
      {
        outputMessage += "Error: enter % weight of final exam in overall grade"
      }
      else
      {
        outputMessage += ", enter % weight of final exam in overall grade"
      }
    }
    
    if outputMessage.characters.count == 0
    {
      
      let cGradeVal = Double(cGrade)!
      let dGradeVal = Double(dGrade)!
      let fWeightVal = Double(fWeight)!
      
      // ((100 - finalWeight) / 100) * cGrade
      // diffGrade = gradeWeWant - gradeWeHave
      // diffGrade / finalWeight * 100
      
      let UWGrade = ((100 - fWeightVal) / 100) * cGradeVal
      
      let diffGrade = dGradeVal - UWGrade
      
      let fGrade = Double(diffGrade / fWeightVal * 100)
      
      outputMessage = "\(round(fGrade * 100) / 100)%"
      
    }
    outputLabel.text = outputMessage
    print(outputMessage)
  }
}

