//
//  MovieListWorker.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of MovieListWorker
class MovieListWorker: MovieListWorkerProtocol {
  
  weak var interactor: MovieListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var urlsApi: UrlsApiProtocol?
  
}

// MARK: Methods of MovieListInteractorToWorkerProtocol
extension MovieListWorker: MovieListInteractorToWorkerProtocol {
  
  func fetchMovies() {
    
  }
  
}

