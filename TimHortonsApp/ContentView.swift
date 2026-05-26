import SwiftUI

struct ContentView: View {

    // Shared order store
    @StateObject var store = OrderStore()

    // Tim Hortons inspired colors
    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        NavigationView {

            ZStack {

                // Background gradient
                LinearGradient(
                    colors: [timBrown.opacity(0.4), .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {

                    // Header
                    Text("☕ Tim Hortons Coffee Run")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(timRed)
                        .padding(.top)

                    // Coffee image (optional)
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(timBrown)
                        .padding(.bottom)

                    // Orders list
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
                            .background(
                                Color.white.opacity(0.9)
                            )
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }
                    }
                    .scrollContentBackground(.hidden)

                    // Navigation buttons
                    VStack(spacing: 15) {

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

                        NavigationLink {

                            TimerView()

                        } label: {

                            Text("Open Coffee Run Timer")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(timBrown)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Orders")
            .toolbarBackground(
                timRed,
                for: .navigationBar
            )
            .toolbarBackground(
                .visible,
                for: .navigationBar
            )
        }
    }
}

#Preview {
    ContentView()
}
