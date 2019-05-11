//
//  UINavigationControllerExtension.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  func setup() {
    navigationBar.tintColor = .backButton
    navigationBar.barTintColor = .background
    navigationBar.isTranslucent = false
    navigationBar.setValue(true, forKey: "hidesShadow")
    navigationBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.title,
      NSAttributedString.Key.font: UIFont.fontBold20
    ]
  }
  
  func transparent() {
    navigationBar.isTranslucent = true
    navigationBar.backgroundColor = UIColor.clear
    navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationBar.shadowImage = UIImage()
    navigationBar.setValue(true, forKey: "hidesShadow")
    if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
    statusBar.backgroundColor = UIColor.clear
    }
  }
  
}
