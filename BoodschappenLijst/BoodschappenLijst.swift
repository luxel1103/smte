//
//  BoodschappenLijst.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 21/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import Foundation
class BoodschappenLijst {
    var Naam:String = ""
    var producten = [Product]()
    var aanmaakDatum = NSDate?()
    
    init(boodschappenlijst: [Product]){
        self.producten = boodschappenlijst
        let date = NSDate()
        aanmaakDatum = date
    }
    
    init(boodschappenlijst: [Product], aanmaakdatum: NSDate){
        self.producten = boodschappenlijst
        self.aanmaakDatum = aanmaakdatum
    }
    
    func voegProductToe(product: Product){
        self.producten.append(product)
    }
    
    func getAanmaakDatum () -> String {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([ .Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: aanmaakDatum!)
        let year = components.year
        let month = components.month
        let day = components.day
        let hours = components.hour
        let minutes = components.minute
        let seconds = components.second
        return String(year) + " / " + String(month) + " / " + String(day) + " - " + String(hours) + ":" + String(minutes) + ":" + String(seconds)
    }
    
    func getProducten () -> [Product]{
        return self.producten
    }
}
