

import UIKit

class ViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let image = UIImage(named: "lighthouse")
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var customSearchController = UISearchController(searchResultsController: nil)
    
    private let searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    

    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
        let mainTabBarController = MainTabBarController()
        self.present(mainTabBarController, animated: true, completion: nil)
        
    }
    
//    private let searchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.frame = CGRect(x: 15, y: 100, width: 350, height: 50)
//        searchBar.placeholder = "Search images, vectors and more"
//        searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
//        searchBar.backgroundColor = UIColor.clear
//        searchBar.setPositionAdjustment(UIOffset(horizontal: -20, vertical: 0), for: .search)
//        let searchTextFieException: UITextField = searchBar.subviews[0].subviews.last as! UITextField
//        searchTextField.layer.cornerRadius = 15
//        searchTextField.textAlignment = NSTextAlignment.left
//        let image:UIImage = UIImage(named: "search")!
//        let imageView:UIImageView = UIImageView.init(image: image)
//        searchTextField.leftView = nil
//        searchTextField.placeholder = "Search"
//        searchTextField.rightView = imageView
//        searchTextField.rightViewMode = UITextField.ViewMode.always
//        return searchBar
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        setupSearchBar()
        setupSearchButton()
    }
    
    private func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
    
    private func setupSearchButton() {
        view.addSubview(searchButton)
//        searchButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
//        searchButton.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
    }
    
    

    private func setupSearchBar() {
        view.addSubview(customSearchController.searchBar)
        customSearchController.searchBar.placeholder = "Search"
        customSearchController.searchBar.searchBarStyle = .minimal
        customSearchController.searchBar.backgroundColor = .white
//        customSearchController.searchBar.barTintColor = .white
        customSearchController.searchBar.layer.cornerRadius = 15.0
        customSearchController.searchBar.layer.borderWidth = 1.0;
        
        customSearchController.searchBar.frame = CGRect(x: 10, y: 250, width: 250, height: 50)
//        customSearchController.searchBar.sizeToFit()
//        navigationItem.searchController = customSearchController
//        searchBar.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 40).isActive = true
//        searchBar.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 20).isActive = true
    }
}

