import SwiftUI

struct AddOrderView: View {

    @ObservedObject var store: OrderStore

    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var drink = ""
    @State private var size = "Medium"
    @State private var notes = ""

    let sizes = ["Small", "Medium", "Large"]

    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    var body: some View {

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

            Button {

                let newOrder = Order(
                    name: name,
                    drink: drink,
                    size: size,
                    notes: notes
                )

                store.addOrder(order: newOrder)

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
        .navigationTitle("Add Order")
    }
}

#Preview {
    AddOrderView(store: OrderStore())
}
