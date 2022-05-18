//
//  AtLunchViewController.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/11/22.
//

import Logging
import TinyConstraints
import UIKit

class AtLunchViewController: UIViewController {
    private var searchHeader: AtLunchHeader!

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchHeader = AtLunchHeader()
        searchHeader.filterButton.addTarget(self, action: #selector(showFilter(sender:)), for: .touchUpInside)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // IF the map is being presented, ask for the user's location.
        // If not, wait until the user taps the search button.
    }
}

// MARK: Internal Methods
extension AtLunchViewController {
    @IBAction
    func showFilter(sender: UIButton) {
        NSLog("Got a filter!")
    }
}
