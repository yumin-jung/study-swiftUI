//
//  MemoStore.swift
//  SwiftMemo
//
//  Created by yumin on 2022/12/21.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "Hello", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll{$0.id == memo.id}
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
