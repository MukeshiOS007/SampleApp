import UIKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var setViewModel: TeamListController = {
        return TeamListController(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray.withAlphaComponent(8.0)
        title = "Match"
        setupConstraints()
        self.collectionView.accessibilityIdentifier = "load-List"
        collectionView.delegate = setViewModel
        collectionView.dataSource = setViewModel
    }
    
    func setupConstraints() {
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }

}

