//
//  WinkelenViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 22/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class WinkelenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var boodschappenlijst: BoodschappenLijst?
    var producten = [Product]()
    var selectedRow = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(boodschappenlijst?.getAanmaakDatum())
        producten = (boodschappenlijst?.getProducten())!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producten.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AfvinkCell
        // Cellen aanmaken
        let currentRow = indexPath.row
        let currentAanbieding = self.producten[currentRow]
        cell.productImage.image = UIImage(named: currentAanbieding.PictureNaam)
        cell.productNaam.text = currentAanbieding.Naam
        //double naar string en afronding van decimalen
        let fmt = NSNumberFormatter()
        fmt.maximumFractionDigits = 2
        fmt.minimumFractionDigits = 2
        let prijsString = fmt.stringFromNumber(currentAanbieding.Prijs)!
        cell.productPrijs.text = "€"+prijsString
        cell.productWinkel.text = currentAanbieding.Winkel
        
        cell.afvinkImage.hidden = true
        
        return cell
    }
    
    
    
    private func reloadCellAtRow(row: Int) {
        let indexPath = NSIndexPath(forRow: row, inSection: 0)
        
        tableView.beginUpdates()
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
}
