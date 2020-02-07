//
//  SavedStoriesViewController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence

class SavedStoriesViewController: UIViewController {

    public var dataPersistence: DataPersistence<Article>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SavedStoriesViewController: DataPersistenceDelegate {
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("delete")
    }
    
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("save")
    }
}
