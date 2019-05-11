//
//  MovieListCell.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Methods of MovieListCell
class MovieListCell: UICollectionViewCell {
  
  let containerView = UIView()
  let imagePoster = UIImageView()
  let titleLabel = UILabel()
  let shortDescritionContainer = UIView()
  let shortDescritionLabel = UILabel()
  let dateLabel = UILabel()
  let genreContainer = UIView()
  let genreLabel = UILabel()
  
  static let height = CGFloat(300)
  static let identifier = "MovieListCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addElementsInScreen()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup(movie: MovieListPresentation) {
    imagePoster.kf.setImage(with: movie.poster, placeholder: UIImage().placeholder())
    titleLabel.text = movie.titlte
    shortDescritionLabel.text = movie.description
    dateLabel.text = movie.date
    genreLabel.text = movie.genres
  }
  
  func addElementsInScreen() {
    addContainerView()
    addImagePoster()
    addTitleLabel()
    addDateLabel()
    addShortDescritionContainer()
    addShortDescritionLabel()
    addGenreContainer()
    addGenreLabel()
  }
  
  func addContainerView() {
    contentView.addSubview(containerView)
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 12
    containerView.layer.shadowColor = UIColor.shadowBox.cgColor
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowOffset = .zero
    containerView.layer.shadowRadius = 10
    containerView.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 15)
    containerView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 15)
    containerView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 15)
    containerView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 15)
  }
  
  func addImagePoster() {
    containerView.addSubview(imagePoster)
    imagePoster.layer.cornerRadius = 12
    imagePoster.clipsToBounds = true
    imagePoster.contentMode = .scaleAspectFill
    imagePoster.kf.indicatorType = .activity
    imagePoster.addConstraint(attribute: .top, alignElement: containerView, alignElementAttribute: .top, constant: 15)
    imagePoster.addConstraint(attribute: .left, alignElement: containerView, alignElementAttribute: .left, constant: 15)
    imagePoster.addConstraint(attribute: .bottom, alignElement: containerView, alignElementAttribute: .bottom, constant: 15)
    imagePoster.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 150)
    imagePoster.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 200)
  }
  
  func addTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.textColor = .title
    titleLabel.font = .fontBold17
    titleLabel.numberOfLines = 0
    titleLabel.addConstraint(attribute: .top, alignElement: containerView, alignElementAttribute: .top, constant: 15)
    titleLabel.addConstraint(attribute: .left, alignElement: imagePoster, alignElementAttribute: .right, constant: 15)
    titleLabel.addConstraint(attribute: .right, alignElement: containerView, alignElementAttribute: .right, constant: 15)
  }
  
  func addDateLabel() {
    containerView.addSubview(dateLabel)
    dateLabel.textColor = .date
    dateLabel.font = .fontBold12
    dateLabel.numberOfLines = 0
    dateLabel.addConstraint(attribute: .top, alignElement: titleLabel, alignElementAttribute: .bottom, constant: 5)
    dateLabel.addConstraint(attribute: .left, alignElement: titleLabel, alignElementAttribute: .left, constant: 0)
    dateLabel.addConstraint(attribute: .right, alignElement: containerView, alignElementAttribute: .right, constant: 0)
  }
  
  func addShortDescritionContainer() {
    containerView.addSubview(shortDescritionContainer)
    shortDescritionContainer.clipsToBounds = true
    shortDescritionContainer.addConstraint(attribute: .top, alignElement: dateLabel, alignElementAttribute: .bottom, constant: 5)
    shortDescritionContainer.addConstraint(attribute: .left, alignElement: imagePoster, alignElementAttribute: .right, constant: 15)
    shortDescritionContainer.addConstraint(attribute: .right, alignElement: containerView, alignElementAttribute: .right, constant: 15)
  }
  
  func addShortDescritionLabel() {
    shortDescritionContainer.addSubview(shortDescritionLabel)
    shortDescritionLabel.textColor = .text
    shortDescritionLabel.font = .fontRegular13
    shortDescritionLabel.numberOfLines = 0
    shortDescritionLabel.addConstraint(attribute: .top, alignElement: shortDescritionContainer, alignElementAttribute: .top, constant: 0)
    shortDescritionLabel.addConstraint(attribute: .left, alignElement: shortDescritionContainer, alignElementAttribute: .left, constant: 0)
    shortDescritionLabel.addConstraint(attribute: .right, alignElement: shortDescritionContainer, alignElementAttribute: .right, constant: 0)
  }
  
  func addGenreContainer() {
    containerView.addSubview(genreContainer)
    genreContainer.backgroundColor = .category
    genreContainer.layer.cornerRadius = 4
    genreContainer.addConstraint(attribute: .top, alignElement: shortDescritionContainer, alignElementAttribute: .bottom, constant: 22)
    genreContainer.addConstraint(attribute: .left, alignElement: imagePoster, alignElementAttribute: .right, constant: 15)
    genreContainer.addConstraint(attribute: .right, alignElement: containerView, alignElementAttribute: .right, constant: 15)
    genreContainer.addConstraint(attribute: .bottom, alignElement: containerView, alignElementAttribute: .bottom, constant: 15) 
  }
  
  func addGenreLabel() {
    genreContainer.addSubview(genreLabel)
    genreLabel.textColor = .white
    genreLabel.font = .fontRegular11
    genreLabel.numberOfLines = 0
    genreLabel.addConstraint(attribute: .top, alignElement: genreContainer, alignElementAttribute: .top, constant: 5)
    genreLabel.addConstraint(attribute: .left, alignElement: genreContainer, alignElementAttribute: .left, constant: 5)
    genreLabel.addConstraint(attribute: .right, alignElement: genreContainer, alignElementAttribute: .right, constant: 5)
    genreLabel.addConstraint(attribute: .bottom, alignElement: genreContainer, alignElementAttribute: .bottom, constant: 5)
  }
  
}
