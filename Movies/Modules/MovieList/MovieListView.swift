//
//  MovieListView.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of MovieListView
class MovieListView: UIViewController {
  
  let loader = UIActivityIndicatorView()
  let searchBar = UISearchBar()
  var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  
  var presenter: MovieListViewToPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
  }
  
  func setupView() {
    title = "Movies List"
    view.backgroundColor = .background
    hideKeyboardWhenTappedAround()
    setupBackButton()
    navigationController?.setup()
  }
  
  func addElementsInScreen() {
    addSearchBar()
    addCollectionView()
  }
  
  func addLoader() {
    view.addSubview(loader)
    loader.color = .black
    loader.startAnimating()
    loader.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
    loader.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    loader.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
  }
  
  func addSearchBar() {
    view.addSubview(searchBar)
    searchBar.backgroundImage = UIImage()
    searchBar.delegate = self
    searchBar.placeholder = "Enter artist name"
    searchBar.setupFont()
    searchBar.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    searchBar.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 7)
    searchBar.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 7)
    searchBar.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 44)
  }
  
  func addCollectionView() {
    view.addSubview(collectionView)
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .background
    collectionView.register(MovieListCell.self, forCellWithReuseIdentifier: MovieListCell.identifier)
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    collectionView.addConstraint(attribute: .top, alignElement: searchBar, alignElementAttribute: .bottom, constant: 0)
    collectionView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    collectionView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    collectionView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
}

// MARK: Methods of MovieListPresenterToViewProtocol
extension MovieListView: MovieListPresenterToViewProtocol {
  
  func showMovies() {
    
  }
  
  func showError() {
    
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension MovieListView: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell {
      cell.setup()
      return cell
    }
    return UICollectionViewCell()
  }
  
}

// MARK: Methods of UICollectionViewDelegateFlowLayout
extension MovieListView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let divider: CGFloat = (UIDevice.current.orientation.isLandscape) ? 2 : 1
    let width = (collectionView.frame.width / divider)
    let height = MovieListCell.height
    return CGSize(width: width, height: height)
  }
  
}

// MARK: Methods of UISearchBarDelegate
extension MovieListView: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    dismissKeyboard()
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    collectionView.isUserInteractionEnabled = false
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    collectionView.isUserInteractionEnabled = true
  }
  
}
