//
//  ContentView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var cardsViewModel = CardsViewModel()
    
    var body: some View {
            NavigationStack{
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        ForEach(cardsViewModel.cards){ card in
                            
                            CardView(card: card)
                            
                        }
                    }
                    .padding(20)
                    .scrollTargetLayout()
                }
                .scrollIndicators(.hidden)
                
                .scrollTargetBehavior(.viewAligned)
                .navigationTitle("Acquista")
            }
            
        }
    }

#Preview {
    ContentView()
}
