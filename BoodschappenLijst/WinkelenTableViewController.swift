//
//  WinkelenTableViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 22/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

//
//  SearchTableViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 21/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class WinkelenTableViewController: UITableViewController {
    
    var boodschappenlijsten = [BoodschappenLijst]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boodschappenlijsten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        
            cell!.textLabel?.text = self.boodschappenlijsten[indexPath.row].getAanmaakDatum()
        
        return cell!
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = self.tableView.indexPathForSelectedRow!
        let selectedBoodschappenlijst = self.boodschappenlijsten[selectedRow.row]
        let controller = segue.destinationViewController as! WinkelenViewController
        //gekozen product meegeven
        controller.boodschappenlijst = selectedBoodschappenlijst
    }
}