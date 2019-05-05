//
//  MovieListResponseApi.swift
//  Movies
//
//  Created by Juliano Terres on 04/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct MovieListResponseApi: Codable {
  let page: Int?
  let results: [MovieListMovieApi]
  let total_pages: Int
  let total_results: Int
}
