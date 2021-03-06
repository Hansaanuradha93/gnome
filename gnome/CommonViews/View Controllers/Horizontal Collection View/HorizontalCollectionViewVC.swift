import UIKit

class HorizontalCollectionViewVC: UIViewController {

    // MARK: Properties
    private let viewModel = HorizontalCollectionViewVM()
    
    private var genres = [Genre]()
    private var collectionView: UICollectionView!

    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGenres()
        configureUI()
    }
}


// MARK: - Fileprivate Methods
fileprivate extension HorizontalCollectionViewVC {
    
    func fetchGenres() {
        genres = Genre.fetchGenres()
    }
    
    
    func configureUI() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.reuseID)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
        

    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 2.7
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension HorizontalCollectionViewVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return genres.count }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCell.reuseID, for: indexPath) as! GenresCell
        cell.setup(genre: genres[indexPath.item])
        return cell
    }
}


// MARK: - FlowLayout Delegate
extension HorizontalCollectionViewVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return CGSize(width: 115, height: 50) }
}
