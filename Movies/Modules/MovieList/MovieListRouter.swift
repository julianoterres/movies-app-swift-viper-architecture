//
//  MovieListRouter.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of MovieListRouterProtocol
class MovieListRouter: MovieListRouterProtocol {
  
  weak var view: UIViewController?
  
  func build() -> UIViewController {
    
    let view = MovieListView()
    let presenter = MovieListPresenter()
    let interactor = MovieListInteractor()
    let router = MovieListRouter()
    let worker = MovieListWorker()
    let network = Network()
    let urlsApi = UrlsApi()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.worker = worker
    worker.interactor = interactor
    worker.network = network
    worker.urlsApi = urlsApi
    router.view = view
    
    return view
    
  }
  
}

// MARK: Methods of MovieListPresenterToRouterProtocol
extension MovieListRouter: MovieListPresenterToRouterProtocol {
  
  func goToScreenDetails() {
    let postDetailView = MovieDetailRouter().build()
    view?.navigationController?.pushViewController(postDetailView, animated: true)
  }
  
}
