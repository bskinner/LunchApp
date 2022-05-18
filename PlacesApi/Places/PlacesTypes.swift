//
//  PlacesTypes.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/14/22.
//

import Foundation

public enum PlacesField: String {

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

enum PlacesSearch {}
extension PlacesSearch {
    public enum Status: String, Codable {
        case ok = "OK"
        case invalidRequest = "INVALID_REQUEST"
        case notFound = "NOT_FOUND"
    }

    public struct Response: Codable {
        enum CodingKeys: String, CodingKey {
            case htmlAttributions = "html_attributions"
            case nextPageToken = "next_page_token"
            case results
            case status
        }

        var htmlAttributions: [String]
        var nextPageToken: String
        var results: [Result]
        var status: Status
    }

    // Eeeeee- think of another name here. I'd rather not
    // risk potential confusion with the Result<Success,Error> type
    // Maybe PlacesResult? (even though it is repetitive)
    public struct Result: Codable {
        private enum CodingKeys: String, CodingKey {
            case reference = "place_id"
            case name
        }

        let reference: String
        let name: String
        // More fields to add here later
    }

    public struct OpeningHours {
        let openNow: Bool
    }
}

enum PlacesDetails {}
extension PlacesDetails {
    public enum Status: String, Codable {
        case ok = "OK"
        case zeroResults = "ZERO_RESULTS"
        case invalidRequest = "INVALID_REQUEST"
        case notFound = "NOT_FOUND"
        case overQueryLimit = "OVER_QUERY_LIMIT"
        case requestDenied = "REQUEST_DENIED"
        case unknownError = "UNKNOWN_ERROR"
    }

    public struct Details {

    }
}
