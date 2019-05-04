//
//  MovieListInteractor.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

// MARK: Methods of MovieListInteractor
class MovieListInteractor: MovieListInteractorProtocol {
  
  weak var presenter: MovieListInteractorToPresenterProtocol?
  var worker: MovieListInteractorToWorkerProtocol?
  
}

// MARK: Methods of MovieListPresenterToInteractorProtocol
extension MovieListInteractor: MovieListPresenterToInteractorProtocol {
  
  func fetchMovies() {
    
  }
  
}

// MARK: Methods of MovieListWorkerToInteractorProtocol
extension MovieListInteractor: MovieListWorkerToInteractorProtocol {
  
  func fetchedMovies() {
    
  }
  
  func fetchedFail() {
    
  }
  
}

