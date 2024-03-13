//
//  FilmView.swift
//  Culture Critic
//
//  Created by Shazeen Thowfeek on 13/03/2024.
//

import SwiftUI

struct FilmView: View {
    
    @State var showDescription = false
    var film: Film?
    
    var body: some View {
        
        VStack(spacing: 0){
            if let film = film {
                Header(film: film)
                
                
                Poster(showDescription: showDescription, film: film)
                
                Footer(showDescription: $showDescription,film: film)
            }else{
                Text("No film to display")
            }
            
        }
        
        
    }
}

struct Header: View {
    let film: Film
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(film.title)")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
                Text("# \(film.rank)")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
            }
            Text("\(film.duration) min")
                .font(.caption)
        }.padding()
    }
}

struct Poster: View {
    let showDescription: Bool
    let film: Film
    
    var body: some View {
        ZStack{
            //image
            Image(film.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
            //description overlay
            if showDescription{
                Rectangle()
                    .opacity(0.6)
                //.aspectRatio(contentMode: .fill)
                Text(film.description)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct ActionImage: View {
    let symbolName: String
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Button(action: {
                if let action = action {
                    action()
                }
            },
                   label: {
                Image(systemName: symbolName)
                    .resizable()
                    .frame(width: 25.0,height: 25.0)
                    .padding(5)
            })
            
        })
        
    }
}

struct Footer: View {
    
   @Binding var showDescription: Bool
    @EnvironmentObject var model: GenreModel
    let film: Film
    
    var body: some View {
        
        HStack{
            
            // MARK: Rating stars
            HStack{
                ForEach(1...4, id: \.self){ index in
                    let star = index <= film.rating ? "star.fill" : "star"
                    ActionImage(symbolName: star){
                        //update the model to new rating
                        model.changeTheRatingTo(index, forFilmID: film.id)
                    }
                    
                   
                        .foregroundColor(.yellow)
                }
            }
            //MARK: description button
            Spacer()
            ActionImage(symbolName: "info.circle"){
                showDescription.toggle()
            }
                //MARK: favorite button
            let bookmark = film.toWatch ? "bookmark.fill":"bookmark"
            ActionImage(symbolName: bookmark){
                //update the model to new bookmark/towatch value
                model.toggleBookmarkForFilmId(film.id)
                
            }
        }.padding()
        
    }
}

#Preview {
    FilmView(showDescription: false, film: Mock.films[0])
        .environmentObject(GenreModel())
}
