//
//  TimersViewController.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/5/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class TimersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var timersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timersTableView.delegate = self
        timersTableView.dataSource = self
        timersTableView.separatorStyle = UITableViewCellSeparatorStyle.None


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 177
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
   //     print("Number of Rows: \(indexPath.row)")
        if indexPath.row == 0 {
            var cell = timersTableView.dequeueReusableCellWithIdentifier("TimerCell", forIndexPath: indexPath) as! TimerCell
            
            cell.timersViewController = self
            cell.cellIndexPath = indexPath

            cell.initialTime = 10
    //        cell.timerTimeLabel.text = cell.displayTimeAsString(10)
            cell.onTimer(cell.timer)
            cell.timerRecipeLabel.text = "Test Recipe"
            
            return cell
        } else {
            var cell = timersTableView.dequeueReusableCellWithIdentifier("TimerCell2", forIndexPath: indexPath) as! TimerCell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("Tapped \(indexPath.row)")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
