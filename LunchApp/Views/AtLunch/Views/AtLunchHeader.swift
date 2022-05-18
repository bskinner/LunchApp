//
//  AtLunchHeader.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/15/22.
//

import UIKit

class AtLunchHeader: UIView {
    var imageView = UIImageView()
    var filterButton = UIButton()
    var searchField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

}

// MARK: Internal Methods
extension AtLunchHeader {
    private func setupView() {
        imageView.image = Asset.atlLogo.image
        addSubview(imageView)

        filterButton.setTitle(L10n.Button.Filter.title, for: .normal)
        addSubview(filterButton)

        searchField.placeholder = L10n.Field.Search.placeholder
        addSubview(searchField)
    }
}
