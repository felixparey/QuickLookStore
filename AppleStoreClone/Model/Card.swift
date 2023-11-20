//
//  Card.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import Foundation
import SwiftUI

struct Card: Identifiable{
    var id = UUID()
    var imageName: String
    var title: String
    var price: Double
    var description: String
    var textColor: Color
    var iPadImageName: String
}
