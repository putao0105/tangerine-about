import SwiftUI

struct VarietiesSection: View {
    let varieties: [Variety]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "basket.fill", title: "知名品種")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(varieties) { variety in
                        VarietyCard(variety: variety)
                    }
                }
                .padding(.vertical, 6)
                .padding(.horizontal)
            }
            .padding(.horizontal, -16)
        }
    }
}

struct VarietyCard: View {
    let variety: Variety

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // The slice image is clipped into a custom scalloped shape.
            Image("TangerineSlice")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(ScallopedCircle())

            Text(variety.name)
                .appFont(.headline)
            Text(variety.englishName)
                .appFont(.subheadline)
                .foregroundStyle(Color.tangerine)

            Label(variety.season, systemImage: "calendar")
                .appFont(.caption, weight: .medium)
                .foregroundStyle(.secondary)

            Text(variety.note)
                .appFont(.caption)
                .fixedSize(horizontal: false, vertical: true)

            Spacer(minLength: 0)
        }
        .padding()
        .frame(width: 180, height: 240, alignment: .topLeading)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 20))
        .shadow(color: .tangerine.opacity(0.12), radius: 6, y: 3)
    }
}

#Preview {
    VarietiesSection(varieties: TangerineData.varieties)
        .padding()
        .background(Color.pageBackground)
}
