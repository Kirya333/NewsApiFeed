//
//  ArticlesListViewModel.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import Foundation

protocol ListViewModel: AnyObject {
    associatedtype Item
    var items: [Item] { get set }
}

extension ListViewModel {
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Item? {
        guard numberOfItems() > index else {
            return nil
        }
        return items[index]
    }
}

final class ArticlesListViewModel: ListViewModel {
    
    var items = [Article]()
    
     init() { }
}

struct ListViewModeling<Item> {
    var items: [Item]
    var numberOfItems: () -> Int
    var itemAtIndex: (Int) -> Item?
}


@available(iOS 13.0, *)
final class ArticlesListViewModelObject: ObservableObject, ListViewModel {
    
    @Published var items = [Article]()
    
     init() { }
}


