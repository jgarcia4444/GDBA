//
//  ViewController.swift
//  Inspiration
//
//  Created by Jake Garcia on 12/26/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let session  = URLSession.shared
        let url = URL(string: "https://type.fit/api/quotes")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            let dataJSON = JSON(data)
            print(dataJSON)
        })
        task.resume()
    }

}

