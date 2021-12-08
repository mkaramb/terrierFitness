//
//  Save.swift
//  Fitness_APP
//
//  Created by Kfir Flank on 12/7/21.
//

import UIKit

class Save: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SaveButton(_ sender: Any) {
        UserDefaults.standard.set(textView.text, forKey: "cool text")
    }
    
    @IBAction func retrieve(_ sender: Any) {
        textView.text = UserDefaults.standard.object(forKey: "cool text") as? String
    }
    
}
