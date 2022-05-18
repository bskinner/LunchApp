//
//  StarRatingView.swift
//  LunchApp
//
//  Created by Blake on 2022/5/17.
//

import UIKit

class StarRatingView: UIView {
    // not sure if I want to expose this yet. It's a little heavy handed
    // and I'd like to expand in the future by supporting the full range
    // of values from 0-5
    private enum Rating {
        case zero
        case one
        case two
        case three
        case four
        case five
    }

}
