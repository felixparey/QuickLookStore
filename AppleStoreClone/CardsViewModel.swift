//
//  CardsViewModel.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import Foundation
import Observation

@Observable
class CardsViewModel{
    let cards: [Card] = [
        
        Card(imageName: "Image", title: "Television", price: 499),
        Card(imageName: "Image1", title: "Nike Shoe 1", price: 59),
        Card(imageName: "Image2", title: "Nike Shoe 1", price: 59),
        Card(imageName: "Image3", title: "Nike Shoe 1", price: 59)
        
    ]
}
