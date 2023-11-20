//
//  MainView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 17/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var backgroundLogic = BackgroundLogic()
    @Environment(\.horizontalSizeClass) private var sizeClass
    @State private var isExpanded = true
    
    var body: some View {
        
        
        if sizeClass == .compact{
            TabView{
                ContentView()
                    .environment(backgroundLogic)
                    .tabItem { Label("Shop", systemImage: "macbook.and.iphone") }
                ContentView()
                    .environment(backgroundLogic)
                    .tabItem { Label("Sessions", systemImage: "calendar").symbolVariant(.none) }
                ContentView()
                    .environment(backgroundLogic)
                    .tabItem { Label("For You", systemImage: "person.crop.circle").symbolVariant(.none) }
                ContentView()
                    .environment(backgroundLogic)
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                ContentView()
                    .environment(backgroundLogic)
                    .tabItem { Label("Bag", systemImage: "bag").symbolVariant(.none) }
                
            }
            
        }else{
            NavigationSplitView {
                NavigationStack{
                    List{
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Shop", systemImage: "macbook.and.iphone")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Sessions", systemImage: "calendar")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("For You", systemImage: "person.crop.circle")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Bag", systemImage: "bag")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Favorites", systemImage: "heart")
                        }
                        NavigationLink {
                            ContentView().environment(backgroundLogic)
                        } label: {
                            Label("Recent Orders", systemImage: "shippingbox")
                        }
                        Section("Shop by Product", isExpanded: $isExpanded) {
                            NavigationLink {
                                ContentView().environment(backgroundLogic)
                            } label: {
                                Label("Recent Orders", systemImage: "shippingbox")
                            }
                            NavigationLink {
                                ContentView().environment(backgroundLogic)
                            } label: {
                                Label("Recent Orders", systemImage: "shippingbox")
                            }
                        }

                    }
                    .listStyle(.sidebar)
                    .navigationTitle("Apple Store")
                }
            } detail: {
                ContentView().environment(backgroundLogic)
            }

        }
    }
}

#Preview {
    MainView()
}
