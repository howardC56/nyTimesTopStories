//
//  ArticleDetailViewController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    public var article: Article?
    let articleView = ArticleDetailView()
    
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
        
    }
    
    private func updateUI() {
        guard let article = article else {
            fatalError("did not load article")
        }
        navigationItem.title = article.title
    }

 

}
