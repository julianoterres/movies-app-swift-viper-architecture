//
//  MovieListViewMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
@testable import Movies

// MARK: Methods of MovieListViewMock
class MovieListViewMock: UIViewController {
  
  var presenter: MovieListViewToPresenterProtocol?
  var functionCalled = false
  var movieListPresentationPassed: [MovieListPresentation]?
  
}

// MARK: Methods of MovieListPresenterToViewProtocol
extension MovieListViewMock: MovieListPresenterToViewProtocol {
  
  func showMovies(moviesList: [MovieListPresentation]) {
    functionCalled = true
    movieListPresentationPassed = moviesList
  }
  
  func notResultsFound() {
    functionCalled = true
  }
  
  func showError() {
    functionCalled = true
  }
  
}

// MARK: Methods of ErrorViewProtocol
extension MovieListViewMock: ErrorViewProtocol {
  
  func didPressRetry() {
    functionCalled = true
  }
  
}
