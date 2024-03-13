//
//  ContentView.swift
//  Culture Critic
//
//  Created by Franklin on 14/2/2022.
//

import SwiftUI

struct GenreListView: View {
    
    @ObservedObject var model = GenreModel()
    
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                VStack(spacing: 0){
                    ForEach(model.genres){ genre in
                        NavigationLink{
                            FimFeedView(films: genre.films)
                                .navigationTitle(genre.name)
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    label:{
                        
                        GenreCard(genre: genre)
                    }
                    }.padding()
                }.navigationTitle("Genres")
            }
//
//            List(model.genres){ genre in
//                
//                NavigationLink(genre.name) {
//
//                    FimFeedView(films: genre.films)
//                }
//                
//            }
        }.environmentObject(model)
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GenreListView()
    }
}
