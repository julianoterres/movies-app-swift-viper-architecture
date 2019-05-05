//
//  MovieListWorkerTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of MovieListWorkerTests
class MovieListWorkerTests: QuickSpec {
  
  override func spec() {
    
    var worker: MovieListWorker!
    var interactor: MovieListInteractorMock!
    var network: NetworkProtocol!
    var urlsApi: UrlsApiProtocol!
    
    describe("MovieListView") {
      
      beforeEach {
        worker = MovieListWorker()
        interactor = MovieListInteractorMock()
        urlsApi = UrlsApi()
        worker.interactor = interactor
        worker.urlsApi = urlsApi
      }
      
      describe("When MovieListWorker execute the method fetchGenres") {
        
        context("and return is success") {
          beforeEach {
            network = MovieListGenreNetworkSuccessMock()
            worker.network = network
            worker.fetchGenres()
          }
          it("should call a method fetchedGenres at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.movieListGenresResponseApiPassed).notTo(beNil())
          }
        }
        
        context("and return is fail") {
          beforeEach {
            network = MovieListNetworkFailMock()
            worker.network = network
            worker.fetchGenres()
          }
          it("should call a method fetchedFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When MovieListWorker execute the method fetchUpcomingMovies") {
        
        context("and return is success") {
          beforeEach {
            network = MovieListMoviesNetworkSuccessMock()
            worker.network = network
            worker.fetchUpcomingMovies(page: 1)
          }
          it("should call a method fetchedMovies at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.movieListResponseApiPassed).notTo(beNil())
          }
        }
        
        context("and return is fail") {
          beforeEach {
            network = MovieListNetworkFailMock()
            worker.network = network
            worker.fetchUpcomingMovies(page: 1)
          }
          it("should call a method fetchedFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When MovieListWorker execute the method fetchSearchMovies") {
        
        context("and return is success") {
          beforeEach {
            network = MovieListMoviesNetworkSuccessMock()
            worker.network = network
            worker.fetchSearchMovies(searchText: "searchText", page: 1)
          }
          it("should call a method fetchedMovies at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.movieListResponseApiPassed).notTo(beNil())
          }
        }
        
        context("and return is fail") {
          beforeEach {
            network = MovieListNetworkFailMock()
            worker.network = network
            worker.fetchSearchMovies(searchText: "searchText", page: 1)
          }
          it("should call a method fetchedFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When MovieListWorker execute the method fetchMovies") {
        
        context("and return is success") {
          beforeEach {
            network = MovieListMoviesNetworkSuccessMock()
            worker.network = network
            worker.fetchMovies(url: "http://urlrquest.com.br", parameters: ["page": "1"])
          }
          it("should call a method fetchedMovies at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.movieListResponseApiPassed).notTo(beNil())
          }
        }
        
        context("and return is fail") {
          beforeEach {
            network = MovieListNetworkFailMock()
            worker.network = network
            worker.fetchMovies(url: "http://urlrquest.com.br", parameters: ["page": "1"])
          }
          it("should call a method fetchedFail at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
    }
    
  }
  
}
