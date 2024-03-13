//
//  GenreModel.swift
//  Culture Critic
//
//  Created by Shazeen Thowfeek on 13/03/2024.
//

import Foundation

class GenreModel: ObservableObject{
   @Published var genres = [Genre]()
    
    init(){
        
        guard let url = Bundle.main.url(forResource: "films", withExtension: "json")else{
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do{
                self.genres = try decoder.decode([Genre].self, from: data)
            }catch{
                print(error)
            }
            
        }catch{
            print(error)
        }
        
    }
    
    func toggleBookmarkForFilmId(_ filmID: String){
        //print("Does this work? \(filmID)")
        for i in genres.indices{
        
            genres[i].changeToWatchForFilmId(filmId: filmID)
        }
    }
    
    func changeTheRatingTo(_ rating: Int,forFilmID filmID: String){
        //print("Does this work? \(filmID)")
    for i in genres.indices{
    genres[i].changeRatingTo(rating,filmId: filmID)
        }
    }
}
