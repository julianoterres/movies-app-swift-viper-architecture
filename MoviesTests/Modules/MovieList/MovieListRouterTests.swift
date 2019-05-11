//
//  MovieListRouterTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of MovieListRouterTests
class MovieListRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: MovieListRouter!
    var view: UIViewController!
    
    describe("MovieListRouter") {
      
      beforeEach {
        router = MovieListRouter()
      }
      
      describe("When MovieListRouter execute the method build") {
        beforeEach {
          view = router.build()
        }
        it("should return a view controller") {
          expect(view).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}
