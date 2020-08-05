//
//  SongCard.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI

struct SongCard: View {
    
    @EnvironmentObject var model: ClassicaModel
    
    let title: String
    let composer: String
    let image: String
    
    let width: CGFloat = 300
    let height: CGFloat = 300
    let cornerRadius: CGFloat = 20
    
    @State var isTapped: Bool = false
    
    var body: some View {
        
        Button(action: {
            self.model.loadMusic(fileName: title, fileType: "mp3")
            self.model.playMusic()
        }) {
            ZStack {
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                
                VStack {
                    
                    HStack {
                        SongInfo(title: title, composer: composer)
                        Spacer()
                    }
                    Spacer()
                    
                }   .frame(width: width, height: height)
                
            }   .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }       .buttonStyle(ScaleButtonStyle())
    }
}
