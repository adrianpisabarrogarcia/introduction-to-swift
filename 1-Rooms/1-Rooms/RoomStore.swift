

import SwiftUI
import Combine

class RoomStore : ObservableObject {
    var rooms: [Room] {
        didSet { didChange.send() }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}

