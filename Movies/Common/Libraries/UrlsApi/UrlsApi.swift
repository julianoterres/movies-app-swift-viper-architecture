//
//  UrlsApi.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

class UrlsApi: UrlsApiProtocol {
  
  private let baseUlr = "https://api.themoviedb.org/3/"
  var key = "1f54bd990f1cdfb230adb312546d765d"
  
  func upcoming() -> String {
    return baseUlr + "movie/upcoming"
  }
  
  func search() -> String {
    return baseUlr + "search/movie"
  }
  
  func genres() -> String {
    return baseUlr + "genre/movie/list"
  }
  
}
