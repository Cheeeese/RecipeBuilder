//
//  TimerCell.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/20/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class TimerCell: UITableViewCell {

    @IBOutlet weak var timerTimeLabel: UILabel!
    @IBOutlet weak var timerRecipeLabel: UILabel!
    
    var timersViewController: TimersViewController!
    var cellIndexPath: NSIndexPath!

    var seconds = 0
    var timer = NSTimer()
    var time = NSTimeInterval()
    var timerCounter:NSTimeInterval!
    var initialTime = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        startTimer(initialTime)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func displayTimeAsString (time: NSTimeInterval) -> String {
        
        let time = Int(time)
        let seconds = time * 60 % 60
        let minutes = (time) % 60
        let hours = (time / 60 ) % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func startTimer(minutes: Int) {
        timerCounter = NSTimeInterval(minutes * 60)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onTimer:", userInfo: nil, repeats: true)
    }
    
    func onTimer(timer:NSTimer!) {
        // Here is the string containing the timer
        // Update your label here
//        print("Time at row \(self.cellIndexPath.row) is:")
        print(displayTimeAsString(timerCounter))
        timerCounter!--
    }
    
    
    
}
