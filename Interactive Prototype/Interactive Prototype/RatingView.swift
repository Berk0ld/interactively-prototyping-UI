//  Copyright © 2016 CocoaHeads Kharkiv. All rights reserved.

import Foundation
import UIKit

@IBDesignable public final class RatingView: UIView {
    @IBInspectable var count: UInt = 5 {
        didSet { update() }
    }
    @IBInspectable var templateImage: UIImage? = nil {
        didSet { update() }
    }
    
    func reset() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func update() {
        reset()
        setNeedsLayout()
    }
    
    public override func intrinsicContentSize() -> CGSize {
        guard let image = templateImage else { return CGSizeZero }
        return CGSize(width: image.size.width * CGFloat(count),
                      height: image.size.height)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard subviews.count == 0 else { return }
        
        var offsetX = 0.0 as CGFloat
        for _ in 1...count {
            let item = UIImageView(image: templateImage)
            addSubview(item)

            guard let size = templateImage?.size else { return }
            item.frame = CGRect(origin: CGPoint(x: offsetX, y: 0),
                                size: size)
            offsetX += size.width
        }
    }
}
