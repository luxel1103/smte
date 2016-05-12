//
//  SearchTableViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 21/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
        var products = [String]()
    var producten = [Product]()
    var geselecteerdProduct: Product?
    var filteredAppleProducts = [String]()
    var resultSearchController = UISearchController()
    var gekozenProducten = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active{
            return self.filteredAppleProducts.count
        }else{
            return self.products.count
        }
    }
    
    
    func loadJsonData()
    {
        let url = NSURL(string: "http://dsgpbets.com/smte/producten.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, 	   options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject)
                }
            }
            catch
            {
                print("Error parsing JSON data")
            }
        }
        dataTask.resume();
    }
    
    func parseJsonData(jsonObject:AnyObject)
    {
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let nieuwenaam = item.objectForKey("naam") as! String
                let nieuweprijs = item.objectForKey("prijs") as! String
                let nieuweimage = item.objectForKey("fotonaam") as! String
                let nieuwewinkel = item.objectForKey("winkel") as! String
                
                let nieuwproduct = Product(naam: nieuwenaam, prijs: Double(nieuweprijs)!, winkel: nieuwewinkel, pictureNaam: nieuweimage)
                producten.append(nieuwproduct);
                products.append(nieuwenaam)
            }
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        
        if self.resultSearchController.active{
            cell!.textLabel?.text = self.filteredAppleProducts[indexPath.row]
        }else{
            cell!.textLabel?.text = self.products[indexPath.row]
        }
        
        return cell!
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredAppleProducts.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let array = (self.products as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredAppleProducts = array as! [String]
        self.tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        for selectedProduct in producten{
            if selectedProduct.Naam == currentCell.textLabel!.text{
                geselecteerdProduct = selectedProduct
            }
        }
        print(currentCell.textLabel!.text)
        let controller = segue.destinationViewController as! ProductViewController
        controller.selectedProduct = geselecteerdProduct
        controller.gekozenProducten = self.gekozenProducten
    }
}
