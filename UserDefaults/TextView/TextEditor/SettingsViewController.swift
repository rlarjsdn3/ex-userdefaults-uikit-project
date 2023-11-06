//
//  SettingsViewController.swift
//  TextView
//
//  Created by 김건우 on 10/16/23.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var controlColors: UISegmentedControl!
    @IBOutlet weak var controlEditable: UISwitch!
    @IBOutlet weak var controlCorrection: UISwitch!
    var defaultValues: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultValues = UserDefaults.standard
        if let color = defaultValues.object(forKey: "color") as? Int {
            controlColors.selectedSegmentIndex = color
        }
        if let editable = defaultValues.object(forKey: "editable") as? Bool {
            controlEditable.isOn = editable
        }
        if let correction = defaultValues.object(forKey: "correction") as? Bool {
            controlCorrection.isOn = correction
        }
    }
    
    @IBAction func saveColor(_ sender: UISegmentedControl) {
        let current = sender.selectedSegmentIndex
        defaultValues.set(current, forKey: "color")
    }
    
    @IBAction func saveEditable(_ sender: UISwitch) {
        let current = sender.isOn
        defaultValues.set(current, forKey: "editable")
    }
    
    @IBAction func saveCorrection(_ sender: UISwitch) {
        let current = sender.isOn
        defaultValues.set(current, forKey: "correction")
    }
    
}
