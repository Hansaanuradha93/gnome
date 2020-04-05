import UIKit

class GNSecondaryTitleLabel: UILabel {

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(fontSize: CGFloat, alignment: NSTextAlignment) {
        self.init(frame: .zero)
        
        let traits          = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]
        var descriptor      = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: "Poppins"])
        descriptor          = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font                = UIFont(descriptor: descriptor, size: fontSize)
        textAlignment       = alignment
    }
    
    
    // MARK: - Methods
    private func configure() {
        
        textColor                   = .black
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.85
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
