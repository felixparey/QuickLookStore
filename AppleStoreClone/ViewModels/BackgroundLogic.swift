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
    
    //Keeps track of whether the FullScreenCover / Sheet is presented
    var sheetIsPresented = false
    
    //Keeps track of whether the AR / Object View is presented
    var arViewPresented = false
    
    //Keeps track of wheteher the AR or Object Mode is currently selected
    var arPresented = true
    
}
