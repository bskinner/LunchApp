//
//  PlacesRoutes.swift
//  PlacesApi
//
//  Created by Blake on 2022/5/17.
//

import Foundation

enum Endpoint {
    case findPlace
    case nearbySearch
    case textSearch

    case details

    var path: String {
        /*
         A quick note about the paths below:
            The final path component ("json", in the below cases) is technically an
            output format parameter to Google. I'm including it in the path itself
            as it'll be unlikely I'll be using anything other than JSON in the near future.
         */
        switch(self) {
        case .findPlace:
            return "maps/api/place/findplacefromtext/json"
        case .nearbySearch:
            return "maps/api/place/nearbysearch/json"
        case .textSearch:
            return "maps/api/place/textsearch/json"
        case .details:
            return "maps/api/place/details/json"
        }
    }
}

enum HttpMethod: String {
    case get
    case post
    case put
}

// MARK: Protocols

typealias RequestType = Requestable & Respondable

protocol Requestable {
    var endpoint: Endpoint { get }
    var route: String { get }
    var method: HttpMethod { get }
    func request(for base: URL) throws -> URLRequest
}

// MARK: -
protocol Respondable {
    associatedtype ResponseType
    func decode(data: Data) throws -> ResponseType
}

extension Respondable where ResponseType: Decodable {
    func decode(data: Data) throws -> ResponseType {
        let decoder = JSONDecoder()
        let response = try decoder.decode(ResponseType.self, from: data)
        return response
    }
}

// MARK: -
protocol JsonRequestable: Requestable {
    associatedtype ContentType: Encodable
    var body: ContentType { get }
}

extension Requestable {
    var route: String {
        return endpoint.path
    }

    func request(for base: URL) -> URLRequest {
        let url = base.appendingPathComponent(self.route)

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }
}

extension JsonRequestable {
    func request(for base: URL) throws -> URLRequest {
        let url = base.appendingPathComponent(self.route)

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let jsonData = try encoder.encode(self.body)
        request.httpBody = jsonData

        return request
    }
}
