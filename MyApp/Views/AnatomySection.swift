import SwiftUI

struct AnatomySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "magnifyingglass", title: "橘子的構造")
            Card {
                HStack(alignment: .center, spacing: 16) {
                    Image("TangerineSlice")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110)

                    VStack(alignment: .leading, spacing: 10) {
                        AnatomyRow(color: .tangerine, name: "外果皮", detail: "布滿香氣濃郁的油胞")
                        AnatomyRow(color: .pith, name: "中果皮（白色內皮）", detail: "海綿狀組織，富含膳食纖維")
                        AnatomyRow(color: .peel, name: "果瓣", detail: "裡面充滿多汁的汁胞")
                    }
                }
            }
        }
    }
}

struct AnatomyRow: View {
    let color: Color
    let name: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(color)
                .stroke(Color.tangerine.opacity(0.4), lineWidth: 1)
                .frame(width: 12, height: 12)
                .padding(.top, 4)
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .appFont(.subheadline, weight: .semibold)
                Text(detail)
                    .appFont(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AnatomySection()
        .padding()
        .background(Color.pageBackground)
}
