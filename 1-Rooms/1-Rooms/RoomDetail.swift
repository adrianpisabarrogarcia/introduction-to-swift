//
//  RoomDetail.swift
//  1-Rooms
//
//  Created by Adrián Pisabarro García on 2/9/22.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture{
                    withAnimation(.easeOut(duration: 2)){
                        self.zoomed.toggle()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
            if room.hasVideo && !zoomed{
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
            
            
            
            
        }
        
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ RoomDetail(room: testData[0]) }
        NavigationView{ RoomDetail(room: testData[1]) }
    }
}
