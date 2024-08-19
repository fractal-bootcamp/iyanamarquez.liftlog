//
//  Workouts+CoreDataProperties.swift
//  LiftLog
//
//  Created by Iyana Marquez on 8/19/24.
//
//

import Foundation
import CoreData


extension Workouts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workouts> {
        return NSFetchRequest<Workouts>(entityName: "Workouts")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var notes: String?
    @NSManaged public var user: User?
    @NSManaged public var exercises: NSSet?
    @NSManaged public var progressRecords: Progress?

}

// MARK: Generated accessors for exercises
extension Workouts {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension Workouts : Identifiable {

}
