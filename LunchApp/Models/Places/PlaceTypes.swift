//
//  EnumeratedTypes.swift
//  LunchApp
//
//  Created by Blake Skinner on 5/11/22.
//

import Foundation

public enum Places {}

extension Places {
    public enum Price: String {
        case mostAffordable = "0"
        case affordable = "1"
        case average = "2"
        case expensive = "3"
        case mostExpensive = "4"
    }

    public enum RankBy: String {
        case prominence
    }
}
