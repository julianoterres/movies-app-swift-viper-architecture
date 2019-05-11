//
//  MovieListPresenterTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of MovieListPresenterTests
class MovieListPresenterTests: QuickSpec {
  
  override func spec() {
    
    var presenter: MovieListPresenter!
    var interactor: MovieListInteractorMock!
    var view: MovieListViewMock!
    var router: MovieListRouterMock!
    
    describe("MovieListPresenter") {
      
      beforeEach {
        presenter = MovieListPresenter()
        interactor = MovieListInteractorMock()
        view = MovieListViewMock()
        router = MovieListRouterMock()
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
      }
      
      describe("When MovieListPresenter execute the method fetchMovies") {
        beforeEach {
          presenter.fetchMovies(searchText: "searchText")
        }
        it("should call a method fetchMovies at interactor") {
          expect(interactor.functionCalled) == true
          expect(interactor.searchTextPassed).notTo(beNil())
        }
      }
      
      describe("When MovieListPresenter execute the method goToScreenDetails") {
        beforeEach {
          let movie = MovieListPresentation(
            backdrop: URL(string: "http://urlimage.com.br"),
            date: "05/05/2019",
            description: "Text Description",
            genres: "Text Genre",
            poster: URL(string: "http://urlimage.com.br"),
            titlte: "Text Title"
          )
          presenter.goToScreenDetails(movie: movie)
        }
        it("should call a method goToScreenDetails at router") {
          expect(router.functionCalled) == true
          expect(router.movieListPresentationPassed).notTo(beNil())
        }
      }
      
      describe("When MovieListPresenter execute the method fetchedMovies") {
        
        context("and is returned an array empty") {
          beforeEach {
            presenter.fetchedMovies(movies: [])
          }
          it("should call a method notResultsFound at view") {
            expect(view.functionCalled) == true
          }
        }
        
        context("and is returned an array no empty") {
          beforeEach {
            let movie = MovieListPresentation(
              backdrop: URL(string: "http://urlimage.com.br"),
              date: "05/05/2019",
              description: "Text Description",
              genres: "Text Genre",
              poster: URL(string: "http://urlimage.com.br"),
              titlte: "Text Title"
            )
            presenter.fetchedMovies(movies: [movie])
          }
          it("should call a method showMovies at view") {
            expect(view.functionCalled) == true
            expect(view.movieListPresentationPassed).notTo(beNil())
          }
        }
        
      }
      
      describe("When MovieListPresenter execute the method fetchedFail") {
        beforeEach {
          presenter.fetchedFail()
        }
        it("should call a method showError at view") {
          expect(view.functionCalled) == true
        }
      }
      
    }
    
  }
  
}
