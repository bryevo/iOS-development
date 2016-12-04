//
//  PrintAllController.swift
//  Word Search
//
//  Created by Brian Vo on 10/25/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listWords: UITextView!
    
    let searchBar = UISearchBar()
    
    @IBAction func btnFind(_ sender: UIButton) {
            do {
                let contents = try String(contentsOfFile: filepath!)
                listWords.text = contents
            } catch {
                // contents could not be loaded
            }
        sender.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

