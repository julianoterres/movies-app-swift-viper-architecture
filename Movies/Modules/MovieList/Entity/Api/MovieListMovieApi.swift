//
//  MovieListMovieApi.swift
//  Movies
//
//  Created by Juliano Terres on 04/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct MovieListMovieApi: Codable {
  let adult: Bool
  let backdrop_path: String?
  let genre_ids: [Int]?
  let id: Int?
  let original_language: String?
  let original_title: String?
  let overview: String?
  let poster_path: String?
  let release_date: String?
  let title: String?
  let video: Bool
  let vote_average: Float?
  let vote_count: Int?
}
