//
//  BasicViewController.swift
//  TextView
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class BasicViewController: UIViewController {

    @IBOutlet weak var counter: UIStepper!
    @IBOutlet weak var counterLabel: UILabel!
    var defaultsValue: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultsValue = UserDefaults.standard
        // ⭐️ object 메서드는 옵셔널 AnyObject을 반환하기 때문에, 적절한 타입으로 캐스팅 후, 값을 사용해야 함.
        if let number = defaultsValue.object(forKey: "counter") as? Double {
            counter.value = number
            counterLabel.text = String(number)
        }
        if let lastDate = defaultsValue.object(forKey: "lastDate") as? Date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
            print("You haven't use this app in \(components.year!) years, \(components.month!) months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, \(components.second!) seconds")
        }
        defaultsValue.set(Date(), forKey: "lastDate")
    }
    
    @IBAction func incrementValue(_ sender: UIStepper) {
        let current = counter.value
        defaultsValue.set(current, forKey: "counter")
        counterLabel.text = String(current)
    }
    
}
