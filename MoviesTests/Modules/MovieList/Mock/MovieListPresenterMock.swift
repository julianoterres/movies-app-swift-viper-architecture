//
//  MovieListPresenterMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import Movies

// MARK: Methods of MovieListPresenterMock
class MovieListPresenterMock: MovieListPresenterProtocol {
  
  weak var view: MovieListPresenterToViewProtocol?
  var router: MovieListPresenterToRouterProtocol?
  var interactor: MovieListPresenterToInteractorProtocol?
  var functionCalled = false
  var searchTextPassed: String?
  var movieListPresentationPassedArray: [MovieListPresentation]?
  var movieListPresentationPassed: MovieListPresentation?
  
}

// MARK: Methods of MovieListViewToPresenterProtocol
extension MovieListPresenterMock: MovieListViewToPresenterProtocol {
  
  func fetchMovies(searchText: String) {
    functionCalled = true
    searchTextPassed = searchText
  }
  
  func goToScreenDetails(movie: MovieListPresentation) {
    functionCalled = true
    movieListPresentationPassed = movie
  }
  
}

// MARK: Methods of MovieListInteractorToPresenterProtocol
extension MovieListPresenterMock: MovieListInteractorToPresenterProtocol {
  
  func fetchedMovies(movies: [MovieListPresentation]) {
    functionCalled = true
    movieListPresentationPassedArray = movies
  }
  
  func fetchedFail() {
    functionCalled = true
  }
  
}
