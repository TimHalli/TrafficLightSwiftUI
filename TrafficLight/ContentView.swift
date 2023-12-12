import SwiftUI

struct ContentView: View {
    private let circleColors: [Color] = [.green, .yellow, .red]
    
    @State private var lightState = -1
    
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
             
                CustomButton(lightState: $lightState)
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

struct CustomButton: View {
    @Binding var lightState: Int
    
    var body: some View {
        Button(lightState == -1 ? "START" : "NEXT") {
            lightState = (lightState + 1) % 3
        }
        .foregroundColor(.white)
        .font(.title)
        .padding()
        .background(Color.blue)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white, lineWidth: 2)
        )
    }
}
#Preview {
    ContentView()
}
