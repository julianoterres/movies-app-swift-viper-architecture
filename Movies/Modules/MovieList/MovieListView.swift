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
  let errorView = ErrorView()
  var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  
  var presenter: MovieListViewToPresenterProtocol?
  var movies: [MovieListPresentation] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    presenter?.fetchMovies(searchText: "")
  }
  
  func setupView() {
    title = "Movies List"
    view.backgroundColor = .background
    hideKeyboardWhenTappedAround()
    setupBackButton()
    navigationController?.setup()
  }
  
  func addElementsInScreen() {
    addLoader()
    addSearchBar()
    addCollectionView()
    addErrorView()
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
    searchBar.placeholder = "Enter movie name"
    searchBar.showsCancelButton = true
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
    collectionView.isHidden = true
    collectionView.register(MovieListCell.self, forCellWithReuseIdentifier: MovieListCell.identifier)
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    collectionView.addConstraint(attribute: .top, alignElement: searchBar, alignElementAttribute: .bottom, constant: 0)
    collectionView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    collectionView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    collectionView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
  func addErrorView() {
    view.addSubview(errorView)
    errorView.addConstraint(attribute: .centerX, alignElement: collectionView, alignElementAttribute: .centerX, constant: 0)
    errorView.addConstraint(attribute: .centerY, alignElement: collectionView, alignElementAttribute: .centerY, constant: 0)
    errorView.isHidden = true
  }
  
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    collectionView.collectionViewLayout.invalidateLayout()
  }
  
  func searchButtonEnableCancel(_ enable: Bool) {
    if let text = searchBar.text, !text.isEmpty {
      searchBar.enableButtonCancel(enable)
    }
  }
  
}

// MARK: Methods of MovieListPresenterToViewProtocol
extension MovieListView: MovieListPresenterToViewProtocol {
  
  func showMovies(moviesList: [MovieListPresentation]) {
    movies = moviesList
    collectionView.reloadData()
    collectionView.isHidden = false
  }
  
  func notResultsFound() {
    errorView.setupWithoutButton(
      title: "Oops! Not found result.",
      text: "Not found results for term\n\"" + (searchBar.text ?? "") + "\" searched"
    )
    collectionView.isHidden = true
    errorView.isHidden = false
  }
  
  func showError() {
    errorView.setupWithButton(
      title: "Oops! We had an unforeseen!",
      text: "Unfortunately we were unable to process\nyour request, please try again.",
      delegate: self
    )
    collectionView.isHidden = true
    errorView.isHidden = false
  }
  
}

// MARK: Methods of ErrorViewProtocol
extension MovieListView: ErrorViewProtocol {
  
  func didPressRetry() {
    errorView.isHidden = true
    presenter?.fetchMovies(searchText: searchBar.text ?? "")
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension MovieListView: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell {
      cell.setup(movie: movies[indexPath.row])
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.goToScreenDetails(movie: movies[indexPath.row])
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > (scrollView.contentSize.height - (scrollView.frame.size.height + MovieListCell.height)) {
      presenter?.fetchMovies(searchText: searchBar.text ?? "")
    }
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
    guard let text = searchBar.text else { return }
    searchButtonEnableCancel(true)
    errorView.isHidden = true
    collectionView.isHidden = true
    collectionView.contentOffset = .zero
    presenter?.fetchMovies(searchText: text)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchButtonEnableCancel(false)
    errorView.isHidden = true
    collectionView.isHidden = true
    collectionView.contentOffset = .zero
    searchBar.text = nil
    presenter?.fetchMovies(searchText: "")
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    collectionView.isUserInteractionEnabled = false
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    collectionView.isUserInteractionEnabled = true
  }
  
}
