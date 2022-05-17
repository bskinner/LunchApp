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

    var method: HttpMethod { get }
    var path: String { get }

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


public enum PlaceField: String {

    // Basic
    case addressComponent = "address_component"
    case adrAddress = "adr_address"
    case businessStatus = "business_status"
    case formattedAddress = "formatted_address"
    case geometry = "geometry"
    case icon = "icon"
    case iconMaskBaseURI = "icon_mask_base_uri"
    case iconBackgroundColor = "icon_background_color"
    case name = "name"
    case photo = "photo"
    case placeId = "placeId"
    case plusCode = "plusCode"
    case type = "type"
    case url = "url"
    case utcOffset = "utc_offset"
    case vicinity = "vicinity"

    // Contact
    case formattedPhoneNumber = "formatted_phone_number"
    case internationalPhoneNumber = "international_phone_number"
    case openingHours = "opening_hours"
    case website = "website"

    // Atmosphere
    case priceLevel = "price_level"
    case rating = "rating"
    case review = "review"
    case userRatingsTotal = "user_ratings_total"
}

protocol PlacesResponse: Decodable {
    var status: Status { get }
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

}
