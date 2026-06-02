import SwiftUI

// Main Home Screen
struct ContentView: View {

    // Creates and stores all coffee orders
    @StateObject var store = OrderStore()

    // Tim Hortons theme color - Red
    let timRed = Color(
        red: 0.75,
        green: 0.0,
        blue: 0.0
    )

    // Tim Hortons theme color - Brown
    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        // Navigation container for the app
        NavigationStack {

            ZStack {

                // Background gradient
                LinearGradient(
                    colors: [
                        timBrown.opacity(0.3),
                        .white
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 25) {

                    Spacer()

                    // App title displayed on home page
                    Text("☕ Tim Hortons Coffee Run")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(timRed)
                        .multilineTextAlignment(.center)

                    // Displays today's date
                    Text(
                        Date.now.formatted(
                            date: .complete,
                            time: .omitted
                        )
                    )
                    .font(.headline)
                    .foregroundColor(timBrown)

                    // Coffee cup icon
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .foregroundColor(timBrown)

                    Spacer()

                    // Navigation button to view all saved orders
                    NavigationLink {

                        OrdersView(store: store)

                    } label: {

                        Text("View Today's Orders")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(timRed)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }

                    // Navigation button to add a new order
                    NavigationLink {

                        AddOrderView(store: store)

                    } label: {

                        Text("Add New Order")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(timBrown)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }

                    // Navigation button to open coffee run timer
                    NavigationLink {

                        TimerView()

                    } label: {

                        Text("Open Coffee Run Timer")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.bottom)
                }
                .padding()
            }

            // Navigation bar title
            .navigationTitle("Home")
        }
    }
}

// Preview provider for Xcode Canvas
#Preview {
    ContentView()
}
