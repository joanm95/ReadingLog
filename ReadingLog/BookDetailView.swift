//
//  BookDetailView.swift
//  ReadingLog
//
//  Created by joan on 5/4/25.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text(book.title)
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text(book.author)
                .font(.title2)
                .foregroundStyle(.secondary)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text(book.genre)
                .font(.headline)
                .foregroundStyle(.secondary)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            Spacer()
                .frame(minHeight: 10, maxHeight: 50)
            Text(book.review)
                .padding()
        }
    
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)

        return BookDetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
