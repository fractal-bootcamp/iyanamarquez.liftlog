import CoreData
import UIKit

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model") // Replace "Model" with your .xcdatamodeld file name
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - User Operations
    
    func createUser(name: String, email: String?) {
        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.email = email
        
        saveContext()
    }
    
    func fetchUsers() -> [User]? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch users: \(error)")
            return nil
        }
    }
    
    func updateUser(user: User, name: String?, email: String?) {
        if let name = name {
            user.name = name
        }
        if let email = email {
            user.email = email
        }
        saveContext()
    }
    
    func deleteUser(user: User) {
        context.delete(user)
        saveContext()
    }
    
    // MARK: - Workout Operations
    
    func createWorkout(date: Date, notes: String?, user: User) {
        let workout = Workouts(context: context)
        workout.id = UUID()
        workout.date = date
        workout.notes = notes
        workout.user = user
        
        saveContext()
    }
    
    func fetchWorkouts() -> [Workouts]? {
        let fetchRequest: NSFetchRequest<Workouts> = Workouts.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch workouts: \(error)")
            return nil
        }
    }
    
    func updateWorkout(workout: Workouts, date: Date, notes: String?) {
        workout.date = date
        workout.notes = notes
        saveContext()
    }
    
    func deleteWorkout(workout: Workouts) {
        context.delete(workout)
        saveContext()
    }
    
    // MARK: - Exercise Operations
    
    func createExercise(name: String, category: String) {
        let exercise = Exercise(context: context)
        exercise.id = UUID()
        exercise.name = name
        exercise.category = category
        
        saveContext()
    }
    
    func fetchExercises() -> [Exercise]? {
        let fetchRequest: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch exercises: \(error)")
            return nil
        }
    }
    
    func updateExercise(exercise: Exercise, name: String, category: String) {
        exercise.name = name
        exercise.category = category
        saveContext()
    }
    
    func deleteExercise(exercise: Exercise) {
        context.delete(exercise)
        saveContext()
    }
    
    // MARK: - Progress Operations
    
    func createProgress(weight: Int64, reps: Int64, sets: Int64, exercise: Exercise, workout: Workouts) {
        let progress = Progress(context: context)
        progress.id = UUID()
        progress.weight = weight
        progress.reps = reps
        progress.sets = sets
        progress.exercise = exercise
        progress.workout = workout
        
        saveContext()
    }
    
    func fetchProgressRecords() -> [Progress]? {
        let fetchRequest: NSFetchRequest<Progress> = Progress.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch progress records: \(error)")
            return nil
        }
    }
    
    func updateProgress(progress: Progress, weight: Int64, reps: Int64, sets: Int64) {
        progress.weight = weight
        progress.reps = reps
        progress.sets = sets
        saveContext()
    }
    
    func deleteProgress(progress: Progress) {
        context.delete(progress)
        saveContext()
    }
    
    // MARK: - Save Context
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
