//
//  SceneViews.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import SwiftUI
import SceneKit

struct SceneViews: View {
    
    var card: Card
    
    var body: some View {
        
        SceneView(scene: SCNScene(named: "\(card.objectName).usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width)
        
    }
}

//#Preview {
//    SceneViews()
//}
