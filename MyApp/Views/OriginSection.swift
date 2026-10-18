import SwiftUI

struct OriginSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "globe.asia.australia.fill", title: "起源故事")
            Card {
                VStack(alignment: .leading, spacing: 12) {
                    Text("橘子屬於寬皮柑橘，是最原始的柑橘物種之一。在中國南方與東南亞，人們栽種寬皮柑橘已有**超過三千年**的歷史。")
                    Text("英文名「Tangerine」則出現得晚得多。19 世紀時，這種水果經由**摩洛哥的丹吉爾港**（Tangier）運往歐洲，因此歐洲人稱它為「丹吉爾橘」。")
                    Text("如今從台灣、日本，到西班牙、美國佛羅里達，世界各地都有種植。")
                }
                .appFont(.body)
            }
        }
    }
}

#Preview {
    OriginSection()
        .padding()
        .background(Color.pageBackground)
}
