//
//  EnumDefinitionsTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of EnumDefinitionsTests
class EnumDefinitionsTests: QuickSpec {
  
  override func spec() {
    
    describe("EnumDefinitions") {
      
      describe("When ImagesBaseUrlEnum call the case poster185") {
        it("should return a base url poster to image size 185") {
          expect(ImagesBaseUrlEnum.poster185.rawValue) == "https://image.tmdb.org/t/p/w185"
        }
      }
      
      describe("When ImagesBaseUrlEnum call the case backdrop500") {
        it("should return a base url backdrop to image size 500") {
          expect(ImagesBaseUrlEnum.backdrop500.rawValue) == "https://image.tmdb.org/t/p/w500"
        }
      }
      
    }
    
  }
  
}
