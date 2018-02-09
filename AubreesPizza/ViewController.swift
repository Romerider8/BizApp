//
//  ViewController.swift
//  AubreesPizza
//
//  Created by Nate Schreiner on 2/4/18.
//  Copyright © 2018 Nate Schreiner. All rights reserved.
//
import QuartzCore
import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var FindLocationBtn: UIButton!
    @IBOutlet weak var CityZipInput: UITextField!
    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var UseCurrentLocBtn: UIButton!
    @IBOutlet weak var ViewMenuBtn: UIButton!
    //let locations = ["adrian": 49221, "dexter":48130, "grand blanc":48439, "howell":48843, "marquette":48843,
                    //"plainwell":49080, "south lyon":48178, "ypsilanti":48198, "ypsilanti township":48197]
    let location = ["adrian": 49221, "dexter":48130, "grand blanc":48439]
    
    
    @IBAction func FindRestLoc(_ sender: Any) {
        ViewMenuBtn.isHidden = true
        CityZipInput.isHidden = false
        UseCurrentLocBtn.isHidden = false
        SubmitBtn.isHidden = false
    }
    
    func getCommaSepLocList() -> Substring {
        var returnStr:String = ""
        for (_, value) in location {
            returnStr += String(value) + ",%20"
        }
        let endIndex = returnStr.index(returnStr.endIndex, offsetBy: -4)
        let realReturn = returnStr[..<endIndex]
        return realReturn
    }
    
    @IBAction func submitCityOrZip(_ sender: Any) {
        let userInputZip = CityZipInput.text
        let locationList = getCommaSepLocList()
        let appendToBase = userInputZip! + "/" + locationList + "/mile"
        /*
         TODO:: Check to make sure above input is actually a zip and accurate
        */
        
        let path = "https://www.zipcodeapi.com/rest/itB7uHINb0cW1Jbb4rr8Hp5BTOvdNBVqG7BiLwwvqMpMVms6FqxyMB5RCKs6SiEs/multi-distance.json/"+appendToBase
        let testApiPath = "https://www.zipcodeapi.com/rest/wvyR5aWjHNUF80Z6kmr1bTuNojfzhmvtcmfBD8QNo9qbNAHy9FvBISINKF3W5i9J/multi-distance.json/"+appendToBase
        
        let url = URL(string: path)
 
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data, error == nil else {
                print("Error was sent from server")
                return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: String], let result = json["result"] {
                    print(result)
                }//[String: [Any]]
                
                /*
                        Loop through locations dictionary and use its' keys to get distance data from 'json'
 
                */
                
                

            } catch let error as NSError {
                print(error)
            }
            
                //print((NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            
           
        }.resume()
    }
    
    
    
    func addShadow(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 6.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowOpacity = 0.9
        button.layer.masksToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(button: FindLocationBtn)
        addShadow(button: SubmitBtn)
        addShadow(button: ViewMenuBtn)
        addShadow(button: UseCurrentLocBtn)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

