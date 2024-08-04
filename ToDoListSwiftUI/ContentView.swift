//
//  ContentView.swift
//  ToDoListSwiftUI
//
//  Created by Arda Nar on 4.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var task: String = ""
    @State var tasks: [TaskItem] = []
    
    struct TaskItem: Identifiable{
        var id = UUID()
        var title: String
        var isCompleted: Bool
    }
    
    var body: some View {
        VStack {
            VStack {
                TextField("Task", text: $task)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.1).cornerRadius(10))
                    .padding(.bottom, 50)
                
                Button(action: {
                   let newTask = TaskItem(title: task, isCompleted: false)
                    tasks.append(newTask)
                    task = ""
                }, label: {
                    Text("Add")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 100)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                })
                .padding(.bottom, 20)
                
                List {
                    ForEach($tasks, id: \.id){ $task in
                        VStack{
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .black)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                    }
                    
                }
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}

