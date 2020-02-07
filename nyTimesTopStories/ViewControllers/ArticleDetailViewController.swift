//
//  ArticleDetailViewController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import ImageKit
import DataPersistence

class ArticleDetailViewController: UIViewController {

    public var article: Article?
    private let articleView = ArticleDetailView()
    public var dataPersistence: DataPersistence<Article>!
    
    override func loadView() {
        view = articleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(saveArticlePressed(_:)))
       
    }
    
    @objc func saveArticlePressed(_ sender: UIBarButtonItem) {
        guard let article = article else { return }
        do {
        try dataPersistence.createItem(article)
        } catch {
            print("error saving article: \(error)")
    }
    }
    
    private func updateUI() {
        guard let article = article else {
            fatalError("did not load article")
        }
        navigationItem.title = article.title
        articleView.headline.text = article.abstract
        articleView.imageView.getImage(with: article.getArticleImageUrl(.superJumbo)) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    self?.articleView.imageView.image = UIImage(systemName: "exclamationmark-octogon")
                case .success(let image):
                    self?.articleView.imageView.image = image
                }
            }
            
        }
    }

 

}
