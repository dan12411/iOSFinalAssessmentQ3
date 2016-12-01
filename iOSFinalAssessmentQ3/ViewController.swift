//
//  ViewController.swift
//  iOSFinalAssessmentQ3
//
//  Created by 洪德晟 on 2016/12/1.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

