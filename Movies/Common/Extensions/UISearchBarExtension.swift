//
//  UISearchBarExtension.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UISearchBar {
  
  func setupFont() {
    
    if let textFieldInsideUISearchBar = self.value(forKey: "searchField") as? UITextField {
      textFieldInsideUISearchBar.font = .fontRegular13
    }
    
  }
  
}
