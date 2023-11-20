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
    
    var sideBarContent = SidebarContent()
    
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
                        ForEach(sideBarContent.mainItems){ item in
                            NavigationLink {
                                ContentView()
                                    .environment(backgroundLogic)
                            } label: {
                                Label(item.text, systemImage: item.icon)
                            }
                        }
                        Section("Shop by Product", isExpanded: $isExpanded) {
                                ForEach(sideBarContent.productItems){ item in
                                    NavigationLink {
                                        ContentView().environment(backgroundLogic)
                                    } label: {
                                        Label(item.text, systemImage: item.icon)
                                    }
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
