//
//  FullScreenSheet.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 15/11/23.
//

import SwiftUI

struct FullScreenSheet: View {
    
    @Environment(BackgroundLogic.self) private var backgroundLogic
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dismiss) private var isPresented
    @State private var arIsPresented = false
    @State private var backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
    @State private var descriptionGradient = LinearGradient(colors: [Color("TVDesc1"),Color("TVDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
    var card: Card
    
    var body: some View {
        //for iPhone
        if horizontalSizeClass == .compact{
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
                            
                            Button(action: {
                                arIsPresented = true
                                backgroundLogic.arViewPresented = arIsPresented
                            }, label: {
                                HStack{
                                    Text("Watch in AR")
                                        .bold()
                                    Image(systemName: "cube.transparent")
                                }
                                .underline()
                                .tint(card.title == "Teapot" ? .accentColor : .white)
                                
                            })
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
                    //                RoundedRectangle(cornerRadius: 15)
                    //                    .foregroundStyle(.regularMaterial)
                    //                    .frame(height: 70)
                    HStack {
                        Text("From $\(card.price, specifier: "%.0f") or $\(card.price/24, specifier: "%.2f")/mo. for 24 mo.*")
                            .font(.caption)
                            .foregroundStyle(.primary)
                        Spacer()
                        Button(action: {}, label: {
                            Text("BUY")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.thinMaterial))
                            
                            
                        })
                    }
                    
                    .padding()
                    .background(.regularMaterial)
                    
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            })
            .fullScreenCover(isPresented: $arIsPresented, content: {
               // ProductARView(card: card)
                ProductARView(card: card)
            })
            .background(backgroundGradient)
            .statusBarHidden()
            .onAppear(perform: {
                
                switch card.title {
                    
                case "Television":
                    backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                    
                    descriptionGradient = LinearGradient(colors: [Color("TVDesc1"),Color("TVDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                case "Nutcracker":
                    backgroundGradient = LinearGradient(colors: [Color("Nutcracker1"),Color("Nutcracker2"), Color("Nutcracker3") ], startPoint: .leading, endPoint: .trailing)
                    
                    descriptionGradient = LinearGradient(colors: [Color("NutDesc1"),Color("NutDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                case "Grammy":
                    backgroundGradient = LinearGradient(colors: [Color("Grammy1"),Color("Grammy2"), Color("Grammy3") ], startPoint: .leading, endPoint: .trailing)
                    
                    descriptionGradient = LinearGradient(colors: [Color("GrammyDesc1"),Color("GrammyDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                case "Teapot":
                    backgroundGradient = LinearGradient(colors: [Color("Tea1"),Color("Tea2"), Color("Tea3") ], startPoint: .leading, endPoint: .trailing)
                    
                    descriptionGradient = LinearGradient(colors: [Color("TeaDesc1"),Color("TeaDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                default:
                    return
                }
            })
            
        }else{
            //for iPad
            GeometryReader { geometry in
                HStack {
                    ScrollView {
                        ZStack(alignment: .bottom) {
                            Image(card.iPadImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
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
                                
                                Button(action: {
                                   arIsPresented = true
                                    backgroundLogic.arViewPresented = arIsPresented
                                }, label: {
                                        
                                    HStack{
                                        Text("Watch in AR")
                                            .bold()
                                        Image("AugmentedCube")
                                            .fontWeight(.semibold)
                                    }
                                    .underline()
                                    .tint(card.title == "Teapot" ? .black : .white)
                                    
                                })
                            }
                            .padding()
                        }
                        
                        Spacer()
                    }
                    .ignoresSafeArea()
                    .overlay(alignment: .bottom, content: {
                        ZStack {
                            HStack {
                                Text("From $\(card.price, specifier: "%.0f") or $\(card.price/24, specifier: "%.2f")/mo. for 24 mo.*")
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                                Spacer()
                                Button(action: {}, label: {
                                    Text("BUY")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.thinMaterial))
                                })
                            }
                            
                            .padding()
                            .background(.regularMaterial)
                            
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                    })
                    .fullScreenCover(isPresented: $arIsPresented, content: {
                        ProductARView(card: card)
                    })
                    .statusBarHidden()
                    .onAppear(perform: {
                        switch card.title {
                            
                        case "Television":
                            backgroundGradient = LinearGradient(colors: [Color("TVBackground"),Color("TVBackground2") ], startPoint: .leading, endPoint: .trailing)
                            
                            descriptionGradient = LinearGradient(colors: [Color("TVDesc1"),Color("TVDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                        case "Nutcracker":
                            backgroundGradient = LinearGradient(colors: [Color("Nutcracker1"),Color("Nutcracker2"), Color("Nutcracker3") ], startPoint: .leading, endPoint: .trailing)
                            
                            descriptionGradient = LinearGradient(colors: [Color("NutDesc1"),Color("NutDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                        case "Grammy":
                            backgroundGradient = LinearGradient(colors: [Color("Grammy1"),Color("Grammy2"), Color("Grammy3") ], startPoint: .leading, endPoint: .trailing)
                            
                            descriptionGradient = LinearGradient(colors: [Color("GrammyDesc1"),Color("GrammyDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                        case "Teapot":
                            backgroundGradient = LinearGradient(colors: [Color("Tea1"),Color("Tea2"), Color("Tea3") ], startPoint: .leading, endPoint: .trailing)
                            
                            descriptionGradient = LinearGradient(colors: [Color("TeaDesc1"),Color("TeaDesc2") ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                        default:
                            return
                        }
                })
                }
            }
        }
    }
}

#Preview {
    FullScreenSheet(card: Card(imageName: "Tea", title: "Teapot", price: 499, description: "If you can send us a better teapot, we will pay for it", textColor: .black, iPadImageName: "GrammyIPAD", objectName: "TV"))
}
