//
//  MovieListNetworkMock.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire
@testable import Movies

class MovieListGenreNetworkSuccessMock: NetworkProtocol {
  
  func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    do {
      let path = Bundle.main.path(forResource: "MovieListGenresRequestMock", ofType: "json")!
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      success(data)
    } catch {
      failure("Message Error")
    }
  }
  
}

class MovieListMoviesNetworkSuccessMock: NetworkProtocol {
  
  func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    do {
      let path = Bundle.main.path(forResource: "MovieListMoviesRequestMock", ofType: "json")!
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      success(data)
    } catch {
      failure("Message Error")
    }
  }
  
}

class MovieListNetworkFailMock: NetworkProtocol {
  
  func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    failure("Message Error")
  }
  
}
