//
//  MovieListPresenter.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

// MARK: Methods of MovieListPresenter
class MovieListPresenter: MovieListPresenterProtocol {
  
  weak var view: MovieListPresenterToViewProtocol?
  var router: MovieListPresenterToRouterProtocol?
  var interactor: MovieListPresenterToInteractorProtocol?
  
}

// MARK: Methods of MovieListViewToPresenterProtocol
extension MovieListPresenter: MovieListViewToPresenterProtocol {
  
  func fetchMovies(searchText: String) {
    interactor?.fetchMovies(searchText: searchText)
  }
  
  func goToScreenDetails() {
    router?.goToScreenDetails()
  }
  
}

// MARK: Methods of MovieListInteractorToPresenterProtocol
extension MovieListPresenter: MovieListInteractorToPresenterProtocol {
  
  func fetchedMovies(movies: [MovieListPresentation]) {
    if movies.isEmpty {
      view?.notResultsFound()
    } else {
      view?.showMovies(moviesList: movies)
    }
  }
  
  func fetchedFail() {
    view?.showError()
  }
  
}
