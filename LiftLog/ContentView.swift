//
//  ContentView.swift
//  LiftLog
//
//  Created by Iyana Marquez on 8/19/24.
//

import SwiftUI

struct Workout {
    let date: Date
    let exercise: String
    let weightLifted: Int
    let repsSets: String
}

struct ContentView: View {
    @State private var count = 0
    @State private var currentWorkout = Workout(date: Date(), exercise: "Bench Press", weightLifted: 50, repsSets: "3x10")
      @State private var previousWorkout = Workout(date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, exercise: "Bench Press", weightLifted: 45, repsSets: "3x10")
    
    var weightChange: Int {
         currentWorkout.weightLifted - previousWorkout.weightLifted
     }
      
    var body: some View {
        NavigationView{
            VStack {
                //                Header
                Text("Workout Progress")
                    .font(.largeTitle)
                    .padding()
                //                Date range picker
                DatePicker("Select Date Range", selection: .constant( Date()), displayedComponents: [.date]).padding()
                
                
                // Current Workout Card
                VStack(alignment: .leading) {
                    Text("Current Workouttttt")
                        .font(.headline)
                        .padding(.bottom, 2)
                    Text("Date: fake date")
                    Text("Exercise: \(currentWorkout.exercise)")
                    Text("Weight Lifted: \(currentWorkout.weightLifted)")
                    Text("Reps/Sets: 3x10")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
                
                // Previous Workout Card
                VStack(alignment: .leading) {
                    Text("Previous Workout")
                        .font(.headline)
                        .padding(.bottom, 2)
                    Text("Date: [Previous Date]")
                    Text("Exercise: Bench Press")
                    Text("Weight Lifted: 45 kg")
                    Text("Reps/Sets: 3x10")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
                // Weight Change Indicator
                VStack {
                    Text("Weight Change: Increased by 5 kg")
                        .font(.headline)
                        .foregroundColor(.green)
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarItems(leading: Button(action: {
                // Action for back button
            }) {
                Image(systemName: "arrow.left")
            }, trailing: Button(action: {
                // Action for settings button
            }) {
                Image(systemName: "gearshape")
            })
            
            
          
        }
    
    }
}

#Preview {
    ContentView()
}
