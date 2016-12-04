//
//  MorphController.swift
//  Word Search
//
//  Created by Brian Vo on 10/26/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//

import UIKit

class MorphController: UIViewController {

    @IBOutlet weak var startWord: UITextField!
    @IBOutlet weak var endWord: UITextField!
    @IBOutlet weak var maxLength: UITextField!
    @IBOutlet weak var listMorph: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findMorph(_ sender: AnyObject) {
        if (startWord.text?.characters.count != 0) {
            listMorph.text = ""
        }
        else if (startWord.text?.characters.count == 0) {
            return
        }
        do {
            let parseString = Int(maxLength.text!)
            if (startWord.text?.characters.count != nil && endWord.text?.characters.count != nil && parseString != nil) {
                let morphChain = try MorphChain(start: startWord.text!, end: endWord.text!, max: parseString!)
                for chain in morphChain {
                    listMorph.text.append(chain + "\n")
                }
            }
            else if (startWord.text?.characters.count != 0 && endWord.text?.characters.count == 0 && maxLength.text?.characters.count == 0) {
                let morph = MorphWord(morph: self.startWord.text!)
                for words in morph {
                    listMorph.text.append(words + "\n")
                }
            }
            else {
                listMorph.text = "Please enter a valid input"
            }
        } catch {
            listMorph.text = "Error in parse"
        }
    }
}
/*
if ((startWord.text?.characters.count == 0 && endWord.text?.characters.count == 0) || (startWord.text?.characters.count == 0 && maxLength.text?.characters.count == 0) || (endWord.text?.characters.count == 0 && maxLength.text?.characters.count == 0))  {
    self.listMorph.text = "Please enter valid inputs."
    return
 
 
 else {
 listMorph.text = "Please enter an integer for Max Length"
 }

}*/
