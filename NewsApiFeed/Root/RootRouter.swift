//
//  RootRouter.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import Foundation
import UIKit

protocol RootInteractable: Interactable, ArticlesListListener, ArticlesPagingListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let articlesListBuilder: ArticlesListBuildable
    private let articlesPagingBuilder: ArticlesPagingBuildable
    
    private var articlesPagingRouter: ArticlesPagingRouting?
    
        init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  articlesListBuilder: ArticlesListBuildable,
                  articlesPagingBuilder: ArticlesPagingBuildable) {
        self.articlesListBuilder = articlesListBuilder
        self.articlesPagingBuilder = articlesPagingBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        attachArticlesList()
    }
    
    // MARK: - RootRouting
    
    func attachArticlesPaging(with articles: [Article]) {
        print("****** Articles count ==> \(articles.count)")
        let articlesPagingRouter = articlesPagingBuilder.build(withListener: interactor, articles: articles)
        attachChild(articlesPagingRouter)
    }
    
    // MARK: - Private helpers
    private func attachArticlesList() {
        let articlesListRouter = articlesListBuilder.build(withListener: interactor)
        attachChild(articlesListRouter)
    }
    
}
