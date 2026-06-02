import SwiftUI

// Screen used to display all saved coffee orders
struct OrdersView: View {

    // Shared order store containing all orders
    @ObservedObject var store: OrderStore

    var body: some View {

        // List of all customer orders
        List {

            // Loop through each order in the store
            ForEach(store.orders) { order in

                VStack(alignment: .leading) {

                    // Display customer name
                    Text(order.name)
                        .font(.headline)

                    // Display drink size and drink type
                    Text("\(order.size) \(order.drink)")

                    // Display any special notes
                    Text(order.notes)

                    // Display date and time the order was created
                    Text(
                        order.date.formatted(
                            date: .abbreviated,
                            time: .shortened
                        )
                    )
                    .font(.caption)
                }
                .padding(.vertical, 5)
            }

            // Allow users to swipe and delete orders
            .onDelete(
                perform: store.deleteOrder
            )
        }

        // Navigation bar title
        .navigationTitle("Orders")

        // Toolbar containing Edit button for deleting orders
        .toolbar {

            EditButton()
        }
    }
}

// Preview for Xcode Canvas
#Preview {
    OrdersView(store: OrderStore())
}
