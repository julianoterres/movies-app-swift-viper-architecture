//
//  UIColorExtensionTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of UIColorExtensionTests
class UIColorExtensionTests: QuickSpec {
  
  override func spec() {
    
    describe("UIColor") {
      
      describe("When get the color background") {
        it("should return a color #F5F6F8") {
          expect(UIColor.background) == UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1.0)
        }
      }
      
      describe("When get the color title") {
        it("should return a color #2C2D2F") {
          expect(UIColor.title) == UIColor(red: 0.17, green: 0.18, blue: 0.18, alpha: 1.0)
        }
      }
      
      describe("When get the color text") {
        it("should return a color #5C5C5C") {
          expect(UIColor.text) == UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1.0)
        }
      }
      
      describe("When get the color category") {
        it("should return a color #2863EC") {
          expect(UIColor.category) == UIColor(red: 0.16, green: 0.39, blue: 0.93, alpha: 1.0)
        }
      }
      
      describe("When get the color backButton") {
        it("should return a color #2863EC") {
          expect(UIColor.backButton) == UIColor(red: 0.16, green: 0.39, blue: 0.93, alpha: 1.0)
        }
      }
      
      describe("When get the color date") {
        it("should return a color #3C5B68") {
          expect(UIColor.date) == UIColor(red: 0.24, green: 0.36, blue: 0.41, alpha: 1.0)
        }
      }
      
      describe("When get the color shadowBox") {
        it("should return a color UIColor(red:0.59, green:0.63, blue:0.80, alpha:0.3)") {
          expect(UIColor.shadowBox) == UIColor(red: 0.59, green: 0.63, blue: 0.80, alpha: 0.3)
        }
      }
      
    }
    
  }
  
}
