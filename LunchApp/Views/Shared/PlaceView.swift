//
//  PlaceView.swift
//  LunchApp
//
//  Created by Blake on 2022/5/17.
//

import UIKit

class PlaceView: UIView {
    private var thumbnail = UIImageView()

    private var restaurantName = UILabel()

    private var rating = StarRatingView()
    private var numberOfReviews = UILabel()

    private var keyInformation = UILabel()

    var model: Model? {
        didSet {
            guard let model = self.model else { return }
            updateView(using: model)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }
}

extension PlaceView {
    public struct Model {
        var thumbnail: UIImage
        var restaurantName: String
        var rating: Float
        var numberOfReviews: Int
        var cost: Int // not a fan. Expose the base type, but replace this with an enum
        var supportingText: String
    }

    private func updateView(using model: Model) {
        thumbnail.image = model.thumbnail
        restaurantName.text = model.restaurantName

        let _ = StarRatingView.Rating(model.rating)

        // Seriously, let the model do this
        let bills = (0..<(model.cost % 3)).map({_ in "$" })

    }
}

// MARK: Internal Methods
extension PlaceView {
    private func setupView() {
        // OK, General structure chat time
        //              [restaurant name]
        //   [image]    [[ratings view] [review count]]
        //              [[$pending] [separator] [supporting text]]
        //
        // Each of the rows on the trailing edge (aside from the restaurant name
        // are going to be stack views in their own right. Can also be done with
        // constraints, but let's get something visible first, then tweak.
        //
        // Keep an eye on performance, especially when this goes into the collection view
        //
        // Also, do something about the magic numbers -_-
        //

        self.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        let detailsStackView = UIStackView()
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .leading
        detailsStackView.distribution = .fillProportionally

        restaurantName.font = UIFont.preferredFont(forTextStyle: .title1)
        restaurantName.textColor = Asset.Colors.textColor.color
        detailsStackView.addArrangedSubview(restaurantName)

        // Reception as in `a manner of being received`
        let receptionStack = UIStackView()
        receptionStack.axis = .horizontal
        receptionStack.alignment = .leading
        receptionStack.distribution = .fillProportionally

        // No special setup needed for the StarRatingView at the moment
        // Maybe add the "highlight" color later?
        receptionStack.addArrangedSubview(rating)

        numberOfReviews.font = UIFont.preferredFont(forTextStyle: .callout)
        numberOfReviews.textColor = Asset.Colors.lightTextColor.color
        receptionStack.addArrangedSubview(numberOfReviews)
        detailsStackView.addArrangedSubview(receptionStack)

        let informationStack = UIStackView()
        informationStack.axis = .horizontal
        informationStack.alignment = .leading
        informationStack.distribution = .fillProportionally



        let rootStackView = UIStackView()
        rootStackView.axis = .horizontal
        rootStackView.alignment = .center
        rootStackView.distribution = .fillProportionally

        thumbnail.size(.init(width: 64, height: 64))
        rootStackView.addArrangedSubview(thumbnail)

    }
}
