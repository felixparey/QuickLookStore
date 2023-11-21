//
//  AppleStoreCloneApp.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import SwiftUI

@main
struct AppleStoreCloneApp: App {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    @State private var backgroundLogic = BackgroundLogic()
    
    var body: some Scene {
        
        
      
        WindowGroup{
            MainView().tint(.accentColor)
        }
        
        }
    }

