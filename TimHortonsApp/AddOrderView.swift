import SwiftUI

struct AddOrderView: View {

    // Access shared order store
    @ObservedObject var store: OrderStore

    // State variables for form input
    @State private var name = ""
    @State private var drink = ""
    @State private var size = "Medium"
    @State private var notes = ""

    // Available drink sizes
    let sizes = ["Small", "Medium", "Large"]

    // Tim Hortons inspired colors
    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        ZStack {

            // Background gradient
            LinearGradient(
                colors: [timBrown.opacity(0.3), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Form {

                Section(header: Text("Customer Information")) {

                    TextField("Customer Name", text: $name)

                    TextField("Drink Order", text: $drink)

                    Picker("Size", selection: $size) {

                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }

                    TextField("Notes", text: $notes)
                }

                Section {

                    Button {

                        // Create new order
                        let newOrder = Order(
                            name: name,
                            drink: drink,
                            size: size,
                            notes: notes
                        )

                        // Add to store
                        store.addOrder(order: newOrder)

                        // Clear form
                        name = ""
                        drink = ""
                        notes = ""

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
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Add Order")
        .toolbarBackground(timRed, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    AddOrderView(store: OrderStore())
}
