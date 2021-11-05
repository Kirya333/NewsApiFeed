//
//  RootInteractor.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func attachArticlesPaging(with articles: [Article])
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: AnyObject {
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {
    
    weak var router: RootRouting?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: - ArticlesListListener
    func didFinishLoadingArticles(articles: [Article]) {
        router?.attachArticlesPaging(with: articles)
    }
    
    func articlesLoadingOnComplete() {
        print("Paging listener")
    }
}
