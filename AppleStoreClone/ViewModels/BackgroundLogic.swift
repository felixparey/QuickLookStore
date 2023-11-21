//
//  BackgroundLogic.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 15/11/23.
//

import Foundation
import Observation
import SwiftUI

@Observable
class BackgroundLogic{
    
    var backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
    var sheetIsPresented = false
    var arViewPresented = false
    var arPresented = true
    
}
