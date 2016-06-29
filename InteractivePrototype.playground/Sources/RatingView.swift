//  Copyright © 2016 CocoaHeads Kharkiv. All rights reserved.

import Foundation
import UIKit

@IBDesignable public final class RatingView: UIView {
    @IBInspectable public var count: UInt = 5 {
        didSet { update() }
    }
    @IBInspectable public var templateImage: UIImage? = nil {
        didSet { update() }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private var items: [UIImageView] = []
    
    func setup() {
        for _ in 1...count {
            let item = UIImageView()
            items.append(item)
            addSubview(item)
        }
    }
    
    func reset() { items = [] }
    
    func update() {
        reset()
        setup()
        setNeedsLayout()
    }
    
    public override func intrinsicContentSize() -> CGSize {
        guard let image = templateImage else { return CGSizeZero }
        return CGSize(width: image.size.width * CGFloat(count),
                      height: image.size.height)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        var offsetX = 0.0 as CGFloat
        for item in items {
            item.image = templateImage
            item.sizeToFit()
            guard let size = templateImage?.size else { return }
            item.frame = CGRect(origin: CGPoint(x: offsetX, y: 0),
                                size: size)
            offsetX += size.width
        }
    }
}
