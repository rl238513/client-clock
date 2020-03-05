//
//  TableViewController5.swift
//  client clock
//
//  Created by EDUARDO MENDOZA on 1/24/20.
//  Copyright © 2020 EDUARDO MENDOZA. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var hourDisplay: UILabel!
    @IBOutlet weak var minuteDisplay: UILabel!
    @IBOutlet weak var secondsDisplay: UILabel!
    @IBOutlet weak var pickerViewTimer: UIPickerView!
    
    var hour:Int = 0 {
        didSet {
            hourDisplay.text = "\(hour)"
        }
    }
    var minute:Int = 0 {
        didSet {
            minuteDisplay.text = "\(minute)"
        }
    }
    var second:Int = 0 {
        didSet {
            secondsDisplay.text = "\(second)"
        }
    }
    var timerOn = true
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewTimer.delegate = self
        
    }
    @IBAction func startTimer(_ sender: Any) {
        timerStatus()
    }
    @IBAction func cancelTimer(_ sender: Any) {
        restart()
    }
    @IBAction func historyView(_ sender: Any) {
    }
    func timerLoop(seconds: Int, mins: Int, hours: Int) {
        second -= 1
        if mins > 0 && seconds == 0 {
            minute -= 1
            second = 59
        }
        if hours > 0 && mins == 0 {
            hour -= 1
            minute = 59
        }
    }
    func tickRate() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(TimerViewController.tick)), userInfo: nil, repeats: true)
    }
    @objc func tick() {
        timerLoop(seconds: second, mins: minute, hours: hour)
    }
    func restart() {
        hour = 0
        minute = 0
        second = 0
    }
    func timerStatus() {
        if second > 0 || minute > 0 || hour > 0{
            tickRate()
        }else {
            if second == 0 && minute == 0 && hour == 0 {
                restart()
            }
        }
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
