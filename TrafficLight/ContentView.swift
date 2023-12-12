import SwiftUI

struct ContentView: View {
    private let width: CGFloat = 200
    
    @State private var lightState = 0
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                CircleView(width: width, color: .green, opacity: lightState == 0 ? 1 : 0.5, strokeWidth: 2)
                CircleView(width: width, color: .yellow, opacity: lightState == 1 ? 1 : 0.5, strokeWidth: 2)
                CircleView(width: width, color: .red, opacity: lightState == 2 ? 1 : 0.5, strokeWidth: 2)
                
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
    let width: CGFloat
    let color: Color
    let opacity: Double
    let strokeWidth: CGFloat
    
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
