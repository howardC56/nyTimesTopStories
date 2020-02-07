//
//  ArticleDetailView.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class ArticleDetailView: UIView {

    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var headline: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.preferredFont(forTextStyle: .subheadline)
        title.text = "Abstract Headline"
        return title
    }()
    
    override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    private func commonInit() {
     imageViewConstraints()
        headlineConstraints()
    }
    
    private func imageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10), imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10), imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10), imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40)])
    }
    
    private func headlineConstraints() {
        addSubview(headline)
        headline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headline.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10), headline.leadingAnchor.constraint(equalTo: imageView.leadingAnchor), headline.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)])
    }

}
