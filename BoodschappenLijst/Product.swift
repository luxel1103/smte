//
//  Aanbieding.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 13/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import Foundation
class Product  {
    var Naam:String = ""
    var Prijs:Double = 0
    var Winkel:String = ""
    var PictureNaam:String = ""
    
    init(naam: String!, prijs: Double, winkel: String, pictureNaam: String){
        self.Naam = naam
        self.Prijs = prijs
        self.Winkel = winkel
        self.PictureNaam = pictureNaam
    }
}