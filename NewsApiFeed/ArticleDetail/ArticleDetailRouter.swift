//
//  ArticleDetailRouter.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//


import RIBs
import Foundation

protocol ArticleDetailInteractable: Interactable {
    var router: ArticleDetailRouting? { get set }
    var listener: ArticleDetailListener? { get set }
}

protocol ArticleDetailViewControllable: ViewControllable {
    func showArticleInBrowser(with url: URL)
}

final class ArticleDetailRouter: ViewableRouter<ArticleDetailInteractable, ArticleDetailViewControllable>, ArticleDetailRouting {

    override init(interactor: ArticleDetailInteractable, viewController: ArticleDetailViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: - ArticleDetailRouting
    func routeToSafariBrowser(url: URL) {
        viewController.showArticleInBrowser(with: url)
    }
}
