//
//  MovieListProtocols.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol MovieListViewToPresenterProtocol: class {
  func fetchMovies()
  func goToScreenDetails()
}

// MARK: Methods of MovieListPresenterProtocol
protocol MovieListPresenterProtocol: class {
  var view: MovieListPresenterToViewProtocol? { get set }
  var router: MovieListPresenterToRouterProtocol? { get set }
  var interactor: MovieListPresenterToInteractorProtocol? { get set }
}

// MARK: Methods of Presenter to Interactor
protocol MovieListPresenterToInteractorProtocol: class {
  func fetchMovies()
}

// MARK: Methods of Presenter to View
protocol MovieListPresenterToViewProtocol: class {
  var presenter: MovieListViewToPresenterProtocol? { get set }
  func showMovies()
  func showError()
}

// MARK: Methods of Presenter to Router
protocol MovieListPresenterToRouterProtocol: class {
  func goToScreenDetails()
}

// MARK: Methods of MovieListInteractorProtocol
protocol MovieListInteractorProtocol: class {
  var presenter: MovieListInteractorToPresenterProtocol?  { get set }
  var worker: MovieListInteractorToWorkerProtocol?  { get set }
}

// MARK: Methods of Interactor to Worker
protocol MovieListInteractorToWorkerProtocol: class {
  func fetchMovies()
}

// MARK: Methods of Interactor to Present
protocol MovieListInteractorToPresenterProtocol: class {
  func fetchedMovies()
  func fetchedFail()
}

// MARK: Methods of MovieListWorkerProtocol
protocol MovieListWorkerProtocol: class {
  var interactor: MovieListWorkerToInteractorProtocol? { get set }
  var network: NetworkProtocol? { get set }
  var urlsApi: UrlsApiProtocol? { get set }
}

// MARK: Methods of Woker to Interactor
protocol MovieListWorkerToInteractorProtocol: class {
  func fetchedMovies()
  func fetchedFail()
}

// MARK: Methods of MovieListRouterProtocol
protocol MovieListRouterProtocol: class {
  var view: UIViewController? { get set }
  func build() -> UIViewController
}

