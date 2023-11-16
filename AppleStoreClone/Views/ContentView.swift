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
                Divider()
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Da non perdere.")
                        .font(.title)
                        .bold()
                        .padding([.top,.leading])
                    ScrollView(.horizontal){
                        HStack(spacing: 15) {
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
                  // .padding(.vertical, 40)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .navigationTitle(Text("Acquista"))
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Spacer()
                                Image("ProfileImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                            .offset(y: 40)
                        }

                    }
                    Spacer()
                }
            }
        }
    }

#Preview {
    ContentView()
        .environment(BackgroundLogic())
}
