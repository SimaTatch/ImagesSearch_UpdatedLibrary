//
//  LikesCollectionViewCell.swift
//  ImagesSearch
//
//  Created by Серафима Татченкова on 08.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class LikesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LikesCollectionViewCell"
    
    var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let сheckmarkView: UIImageView = {
        let image = UIImage(named: "checkmark.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupImageView()
        setupcheckmarkView()
        updateSelectedState()
    }
    
    private func updateSelectedState(){
        myImageView.alpha = isSelected ? 0.7 : 1
        сheckmarkView.alpha = isSelected ? 1 : 0
    }
    
    func setupImageView() {
        addSubview(myImageView)
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupcheckmarkView(){
        addSubview(сheckmarkView)
        сheckmarkView.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor,constant: -8).isActive = true
        сheckmarkView.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor,constant: -8).isActive = true
    }
    
    func set(photo: UnsplashPhoto) {
        let photoUrl = photo.urls["full"]
        guard let photoURL = photoUrl, let url = URL(string: photoURL) else { return }
        myImageView.sd_setImage(with: url, completed: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
