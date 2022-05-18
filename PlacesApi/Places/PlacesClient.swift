//
//  PlacesClient.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/14/22.
//

import Foundation

class PlacesClient {
    public private(set) let apiBase: URL
    private let configuration: URLSessionConfiguration
    private let session: URLSession

    init(base: URL, configuration: URLSessionConfiguration = URLSessionConfiguration.ephemeral) {
        self.apiBase = base
        self.configuration = configuration
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }
}


extension PlacesClient {
    public func findPlace(text: String, fields: PlaceFields, )
}
