//
//  StringExtension.swift
//  Movies
//
//  Created by Juliano Terres on 04/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

extension String {
  
  var convetDatePtBr: String {
    return self.split(separator: "-").reversed().joined(separator: "/")    
  }
  
}
