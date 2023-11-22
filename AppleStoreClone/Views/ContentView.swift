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
            ScrollView(){
                
                Divider().padding(.horizontal)
                
                // Delivery Ad View with padding etc.
                HStack {
                    DeliveryAdView()
                        .padding(.top, 5)
                        .padding(.bottom, 10)
                        .padding(.horizontal)
                    Spacer()
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    //Section Title
                    Text("The latest")
                        .font(.title)
                        .bold()
                        .padding([.top,.leading])
                    
                    //Horizontal ScrollView containing the cards
                    ScrollView(.horizontal){
                        
                        HStack(spacing: 15) {
                            
                            //Displaying all the cards
                            ForEach(cardsViewModel.cards){ card in
                                
                                CardView(card: card)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .shadow(radius: 8,y: 10)
                                    .frame(width: 320)
                            }
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .scrollTargetLayout()
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .navigationTitle(Text("Shop"))
                    
                    //Profle Image in Toolbar
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Spacer()
                                Image("ProfileImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                        }
                        
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(BackgroundLogic())
}
