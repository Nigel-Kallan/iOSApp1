import Foundation

// Observable object used to store and manage orders
class OrderStore: ObservableObject {

    // Published array updates the UI automatically
    @Published var orders: [Order] = [

        Order(
            name: "Amanda",
            drink: "Double Double",
            size: "Medium",
            notes: "2 sugars"
        ),

        Order(
            name: "Nigel",
            drink: "French Vanilla",
            size: "Large",
            notes: "Extra hot"
        )
    ]

    // Function to add a new order
    func addOrder(order: Order) {
        orders.append(order)
    }
}
