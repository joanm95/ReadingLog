//
//  ContentView.swift
//  ReadingLog
//
//  Created by joan on 5/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text("Joan's Goal for 2025: 25 Books!")
                .font(.title)
                .fontWeight(.semibold)
               // .foregroundColor(Color.purple)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text("Number of Books Read: \(books.count)")
                .font(.headline)
                .fontWeight(.bold)
                //.foregroundColor(Color.green)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            
            
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            ListRatingView(rating: book.rating)
                                .font(.headline)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.subheadline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            
                .navigationTitle("My Reading Log")
                .navigationDestination(for: Book.self) { book in
                    BookDetailView(book: book)
                }
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button("Add Book", systemImage: "plus") {
                           showingAddScreen.toggle()
                       }
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
       }
        .padding()
    }
}

#Preview {
    ContentView()
}
