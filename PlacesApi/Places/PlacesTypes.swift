//
//  PlacesTypes.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/14/22.
//

import Foundation

enum HttpMethod: String {
    case get
    case post
    case put
}

protocol Request: Encodable {
    associatedtype Response: Decodable
    associatedtype Payload: Encodable

    var method: HttpMethod
    var path: String

}

/*struct Request<Body: Encodable,Response> {
    var method: HttpMethod
    var path: String
    var query: [String: String]?
    var body: Body
}*/

public enum Status: String {
    case ok = "OK"
    case invalidRequest = "INVALID_REQUEST"
    case notFound = "NOT_FOUND"
}


public struct PlaceFields: OptionSet {
    public var rawValue: String

    // Basic
    static let addressComponent = PlaceFields(rawValue: "address_component")
    static let adrAddress = PlaceFields(rawValue: "adr_address")
    static let businessStatus = PlaceFields(rawValue: "business_status")
    static let formattedAddress = PlaceFields(rawValue: "formatted_address")
    static let geometry = PlaceFields(rawValue: "geometry")
    static let icon = PlaceFields(rawValue: "icon")
    static let iconMaskBaseURI = PlaceFields(rawValue: "icon_mask_base_uri")
    static let iconBackgroundColor = PlaceFields(rawValue: "icon_background_color")
    static let name = PlaceFields(rawValue: "name")
    static let photo = PlaceFields(rawValue: "photo")
    static let placeId = PlaceFields(rawValue: "placeId")
    static let plusCode = PlaceFields(rawValue: "plusCode")
    static let type = PlaceFields(rawValue: "type")
    static let url = PlaceFields(rawValue: "url")
    static let utcOffset = PlaceFields(rawValue: "utc_offset")
    static let vicinity = PlaceFields(rawValue: "vicinity")

    // Contact
    static let formattedPhoneNumber = PlaceFields(rawValue: "formatted_phone_number")
    static let internationalPhoneNumber = PlaceFields(rawValue: "international_phone_number")
    static let openingHours = PlaceFields(rawValue: "opening_hours")
    static let website = PlaceFields(rawValue: "website")

    // Atmosphere
    static let priceLevel = PlaceFields(rawValue: "price_level")
    static let rating = PlaceFields(rawValue: "rating")
    static let review = PlaceFields(rawValue: "review")
    static let userRatingsTotal = PlaceFields(rawValue: "user_ratings_total")


    init(rawValue: Self.RawValue) {
        self.rawValue = rawValue
    }

}

protocol PlacesResponse: Decodable {
    var status: Status
}

/*
struct PlacesResponse<ResultType: Decodable>: Decodable {
    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results
        case status
    }

    var htmlAttributions: [String]
    var nextPageToken: String
    var results: [ResultType]
    var status: String
}
*/

public enum GooglePlaces {
    case
}
