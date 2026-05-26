import SwiftUI

struct TimerView: View {

    // Timer state variables
    @State private var time = 0
    @State private var running = false

    // Timer publisher
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()

    // Theme colors
    let timRed = Color(red: 0.75, green: 0.0, blue: 0.0)

    let timBrown = Color(
        red: 0.35,
        green: 0.20,
        blue: 0.12
    )

    var body: some View {

        ZStack {

            // Background
            LinearGradient(
                colors: [timBrown, .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {

                Text("☕ Coffee Run Timer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(timRed)

                Text("\(time) seconds")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(timBrown)

                Button {

                    running.toggle()

                } label: {

                    Text(running ? "Stop Timer" : "Start Timer")
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 220)
                        .background(timRed)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }

        // Timer updates every second
        .onReceive(timer) { _ in

            if running {
                time += 1
            }
        }
    }
}

#Preview {
    TimerView()
}
