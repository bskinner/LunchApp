//
//  PlacesClient.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/14/22.
//

import Foundation

public enum PlacesError: Error {
    case unknownError(reason: String)
}

public class PlacesClient {
    public let apiBase: URL
    private let apiKey: String
    private let configuration: URLSessionConfiguration
    private let session: URLSession

    init(base: URL, key: String, configuration: URLSessionConfiguration = URLSessionConfiguration.ephemeral) {
        self.apiBase = base
        self.apiKey = key
        self.configuration = configuration
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }

    func request<T>(_ request: T, completion: @escaping ((Result<T.ResponseType, PlacesError>) -> Void)) throws where T: RequestType {
        var urlRequest = try request.request(for: self.apiBase)

        // This next section (where the api key is injected into the request)
        // should be moved to a separate method, at least (may a private extention
        // on URLComponents?)
        guard let url = urlRequest.url else {
            throw PlacesError.unknownError(reason: "missing or invalid url for request")
        }

        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw PlacesError.unknownError(reason: "failed to get components from url")
        }

        var queryItems: [URLQueryItem] = components.queryItems?.filter({ $0.name.caseInsensitiveCompare(QueryKeys.key.rawValue) != .orderedSame }) ?? []
        queryItems.append(.init(name: QueryKeys.key.rawValue, value: self.apiKey))
        components.queryItems = queryItems
        guard let urlWithKey = components.url else {
            throw PlacesError.unknownError(reason: "failed to create url from components")
        }

        urlRequest.url = urlWithKey

    }
}

// MARK: Internal types
extension PlacesClient {
    private enum Header: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
    }

    private enum QueryKeys: String {
        case key
    }
}



