//
//  ListRatingView.swift
//  ReadingLog
//
//  Created by joan on 5/4/25.
//

import SwiftUI

struct ListRatingView: View {
   
    let rating: Int

        var body: some View {
            switch rating {
            case 1:
                Text("⭐️")
            case 2:
                Text("⭐️⭐️")
            case 3:
                Text("⭐️⭐️⭐️")
            case 4:
                Text("⭐️⭐️⭐️⭐️")
            default:
                Text("⭐️⭐️⭐️⭐️⭐️")
            }
        }
}

#Preview {
    ListRatingView(rating: 3)
}
