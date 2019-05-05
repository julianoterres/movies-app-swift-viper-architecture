//
//  MovieDetailView.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailView: UIViewController {
  
  let scrollView = UIScrollView()
  let backdropImage = UIImageView()
  let posterImage = UIImageView()
  let titleLabel = UILabel()
  let descriptionLabel = UILabel()
  let dateLabel = UILabel()
  let genreContainer = UIView()
  let genreLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
  }
  
  func setupView() {
    title = "Movie Detail"
    view.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    addScrollView()
    addBackdropImage()
    addPosterImage()
    addDateLabel()
    addGenreContainer()
    addGenreLabel()
    addTitleLabel()
    addDescriptionLabel()
  }
  
  func addScrollView() {
    view.addSubview(scrollView)
    scrollView.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    scrollView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    scrollView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    scrollView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
  func addBackdropImage() {
    scrollView.addSubview(backdropImage)
    backdropImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w1000_and_h563_face/jC1KqsFx8ZyqJyQa2Ohi7xgL7XC.jpg")!)
    backdropImage.clipsToBounds = true
    backdropImage.contentMode = .scaleAspectFill
    backdropImage.addConstraint(attribute: .top, alignElement: scrollView, alignElementAttribute: .top, constant: 0)
    backdropImage.addConstraint(attribute: .right, alignElement: scrollView, alignElementAttribute: .right, constant: 0)
    backdropImage.addConstraint(attribute: .left, alignElement: scrollView, alignElementAttribute: .left, constant: 0)
    backdropImage.addConstraint(attribute: .centerX, alignElement: scrollView, alignElementAttribute: .centerX, constant: 0)
    backdropImage.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 250)
  }
  
  func addPosterImage() {
    scrollView.addSubview(posterImage)
    posterImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w185_and_h278_bestv2/lUFK7ElGCk9kVEryDJHICeNdmd1.jpg")!)
    posterImage.clipsToBounds = true
    posterImage.contentMode = .scaleAspectFill
    posterImage.addConstraint(attribute: .top, alignElement: backdropImage, alignElementAttribute: .bottom, constant: -80)
    posterImage.addConstraint(attribute: .left, alignElement: scrollView, alignElementAttribute: .left, constant: 15)
    posterImage.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 110)
    posterImage.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 160)
  }
  
  func addDateLabel() {
    scrollView.addSubview(dateLabel)
    dateLabel.text = "Data Lançamento"
    dateLabel.font = .fontBold20
    dateLabel.textColor = .title
    dateLabel.numberOfLines = 0
    dateLabel.addConstraint(attribute: .top, alignElement: backdropImage, alignElementAttribute: .bottom, constant: 15)
    dateLabel.addConstraint(attribute: .left, alignElement: posterImage, alignElementAttribute: .right, constant: 15)
  }
  
  func addGenreContainer() {
    scrollView.addSubview(genreContainer)
    genreContainer.backgroundColor = .category
    genreContainer.layer.cornerRadius = 4
    genreContainer.addConstraint(attribute: .bottom, alignElement: posterImage, alignElementAttribute: .bottom, constant: 0)
    genreContainer.addConstraint(attribute: .left, alignElement: dateLabel, alignElementAttribute: .left, constant: 0)
  }
  
  func addGenreLabel() {
    genreContainer.addSubview(genreLabel)
    genreLabel.textColor = .white
    genreLabel.font = .fontRegular11
    genreLabel.text = "Category name"
    genreLabel.addConstraint(attribute: .top, alignElement: genreContainer, alignElementAttribute: .top, constant: 5)
    genreLabel.addConstraint(attribute: .left, alignElement: genreContainer, alignElementAttribute: .left, constant: 5)
    genreLabel.addConstraint(attribute: .right, alignElement: genreContainer, alignElementAttribute: .right, constant: 5)
    genreLabel.addConstraint(attribute: .bottom, alignElement: genreContainer, alignElementAttribute: .bottom, constant: 5)
  }
  
  func addTitleLabel() {
    scrollView.addSubview(titleLabel)
    titleLabel.text = "Sinopse"
    titleLabel.font = .fontBold20
    titleLabel.textColor = .title
    titleLabel.numberOfLines = 0
    titleLabel.addConstraint(attribute: .top, alignElement: posterImage, alignElementAttribute: .bottom, constant: 15)
    titleLabel.addConstraint(attribute: .right, alignElement: scrollView, alignElementAttribute: .right, constant: 15)
    titleLabel.addConstraint(attribute: .left, alignElement: scrollView, alignElementAttribute: .left, constant: 15)
    titleLabel.addConstraint(attribute: .centerX, alignElement: scrollView, alignElementAttribute: .centerX, constant: 0)
  }
  
  func addDescriptionLabel() {
    scrollView.addSubview(descriptionLabel)
    descriptionLabel.font = .fontRegular13
    descriptionLabel.textColor = .text
    descriptionLabel.numberOfLines = 0
    descriptionLabel.addConstraint(attribute: .top, alignElement: titleLabel, alignElementAttribute: .bottom, constant: 5)
    descriptionLabel.addConstraint(attribute: .right, alignElement: scrollView, alignElementAttribute: .right, constant: 15)
    descriptionLabel.addConstraint(attribute: .left, alignElement: scrollView, alignElementAttribute: .left, constant: 15)
    descriptionLabel.addConstraint(attribute: .bottom, alignElement: scrollView, alignElementAttribute: .bottom, constant: 15)
    descriptionLabel.addConstraint(attribute: .centerX, alignElement: scrollView, alignElementAttribute: .centerX, constant: 0)
  }
  
}
