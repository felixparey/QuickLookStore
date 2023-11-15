//
//  FullScreenSheet.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 15/11/23.
//

import SwiftUI

struct FullScreenSheet: View {
    
    @Environment(\.dismiss) private var isPresented
    @State private var backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
    @State private var descriptionGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
    var card: Card
    
    var body: some View {
        ScrollView {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .bottom, content: {
                    VStack {
                        Text(card.title)
                            .foregroundStyle(.white)
                            .font(.title)
                        .bold()
                        Text(card.description)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundStyle(descriptionGradient)
                        
                        Button("Guarda in AR "){
                            
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .offset(y: 50)
                    .padding()
                })
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        isPresented.callAsFunction()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(6)
                            .background(Circle().opacity(0.2))
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(20)
                }
            Spacer()
        }
        .ignoresSafeArea()
        .overlay(alignment: .bottom, content: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.regularMaterial)
                    .frame(height: 70)
                HStack {
                    Text("A partire da € \(card.price)")
                        .font(.caption)
                        .foregroundStyle(.primary)
                    Spacer()
                    Button(action: {}, label: {
                        Text("ACQUISTA")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.thinMaterial))
                                
                        
                    })
                }
                .padding()
            }
            .padding()
        })
        
        .background(backgroundGradient)
        .statusBarHidden()
            
        
        .onAppear(perform: {
            
            switch card.title {
                
            case "Television":
                backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                
                descriptionGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                
            case "Nutcracker":
                backgroundGradient = LinearGradient(colors: [Color("Nutcracker1"),Color("Nutcracker2"), Color("Nutcracker3") ], startPoint: .leading, endPoint: .trailing)
                
                descriptionGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                
            case "Grammy":
                backgroundGradient = LinearGradient(colors: [Color("Grammy1"),Color("Grammy2"), Color("Grammy3") ], startPoint: .leading, endPoint: .trailing)
                
                descriptionGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                
            case "Teapot":
                backgroundGradient = LinearGradient(colors: [Color("Tea1"),Color("Tea2"), Color("Tea3") ], startPoint: .leading, endPoint: .trailing)
                
                descriptionGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)

            default:
                return
            }
        })
        
    }
}

#Preview {
    FullScreenSheet(card: Card(imageName: "Tea", title: "Teapot", price: 499, description: "If you can send us a better teapot, we will pay for it", textColor: .black))
}
