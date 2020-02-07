//
//  StoriesCollectionViewCell.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import ImageKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var articleTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.text = "Article Title"
        return title
    }()
    
    public lazy var headline: UILabel = {
        let title = UILabel()
        title.numberOfLines = 3
        title.font = UIFont.preferredFont(forTextStyle: .subheadline)
        title.text = "Abstract Headline"
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        imageViewConstraints()
        articleTitleConstraints()
        headlineConstraints()
    }
    
    private func imageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20), imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30), imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor) ])
    }
    
    private func articleTitleConstraints() {
        addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([articleTitle.topAnchor.constraint(equalTo: imageView.topAnchor), articleTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8), articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
    }
    
    private func headlineConstraints() {
        addSubview(headline)
        headline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headline.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8), headline.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor), headline.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor)])
    }
    
    public func configureCell(with article: Article) {
        articleTitle.text = article.title
        headline.text = article.abstract
        imageView.getImage(with: article.getArticleImageUrl(.thumbLarge)) { [weak self ](result) in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    self?.imageView.image = UIImage(systemName: "exclamationmark-octagon")
                case .success(let image):
                    self?.imageView.image = image
                }
            }
            
        }
    }
}
