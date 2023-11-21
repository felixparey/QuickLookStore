//
//  ProductARView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import SwiftUI
import RealityKit

struct ProductARView: View {
    @State private var selected = 0
    @Environment(\.dismiss) private var dismiss
    var views = ["AR","Object"]
    var card: Card
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            if selected == 0{
                ARQuickLookView()
                    .ignoresSafeArea()
                    .overlay(alignment: .top) {
                        HStack{
                            Button{
                                dismiss.callAsFunction()
                            }label: {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.primary)
                                    .font(.title2)
                                    .frame(width: 40, height: 30)
                                    .padding(10)
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            .tint(.primary)
                            
                            Spacer()
                            //                        HStack{
                            //                            Text("AR")
                            //                            Text("Object")
                            //                        }
                            //                        .padding()
                            //                        .foregroundStyle(.white)
                            //                        .background(.thinMaterial)
                            //                        .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            CustomPicker(selected: $selected)
                            
                            
                            Spacer()
                            Button{
                                
                            }label: {
                                    
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundStyle(.primary)
                                        .font(.title2)
                                        .frame(width: 40, height: 30)
                                        .padding(10)
                                        .background(.thinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                            }
                            .tint(.primary)
                            
                            
                        }
                        .padding(.horizontal)
                    }
            }else{
                
                ARQuickLookView()
                    .overlay(alignment: .top) {
                        HStack{
                            Button{
                                dismiss.callAsFunction()
                            }label: {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.primary)
                                    .font(.title2)
                                    .frame(width: 40, height: 30)
                                    .padding(10)
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            .tint(.primary)
                            
                            Spacer()
                            CustomPicker(selected: $selected)
                            Spacer()
                            Button{
                                print("lol")
                            }label: {
                                    
                                    Image(systemName: "square.and.arrow.up")
                                    .foregroundStyle(.primary)
                                    .font(.title2)
                                    .frame(width: 40, height: 30)
                                    .padding(10)
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            .tint(.primary)
                            }
                        .padding(.horizontal)
                            
                            
                        }
                        
                    }
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
