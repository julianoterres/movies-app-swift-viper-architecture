//
//  MovieListInteractorTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of MovieListInteractorTests
class MovieListInteractorTests: QuickSpec {
  
  override func spec() {
    
    var interactor: MovieListInteractor!
    var presenter: MovieListPresenterMock!
    var worker: MovieListWorkerMock!
    var movieListResponseApi: MovieListResponseApi!
    
    describe("MovieListInteractor") {
      
      beforeEach {
        interactor = MovieListInteractor()
        presenter = MovieListPresenterMock()
        worker = MovieListWorkerMock()
        interactor.presenter = presenter
        interactor.worker = worker
      }
      
      describe("When MovieListInteractor execute the method fetchMovies") {
        
        context("and search text is empty") {
          beforeEach {
            interactor.fetchMovies(searchText: "")
          }
          it("should call a method fetchUpcomingMovies at worker") {
            expect(worker.functionCalled) == true
            expect(worker.pagePassed).notTo(beNil())
          }
        }
        
        context("and search text not is empty") {
          beforeEach {
            interactor.fetchMovies(searchText: "someText")
          }
          it("should call a method fetchSearchMovies at worker") {
            expect(worker.functionCalled) == true
            expect(worker.searchTextPassed).notTo(beNil())
            expect(worker.pagePassed).notTo(beNil())
          }
        }
        
      }
      
      describe("When MovieListInteractor execute the method fetchedMovies") {
        
        beforeEach {
          do {
            let path = Bundle.main.path(forResource: "MovieListMoviesRequestMock", ofType: "json")!
            let dataJson = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            movieListResponseApi = try JSONDecoder().decode(MovieListResponseApi.self, from: dataJson)
          } catch {
            fail("Error parse PostListResquestMock")
          }
        }
        
        context("and movies found has genres and not there are genres saved") {
          beforeEach {
            interactor.page = 1
            interactor.fetchedMovies(response: movieListResponseApi)
          }
          it("should call a method fetchGenres at worker") {
            expect(worker.functionCalled) == true
          }
        }
        
        context("and movies found has genres and there are genres saved") {
          beforeEach {
            let genre = MovieListGenresApi(id: 1, name: "Genre Name")
            interactor.genresAlreadyFetched = [genre]
            interactor.page = 1
            interactor.fetchedMovies(response: movieListResponseApi)
          }
          it("should call a method fetchedMovies at presenter") {
            expect(interactor.fetchActive) == false
            expect(interactor.page) == 2
            expect(interactor.moviesAlreadyFetched.isEmpty) == false
            expect(interactor.totalMovies) == 209
            expect(interactor.movieListResponseApiTemp).to(beNil())
            expect(interactor.genresAlreadyFetched.isEmpty) == false
            expect(presenter.functionCalled) == true
            expect(presenter.movieListPresentationPassedArray).notTo(beNil())
          }
        }
        
      }
      
      describe("When MovieListInteractor execute the method fetchedGenres") {
        beforeEach {
          do {
            let pathMovies = Bundle.main.path(forResource: "MovieListMoviesRequestMock", ofType: "json")!
            let dataMoviesJson = try Data(contentsOf: URL(fileURLWithPath: pathMovies), options: .mappedIfSafe)
            let movieListResponseApi = try JSONDecoder().decode(MovieListResponseApi.self, from: dataMoviesJson)
            interactor.movieListResponseApiTemp = movieListResponseApi
            
            let pathGenres = Bundle.main.path(forResource: "MovieListGenresRequestMock", ofType: "json")!
            let dataGenresJson = try Data(contentsOf: URL(fileURLWithPath: pathGenres), options: .mappedIfSafe)
            let movieListGenresResponseApi = try JSONDecoder().decode(MovieListGenresResponseApi.self, from: dataGenresJson)
            
            interactor.page = 1
            interactor.fetchedGenres(response: movieListGenresResponseApi)
          } catch {
            fail("Error parse MovieListMoviesRequestMock or MovieListGenresRequestMock")
          }
        }
        it("should call a method fetchedMovies at presenter") {
          expect(interactor.fetchActive) == false
          expect(interactor.page) == 2
          expect(interactor.moviesAlreadyFetched.isEmpty) == false
          expect(interactor.totalMovies) == 209
          expect(interactor.movieListResponseApiTemp).to(beNil())
          expect(presenter.functionCalled) == true
          expect(presenter.movieListPresentationPassedArray).notTo(beNil())
        }
      }
      
    }
    
    describe("When MovieListInteractor execute the method proccessMovies") {
      beforeEach {
        do {
          let pathMovies = Bundle.main.path(forResource: "MovieListMoviesRequestMock", ofType: "json")!
          let dataMoviesJson = try Data(contentsOf: URL(fileURLWithPath: pathMovies), options: .mappedIfSafe)
          let movieListResponseApi = try JSONDecoder().decode(MovieListResponseApi.self, from: dataMoviesJson)
          interactor.page = 1
          interactor.proccessMovies(movieListApi: movieListResponseApi)
        } catch {
          fail("Error parse MovieListMoviesRequestMock or MovieListGenresRequestMock")
        }
      }
      it("should call a method fetchedMovies at presenter") {
        expect(interactor.fetchActive) == false
        expect(interactor.page) == 2
        expect(interactor.moviesAlreadyFetched.isEmpty) == false
        expect(interactor.totalMovies) == 209
        expect(interactor.movieListResponseApiTemp).to(beNil())
        expect(presenter.functionCalled) == true
        expect(presenter.movieListPresentationPassedArray).notTo(beNil())
      }
    }
    
    describe("When MovieListInteractor execute the method fetchedFail") {
      beforeEach {
        interactor.fetchedFail()
      }
      it("should call a method fetchedFail at presenter") {
        expect(interactor.fetchActive) == false
        expect(presenter.functionCalled) == true
      }
    }
    
  }
  
}
