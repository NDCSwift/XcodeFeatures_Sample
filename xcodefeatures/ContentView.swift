//
    // Project: xcodefeatures
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var taskName: String
    var isComplete: Bool
}

struct ContentView: View {
    @State private var tasks = [
        Task(taskName: "Watch Xcode video", isComplete: false),
        Task(taskName: "Try customizing theme", isComplete: true),
        Task(taskName: "Refactor sample project", isComplete: false)
    ]
    
    @State private var newTaskName = ""
    // TODO: FIX EVERYTHING
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("My New Task")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.568, saturation: 0.838, brightness: 0.646))
                    .bold()
                    .padding(.vertical, 6.0)
                    .accessibilityLabel("Label")
                    
                    
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isComplete ? .green : .gray)
                            Text(task.taskName)
                        }
                    }
                }
                .listStyle(.plain)

                Divider()
                    .padding(.vertical)
                // MARK: Add new task
                HStack {
                    TextField("New task...", text: $newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") {
                        let newTask = Task(taskName: newTaskName, isComplete: false)
                        tasks.append(newTask)
                        newTaskName = ""
                    }
                    .disabled(newTaskName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Task Manager")
        }
    }
}

#Preview {
    ContentView()
}
