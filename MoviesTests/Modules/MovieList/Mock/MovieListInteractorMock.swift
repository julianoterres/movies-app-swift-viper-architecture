//
//  MovieListInteractorMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import Movies

// MARK: Methods of MovieListInteractorMock
class MovieListInteractorMock: MovieListInteractorProtocol {
  
  weak var presenter: MovieListInteractorToPresenterProtocol?
  var worker: MovieListInteractorToWorkerProtocol?
  var functionCalled = false
  var searchTextPassed: String?
  var movieListResponseApiPassed: MovieListResponseApi?
  var movieListGenresResponseApiPassed: MovieListGenresResponseApi?
  
}

// MARK: Methods of MovieListPresenterToInteractorProtocol
extension MovieListInteractorMock: MovieListPresenterToInteractorProtocol {
  
  func fetchMovies(searchText: String) {
    functionCalled = true
    searchTextPassed = searchText
  }
  
}

// MARK: Methods of MovieListWorkerToInteractorProtocol
extension MovieListInteractorMock: MovieListWorkerToInteractorProtocol {
  
  func fetchedMovies(response: MovieListResponseApi) {
    functionCalled = true
    movieListResponseApiPassed = response
  }
  
  func fetchedGenres(response: MovieListGenresResponseApi) {
    functionCalled = true
    movieListGenresResponseApiPassed = response
  }
  
  func fetchedFail() {
    functionCalled = true
  }
  
}
