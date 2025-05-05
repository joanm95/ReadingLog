//
//  AddBookView.swift
//  ReadingLog
//
//  Created by joan on 5/4/25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = [
        // Fiction
        "Action/Adventure fiction",
        "Children’s fiction",
        "Classic fiction",
        "Contemporary fiction",
        
        // Fantasy
        "Dark fantasy",
        "Fairy tales",
        "Fantasy",
        "Heroic fantasy",
        "High fantasy",
        "Historical fantasy",
        "Low fantasy",
        "Magical realism",
        "Mythic fantasy",
        "Urban fantasy",
        
        // Graphic Novel
        "Graphic novel",
        
        // Historical fiction
        "Historical fiction",
        
        // Horror
        "Body horror",
        "Comedy horror",
        "Gothic horror",
        "Horror",
        "Lovecraftian/Cosmic horror",
        "Paranormal horror",
        "Post-apocalyptic horror",
        "Psychological horror",
        "Quiet horror",
        "Slasher",
        
        // LGBTQ+
        "LGBTQ+",
        
        // Literary fiction
        "Literary fiction",
        
        // Mystery
        "Caper",
        "Cozy mystery",
        "Gumshoe/Detective mystery",
        "Historical mystery",
        "Howdunnits",
        "Locked room mystery",
        "Mystery",
        "Noir",
        "Procedural/Hard-boiled mystery",
        "Supernatural mystery",
        
        // New Adult
        "New adult",
        
        // Romance
        "Contemporary romance",
        "Dark romance",
        "Erotic romance",
        "Fantasy romance (Romantasy)",
        "Gothic romance",
        "Historical romance",
        "Paranormal romance",
        "Regency",
        "Romantic comedy",
        "Romantic suspense",
        "Romance",
        "Sci-fi romance",
        
        // Satire
        "Satire",
        
        // Science Fiction
        "Apocalyptic sci-fi",
        "Colonization sci-fi",
        "Hard sci-fi",
        "Military sci-fi",
        "Mind uploading sci-fi",
        "Parallel world sci-fi",
        "Science fiction",
        "Soft sci-fi",
        "Space opera",
        "Space western",
        "Steampunk",
        
        // Short story
        "Short story",
        
        // Thriller
        "Action thriller",
        "Conspiracy thriller",
        "Disaster thriller",
        "Espionage thriller",
        "Forensic thriller",
        "Historical thriller",
        "Legal thriller",
        "Paranormal thriller",
        "Psychological thriller",
        "Religious thriller",
        "Thriller",
        
        // Western
        "Western",
        
        // Women’s Fiction
        "Women’s fiction",
        
        // Young Adult
        "Young adult",
        
        // Nonfiction
        "Art & photography",
        "Autobiography/Memoir",
        "Biography",
        "Essays",
        "Food & drink",
        "History",
        "How-To/Guides",
        "Humanities & social sciences",
        "Humor",
        "Parenting",
        "Philosophy",
        "Religion & spirituality",
        "Science & technology",
        "Self-help",
        "Travel",
        "True crime"
    ]

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                /*
                 Old Rating Picker
                 Picker("Rating", selection: $rating) {
                 ForEach(0..<6) {
                 Text(String($0))
                 }
                 }
                 }
                 */
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}


#Preview {
    AddBookView()
}
