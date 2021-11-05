//
//  RootViewController.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
}

final class RootViewController: UITabBarController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setViewControllers(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        
    }
}
