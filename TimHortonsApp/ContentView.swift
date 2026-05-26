import SwiftUI

struct ContentView: View {

    @StateObject var store = OrderStore()

    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        NavigationView {

            ZStack {

                LinearGradient(
                    colors: [timBrown.opacity(0.4), .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {

                    Text("☕ Tim Hortons Coffee Run")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(timRed)
                        .padding(.top)

                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(timBrown)

                    List {

                        ForEach(store.orders) { order in

                            VStack(
                                alignment: .leading,
                                spacing: 8
                            ) {

                                Text(order.name)
                                    .font(.headline)
                                    .foregroundColor(timRed)

                                Text("\(order.size) \(order.drink)")
                                    .foregroundColor(timBrown)

                                Text(order.notes)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }

                    NavigationLink {

                        AddOrderView(store: store)

                    } label: {

                        Text("Add New Order")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(timRed)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
