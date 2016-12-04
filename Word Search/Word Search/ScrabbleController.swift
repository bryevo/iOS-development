//
//  ScrabbleController.swift
//  Word Search
//
//  Created by Brian Vo on 10/25/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//

import UIKit

class ScrabbleController: UIViewController {
    
    @IBOutlet weak var textScrabble: UITextField!
    
    @IBOutlet weak var listScrabble: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findScrabble(_ sender: UIButton) {
        if (textScrabble.text?.characters.count != 0) {
            listScrabble.text = ""
        }
        else if (textScrabble.text?.characters.count == 0) {
            return
        }
        let scrabble = ScrabbleWord(scrabble: textScrabble.text!)
        for words in scrabble {
            listScrabble.text.append(words + "\n")
        }
    }

}
