//
//  MovieListPresentation.swift
//  Movies
//
//  Created by Juliano Terres on 04/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct MovieListPresentation: Codable {
  let backdrop: URL?
  let date: String
  let description: String
  let genres: String
  let poster: URL?
  let titlte: String
}
