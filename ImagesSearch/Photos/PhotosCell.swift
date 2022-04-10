//
//  PhotosCell.swift
//  ImagesSearch
//
//  Created by Серафима  Татченкова  on 01.04.2022.
//

import UIKit
import SDWebImage

class PhotosCell: UICollectionViewCell{
    
    static let reuseId = "PhotosCell"
    
    private let сheckmarkView: UIImageView = {
        let image = UIImage(named: "checkmark.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else {return}
            photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoImageView()
        setupcheckmarkView()
        updateSelectedState()
    }
    
    
    private func updateSelectedState(){
        photoImageView.alpha = isSelected ? 0.7 : 1
        сheckmarkView.alpha = isSelected ? 1 : 0
    }
    
    private func setupPhotoImageView(){
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    private func setupcheckmarkView(){
        addSubview(сheckmarkView)
        сheckmarkView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor,constant: -8).isActive = true
        сheckmarkView.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor,constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
