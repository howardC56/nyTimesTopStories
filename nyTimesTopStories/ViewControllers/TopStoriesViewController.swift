//
//  TopStoriesViewController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence

class TopStoriesViewController: UIViewController {

    private let newsFeedView = TopStoriesView()
    public var dataPersistence: DataPersistence<Article>!
    
    private var newsArticles = [Article]() {
        didSet {
            DispatchQueue.main.async {
                self.newsFeedView.collectionView.reloadData()
            }
        }
    }
     
     override func loadView() {
       view = newsFeedView
     }
     
     override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .systemBackground
       newsFeedView.collectionView.dataSource = self
       newsFeedView.collectionView.delegate = self
       newsFeedView.collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        fetchStories(for: "Business")
     }
    
    private func fetchStories(for section: String) {
        NYTopStoriesAPIClient.fetchTopStories(for: section) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching stories: \(appError)")
            case .success(let articles):
                self?.newsArticles = articles
            }
        }
    }
    
   }

   extension TopStoriesViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell else { fatalError("error with StoriesCollectionViewCell")}
        let article = newsArticles[indexPath.row]
       cell.backgroundColor = .white
       cell.configureCell(with: article)
       return cell
     }
   }

   extension TopStoriesViewController: UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let maxSize: CGSize = UIScreen.main.bounds.size
       let itemWidth: CGFloat = maxSize.width
       let itemHeight: CGFloat = maxSize.height * 0.30
       return CGSize(width: itemWidth, height: itemHeight)
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = newsArticles[indexPath.row]
        let viewController = ArticleDetailViewController()
        viewController.dataPersistence = dataPersistence
        viewController.article = selected
        navigationController?.pushViewController(viewController, animated: true)
    }
}
