//
//  ViewController.swift
//  iDev_Business_Viewer_live
//
//  Created by Deetpanshu Malik on 1/11/17.
//  Copyright © 2017 Deetpanshu Malik. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

  @IBOutlet weak var pictureView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var priceLabel: UILabel!
  
  @IBOutlet weak var phoneLabel: UILabel!
  
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var token:String?
  
  //app id from yelp
  let clientID = "AYWL6WWaGT0dvaf_u_EP0Q"
  
  let secret = "MhOlVhJqKMpdeplMJyCpZahIV8xT9mpoVOQRy3z2C5wX1piYfWkFWn72wKJxERsc"
  
  let baseURL = "https://api.yelp.com/oauth2/token"
  
  let searchURL = "https://api.yelp.com/v3/businesses/search"
  
  let location = "West Lafayette, IN"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    getToken()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func getToken(){
    //responseJSON is low key multithreading
    Alamofire.request(baseURL, method: .post, parameters: ["grant_type" : "client_credentials", "client_id" : clientID, "client_secret" : secret], encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
      
      if response.result.isSuccess{
        guard let info = response.result.value else {
          print("Error")
          return
        }
        
        print(info)
        let json = JSON(info)
        print(json)
        
        //put json in an online JSON viewer

        
        self.token = json["access_token"].stringValue
        self.loadBusiness()
      }
    }
  }
  
  func loadBusiness(){
    Alamofire.request(searchURL, method: .get, parameters: ["location" : location], encoding: URLEncoding.default, headers: ["Authorization" : "Bearer \(token!)"]).validate().responseJSON(completionHandler: { (response) in
      
      if response.result.isSuccess{
        guard let info = response.result.value else {
          print("Error")
          return
        }
        
        //print(info)
        let json = JSON(info)
        //print(json)
        
        //put json in an online JSON viewer
        
        let businesses = json["businesses"].arrayValue
        let business = businesses[0]
        print(business)
        
        self.nameLabel.text = business["name"].stringValue
        
        self.priceLabel.text = business["price"].stringValue
        
        self.phoneLabel.text = business["phone"].stringValue
        
        let locationD = business["location"]
        self.locationLabel.text = "\(locationD["address1"].stringValue), \(locationD["city"].stringValue)"
        
        let imageUrl = URL(string: business["image_url"].stringValue)
        let imageRequest = URLRequest(url: imageUrl!)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: imageRequest, completionHandler: {
          (data, response, error) in
          guard let image = data else {
            print(error?.localizedDescription ?? "error")
            return
          }
          self.imageView.image = UIImage(data: image)
          
        }).resume()
      }
    })
  }
}

