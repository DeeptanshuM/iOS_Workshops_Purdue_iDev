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
  }

}

