//
//  ViewController.swift
//  API_callByCocoapod
//
//  Created by SAYDUR on 1/16/20.
//  Copyright © 2020 SAYDUR. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    @IBOutlet weak var text_view: UITextView!
    @IBAction func callButton(_ sender: Any) {
        
//        Function Call for respose API & print them in log
        
        Alamofire.request("https://api.darksky.net/forecast/688555c90fac582a0fbc3be8e444802b/37.8267,-122.4233").responseJSON( completionHandler:{(response) in
//            print(response.request as Any)
//            print(response.response as Any)
//            print(response.description)
//            print(response.result.value as Any)
//            Code for showing data in text view
//            self.text_view.text = response.description
            
            
            
            /*  1ST TASK 1. From "    currently" object show "summary" in view.*/
            
            var temp : Double = 0.0
            
            if let jsonDictionary = response.result.value as? [String : Any] {
                if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
                    let summary = currentWeatherDictionary["summary"] as? String
                    temp = currentWeatherDictionary["temperature"] as? Double ?? 0.0
                    
//                    self.text_view.text = summary
//                    Below code for converting double type to string for showing in textview
//                    self.text_view.text = String(temp)
                    
                    
            /*  2ND TASK 2. From "currently" get time, convert the timestamp to Date and show in format "Jan 16, 2020 9:53 AM" in the view.*/
                    
                    var time : Int = 1579168388
                    time = currentWeatherDictionary["time"] as! Int
                    print(time)
                    
                    let date = Date(timeIntervalSince1970: 1579168388)
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
                    dateFormatter.locale = NSLocale.current
                    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a" //Specify your format that you want //"dd-MM-yyyy HH:mm"
                    let strDate = dateFormatter.string(from: date as Date)
                    
//                  print(strDate)
//                  self.text_view.text = strDate
                    
            /*  3RD TASK 3. From "minutely" object get "data" and show the average of "precipProbability" in the view. Ignore those value where precipProbability is given 0.*/
                    let minutely = jsonDictionary["minutely"] as? [String : Any]
                    let dataArray = minutely?["data"] as! NSArray
                    var i = 0
                    var count = 0
                    var sum = 0 as Double
                    for _ in dataArray {
                        
//                        print(item as Any)//print(dataArray[i])
                        
                        let item = dataArray[i] as! [String: Any]
                        let precipProb = item["precipProbability"] as! Double
                        if precipProb != 0 {
                            sum = sum + precipProb
                            count+=1
                        }
                        
//                        print("i = \(i)")
                        
                        i+=1
                    }
                    let avg = sum / Double(count)
                    
                    print("Average = \(avg)")

                    self.text_view.text = String(avg)
                    
                   
//             print(currentWeatherDictionary)
                }
            }
//            print(jsonDictionary)
            
        })
    }
    
    
}

