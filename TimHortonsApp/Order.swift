import Foundation

// Model for coffee order
struct Order: Identifiable {

    let id = UUID()

    var name: String
    var drink: String
    var size: String
    var notes: String

    // Save order date
    var date: Date = Date()
}
