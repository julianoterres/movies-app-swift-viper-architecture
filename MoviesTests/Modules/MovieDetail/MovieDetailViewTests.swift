//
//  MovieDetailViewTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Movies

// MARK: Methods of MovieDetailViewTests
class MovieDetailViewTests: QuickSpec {
  
  override func spec() {
    
    var view: MovieDetailView!
    
    describe("MovieDetailView") {
      
      beforeEach {
        let movie = MovieListPresentation(
          backdrop: URL(string: "http://urlimage.com.br"),
          date: "05/05/2019",
          description: "Text Description",
          genres: "Text Genre",
          poster: URL(string: "http://urlimage.com.br"),
          titlte: "Text Title"
        )
        view = MovieDetailView()
        view.movie = movie
      }
      
      describe("When MovieDetailView execute the method viewDidLoad") {
        beforeEach {
          view.viewDidLoad()
        }
        it("should the elements be set with values") {
          expect(view.titleLabel.text) == "Text Title"
          expect(view.dateLabel.text) == "05/05/2019"
          expect(view.genreLabel.text) == "Text Genre"
          expect(view.descriptionLabel.text) == "Text Description"
        }
      }
      
    }
    
  }
  
}
