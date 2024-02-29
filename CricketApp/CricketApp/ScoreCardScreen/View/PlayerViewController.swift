//
//  PlayerViewController.swift
//  CricketApp
//
//  Created by Netcom on 27/02/24.
//

import UIKit

class PlayerViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(PlayerCell.self, forCellWithReuseIdentifier: String(describing: PlayerCell.self))
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderView.self))
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var setViewModel: PlayerDetailController = {
        return PlayerDetailController(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Scorecard"
        collectionView.delegate = setViewModel
        collectionView.dataSource = setViewModel
        setupConstraints()
    }
    
    func setupConstraints() {
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }


}
