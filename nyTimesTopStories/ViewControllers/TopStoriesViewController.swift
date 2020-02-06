//
//  TopStoriesViewController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {

    private let newsFeedView = TopStoriesView()
     
     override func loadView() {
       view = newsFeedView
     }
     
     override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .systemBackground
       newsFeedView.collectionView.dataSource = self
       newsFeedView.collectionView.delegate = self
       newsFeedView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCell")
     }
   }

   extension TopStoriesViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 50
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCell", for: indexPath)
       cell.backgroundColor = .white
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
    
}
