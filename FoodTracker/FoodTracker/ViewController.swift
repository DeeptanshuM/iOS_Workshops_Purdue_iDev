//
//  ViewController.swift
//  FoodTracker
//
//  Created by Deetpanshu Malik on 1/15/17.
//  Copyright © 2017 Deetpanshu Malik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
//  The IBOutlet attribute tells Xcode that you can connect to the nameTextField
//  property from Interface Builder (which is why the attribute has the IB prefix). The
//  weak keyword indicates that the reference does not prevent the system from
//  deallocating the referenced object. Weak references help prevent reference cycles;
//  however, to keep the object alive and in memory you need to make sure some other part
//  of your app has a strong reference to the object. In this case, it’s the text field’s
//  superview. A superview maintains a strong reference to all of its subviews. As long
//  as the superview remains alive and in memory, all of the subviews remain alive as
//  well. Similarly, the view controller has a strong reference to its content view
//  keeping the entire view hierarchy alive and in memory.
//https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ConnectTheUIToCode.html#//apple_ref/doc/uid/TP40015214-CH22-SW1

  //MARK: Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: Actions

  @IBAction func setDefaultLabelText(_ sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }
}

