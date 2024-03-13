//
//  FimFeedView.swift
//  Culture Critic
//
//  Created by Shazeen Thowfeek on 13/03/2024.
//

import SwiftUI

struct FimFeedView: View {
    
    var films: [Film]?
    
    var body: some View {
        
        if let films = films {
            ScrollView {
                VStack{
                    
                    ForEach(films){ film in
                        FilmView(showDescription: false, film: film)
                    }
                }
            }
        }else{
            Text("No films")
        }
        
    }
}

#Preview {
    FimFeedView(films: Mock.films)
}
