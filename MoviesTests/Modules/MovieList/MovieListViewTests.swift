//
//  MovieListViewTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of MovieListViewTests
class MovieListViewTests: QuickSpec {
  
  override func spec() {
    
    var view: MovieListView!
    var presenter: MovieListPresenterMock!
    
    describe("MovieListView") {
      
      beforeEach {
        view = MovieListView()
        presenter = MovieListPresenterMock()
        view.presenter = presenter
      }
      
      describe("When MovieListView execute the method viewDidLoad") {
        beforeEach {
          view.viewDidLoad()
        }
        it("should call a method fetchMovies at presenter") {
          expect(presenter.functionCalled) == true
          expect(presenter.searchTextPassed).notTo(beNil())
        }
      }
      
    }
    
  }
  
}
