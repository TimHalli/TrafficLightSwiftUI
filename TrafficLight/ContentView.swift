import SwiftUI

struct ContentView: View {
    private let circleColors: [Color] = [.green, .yellow, .red]
    
    @State private var lightState = -1
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                ForEach(0..<3) { index in
                    CircleView(
                        color: circleColors[index],
                        opacity: lightState == index ? 1 : 0.5
                    )
                }
             
                Button(buttonText) {
                    lightState = (lightState + 1) % 3
                    buttonText = "NEXT"
                }
                .font(.title)
                .padding()
            }
        }
    }
}

struct CircleView: View {
    private let strokeWidth: CGFloat = 2
    private let width: CGFloat = 200

    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: width)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: strokeWidth))
            .padding()
    }
}

#Preview {
    ContentView()
}
