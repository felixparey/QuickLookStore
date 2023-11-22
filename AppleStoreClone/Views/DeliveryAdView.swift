//
//  DeliveryAdView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 16/11/23.
//

import SwiftUI

struct DeliveryAdView: View {
    var body: some View {
        //The advertisement in the top
        HStack(alignment: .top, spacing: 15){
            Image(systemName: "shippingbox")
                .font(.largeTitle)
                .scaleEffect(1.1)
                .offset(y: 3)
                .accessibilityHidden(true)
            
            VStack(alignment: .leading, content: {
                Text("Free delivery")
                    .font(.subheadline)
                    .bold()
                Text("Or pick up available items at an Apple Store")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Button(action: {}, label: {
                    Text("Learn more")
                        .accessibilityLabel("Learn more")
                        .font(.footnote)
                })
                
            })
            .accessibilityElement(children: .combine)
            
        }
    }
}


#Preview {
    DeliveryAdView()
}
