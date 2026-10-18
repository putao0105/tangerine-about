import SwiftUI

struct SectionHeader: View {
    let symbol: String
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: symbol)
                .foregroundStyle(Color.tangerine)
            Text(title)
                .appFont(.title2, weight: .bold)
        }
    }
}

struct Card<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 20))
            .shadow(color: .tangerine.opacity(0.12), radius: 8, y: 4)
    }
}

/// A circle with wavy, scalloped edges, like the outline of a peeled tangerine.
struct ScallopedCircle: Shape {
    var bumps: Int = 10
    var depth: CGFloat = 0.08

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let steps = 360
        var path = Path()

        for step in 0...steps {
            let angle = Double(step) / Double(steps) * 2 * .pi
            // Shrink the radius slightly between bumps to make the waves.
            let r = radius * (1 - depth + depth * CGFloat(cos(Double(bumps) * angle)))
            let point = CGPoint(x: center.x + r * CGFloat(cos(angle)),
                                y: center.y + r * CGFloat(sin(angle)))
            if step == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack(spacing: 20) {
        SectionHeader(symbol: "leaf.fill", title: "標題")
        Card { Text("卡片內容") }
        Image("TangerineSlice")
            .resizable()
            .frame(width: 120, height: 120)
            .clipShape(ScallopedCircle())
    }
    .padding()
    .background(Color.pageBackground)
}
