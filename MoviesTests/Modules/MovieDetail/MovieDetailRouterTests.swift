//
//  MovieDetailRouterTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Movies

// MARK: Methods of MovieDetailRouterTests
class MovieDetailRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: MovieDetailRouter!
    var view: UIViewController!
    
    describe("MovieDetailRouter") {
      
      beforeEach {
        router = MovieDetailRouter()
      }
      
      describe("When MovieDetailRouter execute the method build") {
        beforeEach {
          let movie = MovieListPresentation(
            backdrop: URL(string: "http://urlimage.com.br"),
            date: "05/05/2019",
            description: "Text Description",
            genres: "Text Genre",
            poster: URL(string: "http://urlimage.com.br"),
            titlte: "Text Tile"
          )
          view = router.build(movie: movie)
        }
        it("should return a view controller") {
          expect(view).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}
