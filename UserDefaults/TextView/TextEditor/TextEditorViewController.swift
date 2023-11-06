//
//  ViewController.swift
//  TextView
//
//  Created by 김건우 on 10/16/23.
//

import UIKit

class TextEditorViewController: UIViewController {

    @IBOutlet weak var textEditor: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaultValues = UserDefaults.standard
        // ⭐️ integer(forkey:), double(forkey:) 등 메서드는 해당 타입을 반환하기 때문에, 별도 캐스팅이 필요없음
        let color = defaultValues.integer(forKey: "color")
        let colorList = [UIColor.black, UIColor.gray, UIColor.lightGray]
        textEditor.textColor = colorList[color]
        textEditor.isEditable = defaultValues.bool(forKey: "editable")
        let correction = defaultValues.bool(forKey: "correction")
        textEditor.autocorrectionType = correction ? .yes : .no
    }
    
    @IBAction func goToSettings(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToSettings", sender: self)
    }
    
}

