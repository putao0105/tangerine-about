import SwiftUI
import UIKit

extension Color {
    static let tangerine = Color(red: 0.95, green: 0.45, blue: 0.02)
    static let peel = Color(red: 1.0, green: 0.62, blue: 0.18)
    static let pith = Color(red: 1.0, green: 0.95, blue: 0.88)
    static let leaf = Color(red: 0.25, green: 0.64, blue: 0.30)

    /// Page background: warm cream in light mode, deep brown in dark mode.
    static let pageBackground = Color(UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.11, green: 0.08, blue: 0.06, alpha: 1)
            : UIColor(red: 1.0, green: 0.95, blue: 0.88, alpha: 1)
    })

    /// Card background: white in light mode, dark warm gray in dark mode.
    static let cardBackground = Color(UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.19, green: 0.15, blue: 0.12, alpha: 1)
            : .white
    })
}
