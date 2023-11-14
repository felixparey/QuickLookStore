//
//  CardView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        
        VStack {
            ZStack(alignment: .top){
                Image(card.imageName)
                HStack {
                    Text(card.title)
                        .font(.largeTitle)
                    .bold()
                    Spacer()
                }
                .padding()
            }
        }
        
                }
            }
        

#Preview {
    CardView(card: Card(imageName: "Image", title: "Nike Shoe Nr. 1", price: 174))
}
