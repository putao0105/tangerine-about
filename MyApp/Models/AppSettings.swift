import SwiftUI

/// Light / dark mode choice shown in the settings sheet.
enum AppearanceChoice: String, CaseIterable, Identifiable {
    case system, light, dark

    var id: Self { self }

    var title: String {
        switch self {
        case .system: "跟隨系統"
        case .light: "淺色"
        case .dark: "深色"
        }
    }

    var symbol: String {
        switch self {
        case .system: "circle.lefthalf.filled"
        case .light: "sun.max.fill"
        case .dark: "moon.fill"
        }
    }

    /// `nil` lets the app follow the device setting.
    var colorScheme: ColorScheme? {
        switch self {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }
}

/// Font choice shown in the settings sheet.
enum AppFontChoice: String, CaseIterable, Identifiable {
    case system, rounded, huninn

    var id: Self { self }

    var title: String {
        switch self {
        case .system: "系統字體"
        case .rounded: "圓體"
        case .huninn: "粉圓體"
        }
    }

    /// PostScript name of the bundled jf open 粉圓 font (Fonts/jf-openhuninn-2.1.ttf),
    /// registered through the `UIAppFonts` key in Info.plist.
    static let huninnFontName = "jf-openhuninn-2.1"

    func font(_ style: Font.TextStyle, weight: Font.Weight?) -> Font {
        let base: Font = switch self {
        case .system: .system(style)
        case .rounded: .system(style, design: .rounded)
        case .huninn: .custom(Self.huninnFontName, size: Self.pointSize(for: style), relativeTo: style)
        }
        return weight.map { base.weight($0) } ?? base
    }

    /// Default point sizes of the iOS text styles, so the custom font matches the system scale.
    private static func pointSize(for style: Font.TextStyle) -> CGFloat {
        switch style {
        case .largeTitle: 34
        case .title: 28
        case .title2: 22
        case .title3: 20
        case .headline, .body: 17
        case .callout: 16
        case .subheadline: 15
        case .footnote: 13
        case .caption: 12
        case .caption2: 11
        default: 17
        }
    }
}

extension EnvironmentValues {
    @Entry var appFont: AppFontChoice = .system
}

/// Applies the font the user picked in settings, keeping the given text style.
struct AppFontModifier: ViewModifier {
    @Environment(\.appFont) private var appFont
    let style: Font.TextStyle
    let weight: Font.Weight?

    func body(content: Content) -> some View {
        content.font(appFont.font(style, weight: weight))
    }
}

extension View {
    func appFont(_ style: Font.TextStyle, weight: Font.Weight? = nil) -> some View {
        modifier(AppFontModifier(style: style, weight: weight))
    }
}
