//
//  UrlsApi.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

class UrlsApi: UrlsApiProtocol {
  
  private let baseUlr = "https://jsonplaceholder.typicode.com/"
  
  var posts: URL? {
    return URL(string: baseUlr + "posts")
  }
  
  var users: URL? {
    return URL(string: baseUlr + "users")
  }
  
}
