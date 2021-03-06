import UIKit

class GNBodyLabel: UILabel {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.regular]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.poppins])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font = UIFont(descriptor: descriptor, size: fontSize)
    }
}


// MARK: - Fileprivate Methods
fileprivate extension GNBodyLabel {
    
    func configure() {
        textColor = .black
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byTruncatingTail
    }
}
