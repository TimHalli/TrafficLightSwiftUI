import SwiftUI

struct ContentView: View {
    private let width: CGFloat = 200
    
    @State private var lightState = 0
    @State private var buttonText = "START"
    
    var body: some View {
        VStack {
            
            Circle()
                .frame(width: width)
                .foregroundColor(.green).opacity(lightState == 0 ? 1: 0.5)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .padding()
            
            Circle()
                .frame(width: width)
                .foregroundColor(.yellow).opacity(lightState == 1 ? 1: 0.5)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .padding()
            
            Circle()
                .frame(width: width)
                .foregroundColor(.red).opacity(lightState == 2 ? 1: 0.5)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .padding()
            
            Button(buttonText) {
                lightState = (lightState + 1) % 3
                buttonText = lightState == 0 ? "START" : "NEXT"
            }
            .font(.title)
            .padding()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ContentView()
    }
}
