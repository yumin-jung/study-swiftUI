//
//  MainListView.swift
//  SwiftMemo
//
//  Created by yumin on 2022/12/21.
//

import SwiftUI
import DeviceActivity

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) {memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label : {
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memo")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
