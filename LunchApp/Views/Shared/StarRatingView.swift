//
//  StarRatingView.swift
//  LunchApp
//
//  Created by Blake on 2022/5/17.
//

import UIKit

class StarRatingView: UIView {
    // not sure if I want to expose this. It's a little heavy handed
    // and I'd like to expand in the future by supporting the full range
    // of values from 0-5
    enum Rating {
        case zero
        case one
        case two
        case three
        case four
        case five

        init(_ value: Float) {
            // Keep an eye out for odd behavior when value approaches 5
            let rounded = Int(value.rounded(.towardZero))

            switch rounded {
            case 0:
                self = .zero
            case 1:
                self = .one
            case 2:
                self = .two
            case 3:
                self = .three
            case 4:
                self = .four
            case 5:
                self = .five
            default:
                // Use .five for now, but think a little more on this.
                // An error, or some other value may be more appropriate.
                self = .five
            }
        }
    }

}
