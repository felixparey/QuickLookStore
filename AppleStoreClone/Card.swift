//
//  Card.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import Foundation

struct Card: Identifiable{
    var id = UUID()
    var imageName: String
    var title: String
    var price: Int
}
