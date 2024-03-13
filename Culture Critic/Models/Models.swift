//
//  Models.swift
//  Culture Critic
//
//  Created by Shazeen Thowfeek on 13/03/2024.
//

import Foundation

struct Genre: Identifiable, Decodable{
    private(set) var id: String
    private(set) var name: String
    private(set) var films: [Film]
    
   mutating func changeToWatchForFilmId(filmId: String){
        for i in films.indices {
            if films[i].id == filmId{
                films[i].toggleToWatch()
            }
        }
    }
    
    mutating func changeRatingTo(_ rating: Int,filmId: String){
         for i in films.indices {
             if films[i].id == filmId{
                 films[i].changeRatingTo(rating: rating)
             }
         }
     }
}

struct Film :Decodable,Identifiable {
    private(set) var id: String
    private(set) var title: String
    private(set) var duration: Int
    private(set) var rating: Int
    private(set) var toWatch: Bool
    private(set) var img: String
    private(set) var description: String
    private(set) var rank: Int
    
    mutating fileprivate func toggleToWatch(){
        toWatch.toggle()
    }
    
    mutating fileprivate func changeRatingTo(rating: Int){
        self.rating = rating
    }
}

struct Mock {
    
    static let films = [
    Film(id: "1", title: "Lion King", duration: 88, rating: 3, toWatch: true, img: "lion-king", description: "xxxxxxx", rank: 1),
    Film(id: "2", title: "Wall-E", duration: 88, rating: 2, toWatch: false, img: "wall-e", description: "xxxxxxx", rank: 2),
    
    
    ]
}
