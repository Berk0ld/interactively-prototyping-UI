//  Copyright © 2016 CocoaHeads Kharkiv. All rights reserved.

import Foundation
import UIKit

@IBDesignable public final class RatingProxyView: UIView {
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        guard let welcomeViewController = storyboard.instantiateInitialViewController() as? WelcomeViewController
            else { return }
        
        
        welcomeViewController.view.frame = frame        
        let parentViewController = UIViewController(); do {
            parentViewController.view.frame = frame
            parentViewController.view.addSubview(welcomeViewController.view)
            parentViewController.addChildViewController(welcomeViewController)
        }
        
        let traitCollection = UITraitCollection(
            traitsFromCollections: [
                UITraitCollection(horizontalSizeClass: .Compact),
                UITraitCollection(verticalSizeClass: .Compact)])
        
        parentViewController
            .setOverrideTraitCollection(traitCollection,
                                        forChildViewController: welcomeViewController)
        
        let image = UIImage(named: "star",
                            inBundle: bundle,
                            compatibleWithTraitCollection: traitCollection)
        welcomeViewController.ratingView.templateImage = image
        
        addSubview(parentViewController.view)
        layoutIfNeeded()
    }
}
