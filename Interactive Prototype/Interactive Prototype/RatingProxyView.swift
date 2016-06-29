//  Copyright © 2016 CocoaHeads Kharkiv. All rights reserved.

import Foundation
import UIKit

@IBDesignable public final class RatingProxyView: UIView {
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        // View controller with RatingView
        guard let welcomeViewController = storyboard.instantiateInitialViewController() as? WelcomeViewController
            else { return }
        welcomeViewController.view.frame = frame
        
        // View controller as parent for welcome view controller
        let parentViewController = UIViewController(); do {
            parentViewController.view.frame = frame
            parentViewController.view.addSubview(welcomeViewController.view)
            parentViewController.addChildViewController(welcomeViewController)
        }
        
        // Create trait collection you want to test
        let traitCollection = UITraitCollection(
            traitsFromCollections: [
                UITraitCollection(horizontalSizeClass: .Compact),
                UITraitCollection(verticalSizeClass: .Compact)])
        
        // Here you override it
        parentViewController
            .setOverrideTraitCollection(traitCollection,
                                        forChildViewController: welcomeViewController)
        
        addSubview(parentViewController.view)
    }
}
