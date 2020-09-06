import UIKit

class SongContainerVC: UIViewController {

    // MARK: Properties
    private let viewModel = SongContainerVM()
    
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel = GNTitleLabel(fontSize: 20, alignment: .center)
    private let artistLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .center)
    private let albumTitleLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .center, fontColor: UIColor.appColor(.Pretty_Pink))
    
    private var songs: [Song]!
    private var index: Int!
    private var playerContainerVC: PlayerContainerVC!
    
    
    // MARK: Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(songs: [Song], index: Int,controller: PlayerContainerVC) {
        self.init()
        self.songs = songs
        self.index = index
        self.playerContainerVC = controller
    }
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        configureAlbumTitleLabel()
//        configureThumbnailImageView()
//        configureSongTitleLabel()
//        configureArtistLabel()
        configurePlayerContainerVC()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI(with: songs[index])
    }
}


// MARK: - Methods
extension SongContainerVC {
    
    private func configurePlayerContainerVC() {
        playerContainerVC.playerContainerDelegate = self
    }
    
    
    private func setupUI(with song: Song?) {
        guard let song = song else { return }
        albumTitleLabel.text = song.album
        thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
        songTitleLabel.text = song.title
        artistLabel.text = song.artist
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(albumTitleLabel)
        view.addSubview(thumbnailImageView)
        view.addSubview(songTitleLabel)
        view.addSubview(artistLabel)
        
        artistLabel.alpha = 0.6
        let dimensions: CGFloat = view.frame.width - 60
                
        albumTitleLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil)
        albumTitleLabel.centerHorizontallyInSuperView()
        thumbnailImageView.anchor(top: albumTitleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 29, left: 0, bottom: 0, right: 0))
        thumbnailImageView.centerHorizontallyInSuperView(size: .init(width: dimensions, height: dimensions))
        songTitleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        songTitleLabel.centerHorizontallyInSuperView()
        artistLabel.anchor(top: songTitleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0))
        artistLabel.centerHorizontallyInSuperView()
    }
    
    
//    private func configureAlbumTitleLabel() {
//        view.addSubview(albumTitleLabel)
//
//        NSLayoutConstraint.activate([
//            albumTitleLabel.topAnchor.constraint(equalTo: view.topAnchor),
//            albumTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
    
    
//    private func configureThumbnailImageView() {
//        let padding: CGFloat = 29
//        view.addSubview(thumbnailImageView)
//
//        NSLayoutConstraint.activate([
//            thumbnailImageView.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: padding),
//            thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            thumbnailImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            thumbnailImageView.heightAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//    }
    
    
//    private func configureSongTitleLabel() {
//        view.addSubview(songTitleLabel)
//
//        NSLayoutConstraint.activate([
//            songTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 30),
//            songTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
    
    
//    private func configureArtistLabel() {
//        view.addSubview(artistLabel)
//        artistLabel.alpha = 0.6
//
//        NSLayoutConstraint.activate([
//            artistLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 3),
//            artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
}


// MARK: - PlayerContainerDelegate
extension SongContainerVC: PlayerContainerDelegate {
    
    func buttonPressed(index: Int) { setupUI(with: songs[index]) }
}
