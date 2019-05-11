//
//  UIFontExtensionTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import Movies

// MARK: Methods of UIFontExtensionTests
class UIFontExtensionTests: QuickSpec {
  
  override func spec() {
    
    describe("UIFonts") {
      
      describe("When get the font fontBold20") {
        it("should return a font Nunito-Bold with size 20") {
          expect(UIFont.fontBold20) == UIFont(name: "Nunito-Bold", size: 20)!
        }
      }
      
      describe("When get the font fontBold17") {
        it("should return a font Nunito-Bold with size 17") {
          expect(UIFont.fontBold17) == UIFont(name: "Nunito-Bold", size: 17)!
        }
      }
      
      describe("When get the font fontBold12") {
        it("should return a font Nunito-Bold with size 12") {
          expect(UIFont.fontBold12) == UIFont(name: "Nunito-Bold", size: 12)!
        }
      }
      
      describe("When get the font fontRegular13") {
        it("should return a font Nunito-Regular with size 13") {
          expect(UIFont.fontRegular13) == UIFont(name: "Nunito-Regular", size: 13)!
        }
      }
      
      describe("When get the font fontRegular11") {
        it("should return a font Nunito-Regular with size 11") {
          expect(UIFont.fontRegular11) == UIFont(name: "Nunito-Regular", size: 11)!
        }
      }
      
    }
    
  }
  
}
