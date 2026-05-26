import Foundation

// Model for storing a coffee order
struct Order: Identifiable {

    let id = UUID()

    var name: String
    var drink: String
    var size: String
    var notes: String
}
