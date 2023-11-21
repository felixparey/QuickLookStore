//
//  ProductARView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import SwiftUI
import RealityKit

struct ProductARView: View {
    @Environment(BackgroundLogic.self) private var bgLogic
    @Binding var arPresented : Bool
    @Environment(\.dismiss) private var dismiss
    var views = ["AR","Object"]
    var card: Card
    
    var body: some View {
            
        if bgLogic.arPresented == true{
            ARQuickLookView(card: card)
                    .ignoresSafeArea()
                    
            }else{
                ARQuickLookView(card: card)
                    }
        }
    }


struct ARViewContainer: UIViewRepresentable {
    
    var card: Card
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let entity = (try? Entity.load(named: card.objectName))!
        
        // Create horizontal plane anchor for the content
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.children.append(entity)
        
        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

//#Preview {
//    ProductARView()
//}
