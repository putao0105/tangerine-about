import SwiftUI

struct QuickFactsRow: View {
    let facts: [QuickFact]

    var body: some View {
        HStack(spacing: 10) {
            ForEach(facts) { fact in
                FactCard(fact: fact)
            }
        }
    }
}

struct FactCard: View {
    let fact: QuickFact

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: fact.symbol)
                .font(.title2)
                .foregroundStyle(Color.tangerine)
            Text(fact.value)
                .appFont(.subheadline, weight: .bold)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            Text(fact.label)
                .appFont(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    QuickFactsRow(facts: TangerineData.facts)
        .padding()
        .background(Color.pageBackground)
}
