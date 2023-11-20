//
//  DeliveryAdView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 16/11/23.
//

import SwiftUI

struct DeliveryAdView: View {
    var body: some View {
    
            HStack(alignment: .top, spacing: 15){
                Image(systemName: "shippingbox")
                    .font(.largeTitle)
                    .scaleEffect(1.1)
                    .offset(y: 3)
                VStack(alignment: .leading, content: {
                    Text("Spedizione gratuita")
                        .font(.subheadline)
                        .bold()
                    Text("Oppure ritira i prodotti disponibili all'Apple Store.")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Button(action: {}, label: {
                        Text("Scorpi di più")
                            .font(.footnote)
                    })
                })
            }
        }
    }


#Preview {
    DeliveryAdView()
}
