//
//  MovieListWorker.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import Alamofire

// MARK: Methods of MovieListWorker
class MovieListWorker: MovieListWorkerProtocol {
  
  weak var interactor: MovieListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var urlsApi: UrlsApiProtocol?
  
  func fetchMovies(url: String, parameters: Parameters) {
    
    network?.request(url: url, method: .get, parameters: parameters, success: { [weak self] (response) in
      
      do {
        let responseApi = try JSONDecoder().decode(MovieListResponseApi.self, from: response)
        self?.interactor?.fetchedMovies(response: responseApi)
      } catch {
        print(error.localizedDescription)
        self?.interactor?.fetchedFail()
      }
      
      }, failure: { [weak self] _ in
        self?.interactor?.fetchedFail()
    })
    
  }
  
}

// MARK: Methods of MovieListInteractorToWorkerProtocol
extension MovieListWorker: MovieListInteractorToWorkerProtocol {
  
  func fetchGenres() {
    
    guard let url = urlsApi?.genres(), let key = urlsApi?.key else {
      interactor?.fetchedFail()
      return
    }
    
    let parameters: Parameters = [
      "api_key": key
    ]
    
    network?.request(url: url, method: .get, parameters: parameters, success: { [weak self] (response) in
      
      do {
        let genresApi = try JSONDecoder().decode(MovieListGenresResponseApi.self, from: response)
        self?.interactor?.fetchedGenres(response: genresApi)
      } catch {
        self?.interactor?.fetchedFail()
      }
      
      }, failure: { [weak self] _ in
        self?.interactor?.fetchedFail()
    })
    
  }
  
  func fetchUpcomingMovies(page: Int) {
    
    guard let url = urlsApi?.upcoming(), let key = urlsApi?.key else {
      interactor?.fetchedFail()
      return
    }
    
    let parameters: Parameters = [
      "api_key": key,
      "page": String(page)
    ]
    
    fetchMovies(url: url, parameters: parameters)
    
  }
  
  func fetchSearchMovies(searchText: String, page: Int) {
    
    guard let url = urlsApi?.search(), let key = urlsApi?.key else {
      interactor?.fetchedFail()
      return
    }
    
    let parameters: Parameters = [
      "api_key": key,
      "page": String(page),
      "query": searchText
    ]
    
    fetchMovies(url: url, parameters: parameters)
    
  }
  
}
