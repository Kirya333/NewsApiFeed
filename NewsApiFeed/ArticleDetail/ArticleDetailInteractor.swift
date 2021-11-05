//
//  ArticleDetailInteractor.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import Foundation

protocol ArticleDetailRouting: ViewableRouting {
    func routeToSafariBrowser(url: URL)
}

protocol ArticleDetailPresentable: Presentable {
    var listener: ArticleDetailPresentableListener? { get set }
    func setViews(with article: Article)
}

protocol ArticleDetailListener: AnyObject {
}

final class ArticleDetailInteractor: PresentableInteractor<ArticleDetailPresentable>, ArticleDetailInteractable, ArticleDetailPresentableListener {
   
    weak var router: ArticleDetailRouting?
    weak var listener: ArticleDetailListener?
    
    private let article: Article
    init(presenter: ArticleDetailPresentable, article: Article) {
        self.article = article
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.setViews(with: article)
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: - ArticleDetailPresentableListener
    func didOpenArticleInSafariBrowser() {
        if let url = article.url {
            router?.routeToSafariBrowser(url: url)
        }
    }
}
