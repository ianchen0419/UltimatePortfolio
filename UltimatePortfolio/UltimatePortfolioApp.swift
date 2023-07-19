//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by 陳怡安 on 2023/7/18.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    // 讓swfit建立並且在app運行期間內持有dataController
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
