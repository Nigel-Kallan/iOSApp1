import SwiftUI

// Screen used to track coffee run time
struct TimerView: View {

    // Stores elapsed time in seconds
    @State private var time = 0

    // Tracks whether the timer is running
    @State private var running = false

    // Timer publisher that fires every second
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()

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

        ZStack {

            // Background gradient
            LinearGradient(
                colors: [timBrown, .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {

                // Screen title
                Text("☕ Coffee Run Timer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(timRed)

                // Display elapsed time
                Text("\(time) seconds")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(timBrown)

                // Start and Stop timer button
                Button {

                    // Toggle timer state
                    running.toggle()

                } label: {

                    Text(
                        running
                        ? "Stop Timer"
                        : "Start Timer"
                    )
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 220)
                    .background(timRed)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
            }
        }

        // Updates timer every second while running
        .onReceive(timer) { _ in

            if running {

                // Increase elapsed time by one second
                time += 1
            }
        }
    }
}

// Preview for Xcode Canvas
#Preview {
    TimerView()
}
