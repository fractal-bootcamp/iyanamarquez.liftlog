//
//  Exercise+CoreDataProperties.swift
//  LiftLog
//
//  Created by Iyana Marquez on 8/19/24.
//
//

import Foundation
import CoreData

public class Exercise: NSManagedObject {

}

extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var workouts: NSSet?
    @NSManaged public var progressRecords: NSSet?

}

// MARK: Generated accessors for workouts
extension Exercise {

    @objc(addWorkoutsObject:)
    @NSManaged public func addToWorkouts(_ value: Workouts)

    @objc(removeWorkoutsObject:)
    @NSManaged public func removeFromWorkouts(_ value: Workouts)

    @objc(addWorkouts:)
    @NSManaged public func addToWorkouts(_ values: NSSet)

    @objc(removeWorkouts:)
    @NSManaged public func removeFromWorkouts(_ values: NSSet)

}

// MARK: Generated accessors for progressRecords
extension Exercise {

    @objc(addProgressRecordsObject:)
    @NSManaged public func addToProgressRecords(_ value: Progress)

    @objc(removeProgressRecordsObject:)
    @NSManaged public func removeFromProgressRecords(_ value: Progress)

    @objc(addProgressRecords:)
    @NSManaged public func addToProgressRecords(_ values: NSSet)

    @objc(removeProgressRecords:)
    @NSManaged public func removeFromProgressRecords(_ values: NSSet)

}

extension Exercise : Identifiable {

}
