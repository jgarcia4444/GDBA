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

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var quotesArr = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getQuotes()
    }
    
    func getQuotes() {
        let session  = URLSession.shared
        let url = URL(string: "https://type.fit/api/quotes")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            let dataJSON = JSON(data).array
            guard let JSONArr = dataJSON else {
                return print("Error changing the data JSON into an array.")
            }
            for quoteObject in JSONArr {
                let convertedQuote = Quote()
                convertedQuote.text = quoteObject["text"].stringValue
                convertedQuote.author = quoteObject["author"].stringValue
                self.quotesArr.append(convertedQuote)
            }
        })
        task.resume()
    }
    
    func generateRandomNumberInRange(upperLimit: Int) -> Int {
        let number = Int.random(in: 0...upperLimit)
        return number
    }
    
    func setTextAndAuthorLabel() {
        
        let quotesArrLength = quotesArr.count
        
        let randomNum = generateRandomNumberInRange(upperLimit: quotesArrLength)
        
        let randomQuote = quotesArr[randomNum]
        
        textLabel.text? = randomQuote.text
        authorLabel.text? = randomQuote.author
        
        
    }

    @IBAction func generateQuoteButtonPressed(_ sender: UIButton) {
        
        setTextAndAuthorLabel()
        
    }
}

