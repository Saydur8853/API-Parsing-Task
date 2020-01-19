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
        
        //Function Call for respose API & print them in log
        
        Alamofire.request("https://api.darksky.net/forecast/688555c90fac582a0fbc3be8e444802b/37.8267,-122.4233").responseJSON( completionHandler:{(response) in
//            print(response.request as Any)
//            print(response.response as Any)
            //print(response.description)
            //print(response.result.value as Any)
            
            
            // Code for showing data in text view
            //self.text_view.text = response.description
            var temp : Double = 0.0
            if let jsonDictionary = response.result.value as? [String : Any] {
                if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
                    let summary = currentWeatherDictionary["summary"] as? String
                    temp = currentWeatherDictionary["temperature"] as? Double ?? 0.0
                   
                    //Below code for converting double type too string 
                    // self.text_view.text = String(temp)
                    self.text_view.text = summary
                    
                    print(currentWeatherDictionary)
                }
            }
//            print(jsonDictionary)
        })
}
    
//    func getCurrentWeather(completion: @escaping (CurrentWeather?) -> void){
//        Alamofire.request("https://api.darksky.net/forecast/688555c90fac582a0fbc3be8e444802b/37.8267,-122.4233").responseJSON( completionHandler:{(response) in
//            //            print(response.request as Any)
//            //            print(response.response as Any)
//            //print(response.description)
//            //print(response.result.value as Any)
//
//
//            // Code for showing data in text view
//            //self.text_view.text = response.description
//
//            if let jsonDictionary = response.result.value as? [String : Any] {
//                if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
//                    //                    let summary = currentWeatherDictionary["pressure"] as? [String : Any]
//                    //                    print(summary)
//                    print(currentWeatherDictionary)
//                    let currentWeather = CurrentWeather(weatherDictionary:currentWeatherDictionary)
//                    completion(currentWeather)
//                }
//                else{
//                    completion(nil)
//                }
//            }
//            //            print(jsonDictionary)
//        })
//    }
}

