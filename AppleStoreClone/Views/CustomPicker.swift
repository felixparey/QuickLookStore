//
//  CustomPicker.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import SwiftUI

struct CustomPicker: View {
    
    @Binding var selected: Int
    
    var body: some View {
        
        HStack(spacing: 1){
            
            Button{
                selected = 0
            }label: {
                Text("AR")
                    .frame(width: 60, height: 30)
                    .padding(10)
                    .background(selected == 0 ? .white : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .foregroundStyle(selected == 0 ? .blue : .primary)
            .buttonStyle(FlatLinkStyle())
            .font(.callout)
            
            Button{
                selected = 1
            }label: {
                Text("Object")
                    .frame(width: 60, height: 30)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(selected == 1 ? Color.white : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
            }
            .buttonStyle(FlatLinkStyle())
            .foregroundStyle(selected == 1 ? .blue : .primary)
            .font(.callout)
            
        }
        .padding(2)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CustomPicker(selected: .constant(1))
}


struct CustomOverlay: View {
    
    @State private var selected = 0
    @Environment(\.dismiss) private var dismiss
    var views = ["AR","Object"]
    var card: Card
    
    var body: some View {
        
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


