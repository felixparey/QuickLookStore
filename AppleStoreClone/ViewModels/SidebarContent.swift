//
//  SidebarContent.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import Foundation
import SwiftUI

struct SidebarContent{
    
    //Sidebar Items in the main section
    var mainItems = [
        SideBarItem(text: "Shop", icon: "macbook.and.iphone"),
        SideBarItem(text: "Sessions", icon: "calendar"),
        SideBarItem(text: "For You", icon: "person.crop.circle"),
        SideBarItem(text: "Search", icon: "magnifyingglass"),
        SideBarItem(text: "Bag", icon: "bag"),
        SideBarItem(text: "Your Saves", icon: "bookmark")
    ]
    
    //Sidebar items in the 2nd section
    var productItems = [
        SideBarItem(text: "Mac", icon: "desktopcomputer"),
        SideBarItem(text: "iPhone", icon: "iphone.gen3"),
        SideBarItem(text: "iPad", icon: "ipad"),
        SideBarItem(text: "Apple Watch", icon: "applewatch"),
        SideBarItem(text: "Apple TV 4K", icon: "appletv"),
        SideBarItem(text: "AirPods", icon: "airpods"),
        SideBarItem(text: "HomePod", icon: "homepod"),
        SideBarItem(text: "AirTag", icon: "airtag"),
        SideBarItem(text: "Accessories", icon: "keyboard"),
        SideBarItem(text: "Apple Gift Card", icon: "giftcard"),
        SideBarItem(text: "Apple Card", icon: "creditcard"),
        
    ]
}
