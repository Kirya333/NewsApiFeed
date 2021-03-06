//
//  ArticlesPagingComponent.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs

protocol ArticlesPagingDependency: Dependency {
    //var articles: [Article] { get }
    var articlesPageController: ArticlesPagingViewController { get set }
}

final class ArticlesPagingComponent: Component<ArticlesPagingDependency>, ArticleDetailDependency {
    
    fileprivate var articlesPageController: ArticlesPagingViewController {
        return dependency.articlesPageController
    }
}

// MARK: - Builder

protocol ArticlesPagingBuildable: Buildable {
    func build(withListener listener: ArticlesPagingListener, articles: [Article]) -> ArticlesPagingRouting
}

final class ArticlesPagingBuilder: Builder<ArticlesPagingDependency>, ArticlesPagingBuildable {

    override init(dependency: ArticlesPagingDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ArticlesPagingListener, articles: [Article]) -> ArticlesPagingRouting {
        let component = ArticlesPagingComponent(dependency: dependency)
        let viewController = component.articlesPageController
        let articlesDetailsBuilder = ArticleDetailBuilder(dependency: component)
        let interactor = ArticlesPagingInteractor(presenter: viewController, articles: articles)
        interactor.listener = listener
        return ArticlesPagingRouter(interactor: interactor, viewController: viewController, articleDetailsBuilder: articlesDetailsBuilder)
    }
}
