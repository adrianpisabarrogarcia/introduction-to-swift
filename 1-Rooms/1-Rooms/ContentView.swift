//
//  ContentView.swift
//  1-Rooms
//
//  Created by Adrián Pisabarro García on 31/8/22.
//

import SwiftUI




struct ContentView: View {
    @ObservedObject var store = RoomStore()

    var body: some View {
        NavigationView{
            List {
                Section{
                    Button(action: addRoom){
                        Text("Add Room")
                    }
                }
                
                Section{
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: deleteRoom)
                    .onMove(perform: move)
                }
            }
            .navigationTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    
    func addRoom (){
        store.rooms.append(Room(name: "Hall2", capacity: 2000))
    }
    
    func deleteRoom(at offsets : IndexSet){
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int){
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: RoomStore(rooms: testData))
        
        ContentView(store: RoomStore(rooms: testData))
            .environment(\.sizeCategory, .extraExtraLarge)
        
        ContentView(store: RoomStore(rooms: testData))
            .environment(\.colorScheme, .dark)
        
        ContentView(store: RoomStore(rooms: testData))
            .environment(\.layoutDirection, .rightToLeft)
            .environment(\.locale, Locale(identifier: "en"))
    }
}

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            HStack{
                Image(room.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(room.name)
                    Text(String(room.capacity) + " people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
