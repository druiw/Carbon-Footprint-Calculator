import SwiftUI

struct CategoryRectangle: View {
    var text: String // A property to pass the text dynamically
    
    var body: some View {
        ZStack {
            // Rectangle background
            Rectangle()
                .fill(Color.green)
                .frame(width: 200, height: 100)
                .cornerRadius(10)
            
            // Text on top of the rectangle
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct CategoryRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRectangle(text: "Home Energy")
    }
}
