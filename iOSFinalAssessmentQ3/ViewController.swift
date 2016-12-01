//
//  ViewController.swift
//  iOSFinalAssessmentQ3
//
//  Created by 洪德晟 on 2016/12/1.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // GET data
    @IBAction func getAction(_ sender: Any) {
        // get url
        let url = URL(string: "https://httpbin.org/get")
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) -> Void in
            
            if error != nil
            {
                print("error=\(error?.localizedDescription)")
                return
            }
            
            // Print out response string
            if let data = data {
                let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                
                NSLog("\(responseString)")
            }
        })
        
        task.resume()
    }
    
    // POST data
    @IBAction func postAction(_ sender: Any) {
        let url = URL(string: "https://httpbin.org/post")
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = "POST"
        
        // get current time
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // let time transfer to string
        let str = dateFormatter.string(from: currentTime)
//        print("currentTime: \(str)")
        // prepare data
        let postData = ["time": str]
//        print(postData)
        let jsonData = try! JSONSerialization.data(withJSONObject: postData, options: .prettyPrinted)
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            if error != nil{
                print("Error -> \(error?.localizedDescription)")
                return
            }
            
//            let result = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
//            
//            print("Result -> \(result)")
            
            // get response time
            let responseTime = Date()
//            print("responseTime: \(responseTime)")
            let transferTime = responseTime.timeIntervalSince(currentTime)
            
            NSLog("花了\(transferTime)秒")
            
        }
        
//        let postStr = str
//        
//        let data = postStr.data(using: String.Encoding.utf8)
//        
//        let task2 = URLSession.shared.uploadTask(with: urlRequest, from: data) {
//            (data:Data?, response:URLResponse?, err:Error?) -> Void in
//            
//            if err != nil {
//                print("===\(err?.localizedDescription)")
//            }
//            
//            // get response time
//            let responseTime = Date()
//            print("responseTime: \(responseTime)")
//            let transferTime = responseTime.timeIntervalSince(currentTime)
//            
//            NSLog("花了\(transferTime)秒")
//        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

