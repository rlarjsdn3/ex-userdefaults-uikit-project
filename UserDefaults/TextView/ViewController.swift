//
//  ViewController.swift
//  TextView
//
//  Created by 김건우 on 10/16/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textEditor: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaultValues = UserDefaults.standard
        let color = defaultValues.integer(forKey: "color")
        let colorList = [UIColor.black, UIColor.gray, UIColor.lightGray]
        textEditor.textColor = colorList[color]
        textEditor.isEditable = defaultValues.bool(forKey: "editable")
        
        let correction = defaultValues.bool(forKey: "correction")
        if correction {
            textEditor.spellCheckingType = .yes
        } else {
            textEditor.spellCheckingType = .no
        }
    }

    @IBAction func settingsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSettings", sender: self)
    }
    
}

