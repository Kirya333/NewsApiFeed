//
//  ArticlesPagingInteractor.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import RxSwift

protocol ArticlesPagingRouting: ViewableRouting {
    func attachArticlesDetails(articles: [Article])
}

protocol ArticlesPagingPresentable: Presentable {
    var listener: ArticlesPagingPresentableListener? { get set }
}

protocol ArticlesPagingListener: AnyObject {
}

final class ArticlesPagingInteractor: PresentableInteractor<ArticlesPagingPresentable>, ArticlesPagingInteractable, ArticlesPagingPresentableListener {

    weak var router: ArticlesPagingRouting?
    weak var listener: ArticlesPagingListener?

    
    let articles: [Article]
    
    init(presenter: ArticlesPagingPresentable, articles: [Article]) {
        self.articles = articles
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.attachArticlesDetails(articles: articles)
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    
}
