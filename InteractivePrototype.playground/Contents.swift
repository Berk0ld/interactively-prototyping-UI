//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let ratingView = RatingView()
ratingView.templateImage = [#Image(imageLiteral: "star.png")#]
ratingView.count = 1

let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.addSubview(ratingView)

XCPlaygroundPage.currentPage.liveView = view
