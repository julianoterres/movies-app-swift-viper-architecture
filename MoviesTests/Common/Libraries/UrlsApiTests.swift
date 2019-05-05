//
//  UrlsApiTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of UrlsApiTests
class UrlsApiTests: QuickSpec {
  
  override func spec() {
    
    var urlsApi: UrlsApi!
    
    describe("UrlsApi") {
      
      beforeEach {
        urlsApi = UrlsApi()
      }
      
      describe("When get the variable upcoming") {
        it("should return a string") {
          expect(urlsApi.upcoming()) == "https://api.themoviedb.org/3/movie/upcoming"
        }
      }
      
      describe("When get the variable search") {
        it("should return a string") {
          expect(urlsApi.search()) == "https://api.themoviedb.org/3/search/movie"
        }
      }
      
      describe("When get the variable genres") {
        it("should return a string") {
          expect(urlsApi.genres()) == "https://api.themoviedb.org/3/genre/movie/list"
        }
      }
      
    }
    
  }
  
}
