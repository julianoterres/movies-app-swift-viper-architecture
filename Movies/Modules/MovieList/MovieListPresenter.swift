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
  
  func fetchMovies() {
    
  }
  
  func goToScreenDetails() {
    
  }
  
}

// MARK: Methods of MovieListInteractorToPresenterProtocol
extension MovieListPresenter: MovieListInteractorToPresenterProtocol {
  
  func fetchedMovies() {
    
  }
  
  func fetchedFail() {
    
  }
  
}

