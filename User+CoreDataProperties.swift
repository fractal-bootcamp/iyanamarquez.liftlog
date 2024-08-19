//
//  User+CoreDataProperties.swift
//  LiftLog
//
//  Created by Iyana Marquez on 8/19/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var workouts: NSSet?

}

// MARK: Generated accessors for workouts
extension User {

    @objc(addWorkoutsObject:)
    @NSManaged public func addToWorkouts(_ value: Workouts)

    @objc(removeWorkoutsObject:)
    @NSManaged public func removeFromWorkouts(_ value: Workouts)

    @objc(addWorkouts:)
    @NSManaged public func addToWorkouts(_ values: NSSet)

    @objc(removeWorkouts:)
    @NSManaged public func removeFromWorkouts(_ values: NSSet)

}

extension User : Identifiable {

}
