//
//  CardView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import SwiftUI

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct CardView: View {
    
    var card: Card
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            
            ZStack(alignment: .top){
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("NOVITÁ")
                            .font(.caption)
                            .foregroundStyle(.black)
                            .opacity(0.5)
                        Text(card.title)
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            
                    }
                    Spacer()
                }
                .padding()
                
            }
            .overlay(alignment: .bottom) {
                BuyView(card: card)
            }
            
            
        }) // End of Button
        .buttonStyle(FlatLinkStyle())
        
    }
}


#Preview {
    CardView(card: Card(imageName: "Image1", title: "Television", price: 499))
    
}

struct BuyView: View {
    
    var card : Card
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .frame(height: 70)
            HStack {
                Text("A partire da € \(card.price)")
                    .font(.caption)
                    .foregroundStyle(.black)
                Spacer()
                Button(action: {}, label: {
                    Text("ACQUISTA")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.black)
                            .opacity(0.05))
                    
                })
            }
            .padding()
            
        }
    }
}
