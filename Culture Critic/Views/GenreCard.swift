//
//  GenreCard.swift
//  Culture Critic
//
//  Created by Shazeen Thowfeek on 13/03/2024.
//

import SwiftUI

struct GenreCard: View {
    
    var genre: Genre?
    var cardHeight = 200.0
    var cornerRadius = 20.0
    var blurRadius = 0.0
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                if let genre = genre {
                    //immg
                    Image(genre.films[0].img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width,height: cardHeight)
                        .clipped()
                        .overlay {
                            Color.black.opacity(0.6)
                        }
                        .cornerRadius(cornerRadius)
                        .blur(radius: blurRadius)
                    //text
                    Text(genre.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                       // .padding()
                    
                }else{
                    Color.red
                        .frame(width: geo.size.width,height: cardHeight)
                        .cornerRadius(cornerRadius)
                }
                
            }
            .frame(height: cardHeight)
                
           
        }
        
        
    }
}

#Preview {
    GenreCard(genre: Genre(id: "1", name: "Action", films: Mock.films))
}
