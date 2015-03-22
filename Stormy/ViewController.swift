//
//  ViewController.swift
//  Stormy
//
//  Created by Srihari Chekuri on 9/27/14.
//  Copyright (c) 2014 Srihari Chekuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    private let apiKey = "b19ba6a6ebe92b23bc99c5590c96ec48"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forecastURL = NSURL(string: "40.391134,-74.574184", relativeToURL : baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask : NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL, completionHandler:
            { (location: NSURL!,response: NSURLResponse! ,error: NSError!) -> Void in
                
                if ( error == nil){
                    let dataObject = NSData(contentsOfURL: location)
                    // have to convert data Object to json data object
                    let weatherDictionary : NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSDictionary
                    let currentWeather = Current(weatherDictionary: weatherDictionary)
                    
                    
                    
                    
                    
                }
                
        })
        downloadTask.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
