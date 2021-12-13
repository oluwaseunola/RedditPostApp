//
//  RedditPostAppApp.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import SwiftUI

@main
struct RedditPostAppApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            
            
                
                ContentView().environmentObject(listViewModel)
            }
            
            
    }
}
