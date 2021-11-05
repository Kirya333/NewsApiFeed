//
//  ArticlesListBuilder.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import UIKit

protocol ArticlesListDependency: ArticleDetailDependency {
    var articleListViewController: ArticlesListViewController { get }
    var articlesFetcher: ArticleFetcher { get }
}

final class ArticlesListComponent: Component<ArticlesListDependency> {
    
    
}

// MARK: - Builder

protocol ArticlesListBuildable: Buildable {
    func build(withListener listener: ArticlesListListener) -> ArticlesListRouting
}

final class ArticlesListBuilder: Builder<ArticlesListDependency>, ArticlesListBuildable {

    override init(dependency: ArticlesListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ArticlesListListener) -> ArticlesListRouting {
        let _ = ArticlesListComponent(dependency: dependency)
        let viewController = dependency.articleListViewController
        let interactor = ArticlesListInteractor(presenter: viewController,
                                                viewModel: ArticlesListViewModel(),
                                                articlesFetcher: dependency.articlesFetcher)
        let articleDetailBuilder = ArticleDetailBuilder(dependency: dependency)
        interactor.listener = listener
        viewController.viewModel = interactor.viewModel
        return ArticlesListRouter(interactor: interactor, viewController: viewController, articleDetailBuilder: articleDetailBuilder)
    }
}
