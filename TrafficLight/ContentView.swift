import SwiftUI

struct ContentView: View {
    private let width: CGFloat = 200
    
    @State private var lightState = 0
    
    var body: some View {
        VStack {
            
            Circle()
                .frame(width: width)
                .foregroundColor(.green).opacity(lightState == 0 ? 1: 0.5)
                .padding()
            
            Circle()
                .frame(width: width)
                .foregroundColor(.yellow).opacity(lightState == 1 ? 1: 0.5)
                .padding()
            
            Circle()
                .frame(width: width)
                .foregroundColor(.red).opacity(lightState == 0 ? 1: 0.5)
                .padding()
            
            Button("Change Light") {
                lightState = (lightState + 1) % 3
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
