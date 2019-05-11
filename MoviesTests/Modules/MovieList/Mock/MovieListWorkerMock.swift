//
//  MovieListWorkerMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire
@testable import Movies

// MARK: Methods of MovieListWorkerMock
class MovieListWorkerMock: MovieListWorkerProtocol {
  
  weak var interactor: MovieListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var urlsApi: UrlsApiProtocol?
  var functionCalled = false
  var pagePassed: Int?
  var searchTextPassed: String?
  
}

// MARK: Methods of MovieListInteractorToWorkerProtocol
extension MovieListWorkerMock: MovieListInteractorToWorkerProtocol {
  
  func fetchGenres() {
    functionCalled = true
  }
  
  func fetchUpcomingMovies(page: Int) {
    functionCalled = true
    pagePassed = page
  }
  
  func fetchSearchMovies(searchText: String, page: Int) {
    functionCalled = true
    searchTextPassed = searchText
    pagePassed = page
  }
  
}
