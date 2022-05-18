//
//  PlacesRequests.swift
//  PlacesApi
//
//  Created by Blake on 2022/5/17.
//

import Foundation

extension PlacesSearch {
    enum Request {
        struct Find: Requestable, Respondable {
            typealias ResponseType = PlacesSearch.Response
            private enum QueryKeys: String {
                case input
                case inputType = "input_type"
            }

            let endpoint: Endpoint = .findPlace
            let method: HttpMethod = .get

            /**
             The string on which to search. The content is limited to a place's name,
             an address, or a category. Other types of values are not guaranteed to be
             successful.
             */
            let input: String

            /**
             The type of input being provided.
             */
            let inputType: String // Needs an enum, should be limited to `textquery` or `phonenumber`

            func request(for base: URL) throws -> URLRequest {
                let resolved = base.appendingPathComponent(self.route)

                guard var components = URLComponents(url: resolved, resolvingAgainstBaseURL: true) else {
                    throw PlacesError.unknownError(reason: "failed to get components from url")
                }

                components.queryItems = [
                    URLQueryItem(name: QueryKeys.input.rawValue, value: self.input),
                    URLQueryItem(name: QueryKeys.inputType.rawValue, value: self.inputType),
                ]

                guard let requestUrl = components.url else {
                    throw PlacesError.unknownError(reason: "failed to create url from components")
                }

                var request = URLRequest(url: requestUrl)
                request.httpMethod = method.rawValue

                return request
            }
        }
    }
}


