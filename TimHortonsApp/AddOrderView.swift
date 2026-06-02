import SwiftUI

// Screen used to add a new coffee order
struct AddOrderView: View {

    // Shared order store used throughout the app
    @ObservedObject var store: OrderStore

    // Used to close the screen after saving an order
    @Environment(\.dismiss) var dismiss

    // Form input fields
    @State private var name = ""
    @State private var drink = ""
    @State private var size = "Medium"
    @State private var notes = ""

    // Stores the last 3 orders for a customer
    @State private var recentOrders: [Order] = []

    // Available drink sizes
    let sizes = ["Small", "Medium", "Large"]

    // Tim Hortons theme color - Red
    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    // Tim Hortons theme color - Brown
    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        // Main form for entering order information
        Form {

            // Customer Information Section
            Section(header: Text("Customer Information")) {

                // Customer name input
                TextField(
                    "Customer Name",
                    text: $name
                )
                .onChange(of: name) {

                    // Display the customer's last 3 orders
                    recentOrders = store.recentOrders(
                        for: name
                    )
                }

                // Drink order input
                TextField(
                    "Drink Order",
                    text: $drink
                )

                // Drink size picker
                Picker(
                    "Size",
                    selection: $size
                ) {

                    ForEach(
                        sizes,
                        id: \.self
                    ) {

                        Text($0)
                    }
                }

                // Additional notes input
                TextField(
                    "Notes",
                    text: $notes
                )
            }

            // Display recent orders if available
            if !recentOrders.isEmpty {

                Section(header: Text("Last 3 Orders")) {

                    ForEach(recentOrders) { order in

                        VStack(
                            alignment: .leading
                        ) {

                            // Display drink size and drink type
                            Text(
                                "\(order.size) \(order.drink)"
                            )
                            .fontWeight(.bold)

                            // Display notes for the order
                            Text(order.notes)
                                .font(.caption)

                            // Display date and time of the order
                            Text(
                                order.date.formatted(
                                    date: .abbreviated,
                                    time: .shortened
                                )
                            )
                            .font(.caption2)
                            .foregroundColor(.gray)
                        }
                    }
                }
            }

            // Save Order Button
            Button {

                // Create a new order object
                let newOrder = Order(
                    name: name,
                    drink: drink,
                    size: size,
                    notes: notes
                )

                // Save the order to the store
                store.addOrder(order: newOrder)

                // Close the Add Order screen
                dismiss()

            } label: {

                Text("Save Order")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(timRed)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }

        // Navigation bar title
        .navigationTitle("Add Order")
    }
}

// Preview for Xcode Canvas
#Preview {
    AddOrderView(store: OrderStore())
}
