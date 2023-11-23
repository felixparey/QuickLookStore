//
//  CardsViewModel.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import Foundation
import Observation
import SwiftUI

class CardsViewModel{
    //Fahmi has a Hub Account
    // Creates the individual Cards
    let cards: [Card] =
    [
        Card(imageName: "TV", title: "Television", price: 499, description: "Perfect for watching old TV Shows.", textColor: .white, iPadImageName: "TVIPAD", objectName: "TV"),
        Card(imageName: "Nutcracker", title: "Nutcracker", price: 29, description: "Cracking the nuts you need to be cracked", textColor: .white, iPadImageName: "NutcrackerIPAD", objectName: "Nutcracker"),
        Card(imageName: "Grammy", title: "Grammy", price: 899, description: "For listening to music in the best possible way.", textColor: .white, iPadImageName: "GrammyIPAD", objectName: "Grammy"),
        Card(imageName: "Tea", title: "Teapot", price: 35, description: "For everyone that is on #TeamTea", textColor: .black, iPadImageName: "TeaIPAD", objectName: "Teapot")
        
    ]
}
