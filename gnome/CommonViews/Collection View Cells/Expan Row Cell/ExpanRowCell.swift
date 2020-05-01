import UIKit

class ExpanRowCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID                  = "ExpanRowCell"
    private let titleLabel              = GNTitleLabel(fontSize: 20)
    private var collectionView          : UICollectionView!
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureCollectionView()
        backgroundColor = .red
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ExpanRowCell {
    
    
    private func configureTitleLabel() {
        
        titleLabel.text = "Albums"
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    
    private func configureCollectionView() {
        
        collectionView                                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor                  = .systemBackground
        collectionView.showsHorizontalScrollIndicator   = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection          = .horizontal
        flowLayout.sectionInset             = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing  = 15
        return flowLayout
    }
}
