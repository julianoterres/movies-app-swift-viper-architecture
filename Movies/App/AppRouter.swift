//
//  AppRouter.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

class AppRouter {
  
  func buildMainScreen() -> UIViewController {
    
    let navigation = UINavigationController()
    let movieListView = MovieListRouter().build()
    
    navigation.viewControllers = [movieListView]
    
    return navigation
    
  }
  
}
