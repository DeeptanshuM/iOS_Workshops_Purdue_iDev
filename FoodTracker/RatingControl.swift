//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Deetpanshu Malik on 1/15/17.
//  Copyright © 2017 Deetpanshu Malik. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

  //You typically create a view in one of two ways: by programatically initializing the view, or by allowing the view to be loaded by the
  //storyboard. There’s a corresponding initializer for each approach: init(frame:) for programatically initializing the view and init?(coder:)
  //for loading the view from the storyboard
  
  //MARK: Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtons()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupButtons()
  }
  
  //MARK: Private Methods
  private func setupButtons() {
    // Create the button
    let button = UIButton()
    button.backgroundColor = UIColor.red
    
    //Add constraints
    button.translatesAutoresizingMaskIntoConstraints = false //disables the button’s automatically generated constraints
    button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    // Add the button to the stack
    addArrangedSubview(button)
  }
  
}
