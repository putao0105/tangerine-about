import SwiftUI

struct PickingSection: View {
    let tips: [Tip]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "hand.raised.fill", title: "挑選好橘子的秘訣")
            Card {
                VStack(alignment: .leading, spacing: 14) {
                    ForEach(tips) { tip in
                        TipRow(tip: tip)
                    }
                }
            }
        }
    }
}

struct TipRow: View {
    let tip: Tip

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: tip.symbol)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 34, height: 34)
                .background(Color.tangerine, in: Circle())
            Text(tip.text)
                .appFont(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    PickingSection(tips: TangerineData.pickingTips)
        .padding()
        .background(Color.pageBackground)
}
