//
//  AppRouterTests.swift
//  MoviesTests
//
//  Created by Juliano Terres on 05/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Movies

// MARK: Methods of AppRouterTests
class AppRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: AppRouter!
    var view: UIViewController!
    
    describe("AppRouter") {
      
      beforeEach {
        router = AppRouter()
      }
      
      describe("When AppRouter execute the method buildMainScreen") {
        beforeEach {
          view = router.buildMainScreen()
        }
        it("should return a view controller") {
          expect(view).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}
