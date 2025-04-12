import SwiftUI

struct TypeColor {
    static let gradientMap: [String: LinearGradient] = [
        "fire": LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottom),
        "water": LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom),
        "grass": LinearGradient(colors: [.green, .mint], startPoint: .top, endPoint: .bottom),
        "electric": LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom),
        "psychic": LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom),
        "ice": LinearGradient(colors: [.cyan, .white], startPoint: .top, endPoint: .bottom),
        "dragon": LinearGradient(colors: [.indigo, .purple], startPoint: .top, endPoint: .bottom),
        "dark": LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom),
        "fairy": LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom),
        "normal": LinearGradient(colors: [.gray.opacity(0.3), .white], startPoint: .top, endPoint: .bottom),
    ]

    static func gradient(for type: String) -> LinearGradient {
        return gradientMap[type.lowercased()] ??
               LinearGradient(colors: [.gray.opacity(0.3), .white], startPoint: .top, endPoint: .bottom)
    }
}


