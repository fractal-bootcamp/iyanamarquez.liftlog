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
    @NSManaged public var distance: Int64
    @NSManaged public var exercise: Exercise?
    @NSManaged public var workout: Workouts?

}

extension Progress : Identifiable {

}
