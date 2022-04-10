//
//  MainTabBarController.swift
//  ImagesSearch
//
//  Created by Серафима  Татченкова  on 28.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: WaterfallLayout())
        let likesVC = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(named: "photo")!),
            generateNavigationController(rootViewController: likesVC, title: "Favourites", image: UIImage(named: "heart")!)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
