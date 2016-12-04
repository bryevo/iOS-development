//
//  RhymeController.swift
//  Word Search
//
//  Created by Brian Vo on 10/25/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//

import UIKit

class RhymeController: UIViewController {
    
    @IBOutlet weak var listRhyme: UITextView!
    @IBOutlet weak var textRhyme: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findRhyme(_ sender: UIButton) {
        if (textRhyme.text?.characters.count != 0) {
            listRhyme.text = ""
        }
        else if (textRhyme.text?.characters.count == 0) {
            return
        }
        for line in lines {
            if (line.hasSuffix(textRhyme.text!)) {
                listRhyme.text.append(line + "\n")
            }
        }
    }
}
