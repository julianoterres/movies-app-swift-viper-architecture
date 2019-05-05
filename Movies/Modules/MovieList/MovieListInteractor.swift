//
//  MovieListInteractor.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of MovieListInteractor
class MovieListInteractor: MovieListInteractorProtocol {
  
  weak var presenter: MovieListInteractorToPresenterProtocol?
  var worker: MovieListInteractorToWorkerProtocol?
  var moviesAlreadyFetched: [MovieListPresentation] = []
  var genresAlreadyFetched: [MovieListGenresApi] = []
  var movieListResponseApiTemp: MovieListResponseApi?
  var page = 1
  var fetchActive = false
  var totalMovies = 0
  var searchTextSaved = ""
  
}

// MARK: Methods of MovieListPresenterToInteractorProtocol
extension MovieListInteractor: MovieListPresenterToInteractorProtocol {
  
  func fetchMovies(searchText: String) {
    
    if searchText != searchTextSaved || (searchText.isEmpty && !searchTextSaved.isEmpty) {
      page = 1
      totalMovies = 0
      searchTextSaved = ""
      moviesAlreadyFetched.removeAll()
    }
    
    if fetchActive == true || (moviesAlreadyFetched.count >= totalMovies && totalMovies > 0) {
      return
    }
    
    fetchActive = true
    
    if searchText.isEmpty {
      worker?.fetchUpcomingMovies(page: page)
    } else {
      searchTextSaved = searchText
      worker?.fetchSearchMovies(searchText: searchText, page: page)
    }
    
  }
  
}

// MARK: Methods of MovieListWorkerToInteractorProtocol
extension MovieListInteractor: MovieListWorkerToInteractorProtocol {
  
  func fetchedMovies(response: MovieListResponseApi) {
    
    let hasGenres = response.results.contains(where: {
      if let gendersId = $0.genre_ids, !gendersId.isEmpty {
        return true
      }
      return false
    })
    
    if hasGenres && genresAlreadyFetched.isEmpty {
      movieListResponseApiTemp = response
      worker?.fetchGenres()
      return
    }
    
    proccessMovies(movieListApi: response)
    
  }
  
  func fetchedGenres(response: MovieListGenresResponseApi) {
    
    genresAlreadyFetched = response.genres
    
    if let moviesTemp = movieListResponseApiTemp {
      proccessMovies(movieListApi: moviesTemp)
    }
    
  }
  
  func proccessMovies(movieListApi: MovieListResponseApi) {
    
    let movies = movieListApi.results.map { (movie) -> MovieListPresentation in
      
      var genres = "No Category"
      
      if let genresIds = movie.genre_ids, !genresIds.isEmpty {
        genres = genresIds.map({ (genre) -> String in
          let genreData = genresAlreadyFetched.first(where: { $0.id == genre })
          return genreData?.name ?? ""
        }).filter({ !$0.isEmpty }).joined(separator: " - ")
      }
      
      var description = "No Description"
      
      if let overview = movie.overview, !overview.isEmpty {
        description = overview
      }
      
      let posterUrl = ImagesBaseUrlEnum.poster185.rawValue + (movie.poster_path ?? "")
      let backdropUrl = ImagesBaseUrlEnum.backdrop500.rawValue + (movie.backdrop_path ?? "")
      
      return MovieListPresentation(
        backdrop: URL(string: backdropUrl)!,
        date: movie.release_date?.convetDatePtBr ?? "No date",
        description: description,
        genres: genres,
        poster: URL(string: posterUrl)!,
        titlte: movie.title ?? "No title"
      )
      
    }
    
    fetchActive = false
    page += 1
    moviesAlreadyFetched.append(contentsOf: movies)
    totalMovies = movieListApi.total_results
    movieListResponseApiTemp = nil
    
    presenter?.fetchedMovies(movies: moviesAlreadyFetched)
    
  }
  
  func fetchedFail() {
    fetchActive = false
    presenter?.fetchedFail()
  }
  
}
