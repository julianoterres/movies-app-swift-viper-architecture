//
//  UrlsApiProtocol.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

protocol UrlsApiProtocol: class {
  var posts: URL? { get }
  var users: URL? { get }
}
