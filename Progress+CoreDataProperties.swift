//
//  Progress+CoreDataProperties.swift
//  LiftLog
//
//  Created by Iyana Marquez on 8/19/24.
//
//

import Foundation
import CoreData


extension Progress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Progress> {
        return NSFetchRequest<Progress>(entityName: "Progress")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var weight: Int64
    @NSManaged public var reps: Int64
    @NSManaged public var sets: Int64
    public var distanceOptional: Int64? {
        get {
            // Return nil if distance is a default value (e.g., 0) or use an optional Int64 directly
            return distance == 0 ? nil : distance
        }
        set {
            distance = newValue ?? 0 // Store 0 if nil
        }
    }
    @NSManaged public var distance: Int64
    @NSManaged public var exercise: Exercise?
    @NSManaged public var workout: Workouts?

}

extension Progress : Identifiable {

}
