import Foundation

// Stores and manages all coffee orders
class OrderStore: ObservableObject {

    // Published orders automatically update UI
    @Published var orders: [Order] = [

        Order(
            name: "Amanda",
            drink: "Coffee",
            size: "Medium",
            notes: "2 sugars"
        ),

        Order(
            name: "Lisa",
            drink: "Latte",
            size: "Small",
            notes: "Oat milk"
        ),

        Order(
            name: "Jenny",
            drink: "Tea",
            size: "Medium",
            notes: "1 sugar"
        ),

        Order(
            name: "Mark",
            drink: "Mocha",
            size: "Large",
            notes: "Whipped cream"
        ),

        Order(
            name: "Sarah",
            drink: "Iced Coffee",
            size: "Large",
            notes: "No ice"
        ),

        Order(
            name: "Daniel",
            drink: "French Vanilla",
            size: "Large",
            notes: "3 sugars"
        )
    ]

    // Add new order
    func addOrder(order: Order) {

        orders.append(order)
    }

    // Delete cancelled order
    func deleteOrder(at offsets: IndexSet) {

        orders.remove(atOffsets: offsets)
    }

    // Get last 3 customer orders
    func recentOrders(for name: String) -> [Order] {

        let filteredOrders = orders.filter {

            $0.name.lowercased()
            ==
            name.lowercased()
        }

        return Array(filteredOrders.suffix(3))
    }
}
