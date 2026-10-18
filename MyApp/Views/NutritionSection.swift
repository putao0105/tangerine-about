import SwiftUI

struct NutritionSection: View {
    let nutrients: [Nutrient]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "heart.fill", title: "營養成分（每100公克）")
            Card {
                VStack(spacing: 14) {
                    ForEach(nutrients) { nutrient in
                        NutrientRow(nutrient: nutrient)
                    }
                    Text("一顆中型橘子，大約就能提供每日所需維生素C的四分之一。")
                        .appFont(.footnote)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct NutrientRow: View {
    let nutrient: Nutrient

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text(nutrient.name)
                    .appFont(.subheadline, weight: .semibold)
                Spacer()
                Text(nutrient.amount)
                    .appFont(.subheadline).monospacedDigit()
                    .foregroundStyle(.secondary)
            }
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.pageBackground)
                    Capsule()
                        .fill(LinearGradient(colors: [.peel, .tangerine], startPoint: .leading, endPoint: .trailing))
                        .frame(width: proxy.size.width * nutrient.fraction)
                }
            }
            .frame(height: 8)
        }
    }
}

#Preview {
    NutritionSection(nutrients: TangerineData.nutrients)
        .padding()
        .background(Color.pageBackground)
}
