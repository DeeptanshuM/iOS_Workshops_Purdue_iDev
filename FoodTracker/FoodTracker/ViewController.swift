//
//  ViewController.swift
//  FoodTracker
//
//  Created by Deetpanshu Malik on 1/15/17.
//  Copyright © 2017 Deetpanshu Malik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
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
  @IBOutlet weak var photoImageView: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Handle the text field’s user input through delegate callbacks.
    //When a ViewController instance is loaded, it sets itself as the delegate of its nameTextField property.
    nameTextField.delegate = self
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //When a user wants to finish editing the text field, the text field needs to
  //resign its first-responder status. Because the text field will no longer be the
  //active object in the app, events need to get routed to a more appropriate object.
  
  //This is where your implementation of UITextFieldDelegate methods comes in. You
  //need to specify that the text field should resign its first-responder status when
  //the user taps a button to end editing in the text field. You do this in the
  //textFieldShouldReturn(_:) method, which gets called when the user taps Return (or
  //in this case, Done) on the keyboard.
  //https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ConnectTheUIToCode.html#//apple_ref/doc/uid/TP40015214-CH22-SW1
  
  //MARK: UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //Hide the keyboard
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    mealNameLabel.text = textField.text
  }
  
  //MARK: UIImagePickerControllerDelegate
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    // Dismiss the picker if the user canceled.
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    // The info dictionary may contain multiple representations of the image. You want to use the original.
    guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    
    // Set photoImageView to display the selected image.
    photoImageView.image = selectedImage
    
    // Dismiss the picker.
    dismiss(animated: true, completion: nil)
  }
  
  //MARK: Actions

  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    // Hide the keyboard.
    nameTextField.resignFirstResponder()
    
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()
    
    // Only allow photos to be picked, not taken.
    imagePickerController.sourceType = .photoLibrary
    
    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
  @IBAction func setDefaultLabelText(_ sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }
}

