import UIKit

class GNSlider: UISlider {
    
    // MARK: Initializers
    override init(frame: CGRect) { super.init(frame: frame) }
    
    
    required init?(coder: NSCoder) { fatalError() }
   
   
    // MARK: Override Methods
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 5.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
}
