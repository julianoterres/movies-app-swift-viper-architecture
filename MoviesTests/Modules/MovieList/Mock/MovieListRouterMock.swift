//
//  MovieListRouterMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
@testable import Movies

// MARK: Methods of MovieListRouterMock
class MovieListRouterMock: MovieListRouterProtocol {
  
  weak var view: UIViewController?
  var functionCalled = false
  var movieListPresentationPassed: MovieListPresentation?
  
  func build() -> UIViewController {
    return UIViewController()
  }
  
}

// MARK: Methods of MovieListPresenterToRouterProtocol
extension MovieListRouterMock: MovieListPresenterToRouterProtocol {
  
  func goToScreenDetails(movie: MovieListPresentation) {
    functionCalled = true
    movieListPresentationPassed = movie
  }
  
}
