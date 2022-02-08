//
//  GameScore.swift
//  ParseSwift Example
//
//  Created by David Hakki on 2/8/22.
//

import ParseSwift
import Foundation

struct GameScore: ParseObject {
    //: These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    //: Your own properties.
    var points: Int? = 0
    var location: ParseGeoPoint?
    var name: String?

    //: Implement your own version of merge
    /*func merge(with object: Self) throws -> Self {
        var updated = try mergeParse(with: object)
        if updated.shouldRestoreKey(\.points,
                                     original: object) {
            updated.points = object.points
        }
        if updated.shouldRestoreKey(\.name,
                                     original: object) {
            updated.name = object.name
        }
        if updated.shouldRestoreKey(\.location,
                                     original: object) {
            updated.location = object.location
        }
        return updated
    }*/
}

extension GameScore {
    //: Custom initializer.
    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
}
