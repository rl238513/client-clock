//
//  TableViewController5.swift
//  client clock
//
//  Created by EDUARDO MENDOZA on 1/24/20.
//  Copyright © 2020 EDUARDO MENDOZA. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerViewTimer: UIPickerView!
    var hour:Int = 0
    var minute:Int = 0
    var second:Int = 0
    var test = 4
    
     override func viewDidLoad() {
            super.viewDidLoad()
        
        pickerViewTimer.delegate = self
        
        let timeLeft = timerLoop(seconds: second, mins: minute, hours: hour)
            print(timeLeft)
        }
    
    @IBAction func startTimer(_ sender: Any) {
    }
    @IBAction func cancelTimer(_ sender: Any) {
    }
    @IBAction func historyView(_ sender: Any) {
    }
    
    
    
    
    func timerLoop(seconds: Int, mins: Int, hours: Int) -> Int {
        second -= 1
        if mins > 0 && seconds == 0 {
            minute -= 1
            second = 60
        }
        if hours > 0 && mins == 0 {
            hour -= 1
            minute = 60
        }
        var timeLeft = seconds
        return timeLeft
    }
    func numberOfComponents(in pickerViewTimer: UIPickerView) -> Int {
        return 3
        }
    func pickerView(_ pickerViewTimer: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         switch component {
               case 0:
                   return 25
               case 1,2:
                   return 60

               default:
                   return 0
        }
    }
    func pickerView(_ pickerViewTimer: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
       switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Min"
        case 2:
            return "\(row) Sec"
        default:
            return ""
        }
    }
    func pickerView(_ pickerViewTimer: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minute = row
        case 2:
            second = row
        default:
            break;
        }
    }
}
