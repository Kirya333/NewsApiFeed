//
//  ArticleDetailComponent.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs

protocol ArticleDetailDependency: Dependency {
}

final class ArticleDetailComponent: Component<ArticleDetailDependency> {

}

// MARK: - Builder

protocol ArticleDetailBuildable: Buildable {
    func build(withListener listener: ArticleDetailListener, article: Article) -> ArticleDetailRouting
}

final class ArticleDetailBuilder: Builder<ArticleDetailDependency>, ArticleDetailBuildable {


    func build(withListener listener: ArticleDetailListener, article: Article) -> ArticleDetailRouting {
        let _ = ArticleDetailComponent(dependency: dependency)
        let viewController = ArticleDetailViewController()
        let interactor = ArticleDetailInteractor(presenter: viewController, article: article)
        interactor.listener = listener
        return ArticleDetailRouter(interactor: interactor, viewController: viewController)
    }
}
