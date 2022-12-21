//
//  SwiftMemoApp.swift
//  SwiftMemo
//
//  Created by yumin on 2022/12/21.
//

import SwiftUI

@main
struct SwiftMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
