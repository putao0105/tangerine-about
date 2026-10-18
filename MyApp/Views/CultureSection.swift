import SwiftUI

struct CultureSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "sparkles", title: "吉祥、財富與傳統")
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("「橘」與「吉」音近，象徵大吉大利；金黃的顏色則代表財富，所以橘子是**農曆新年**必備的送禮水果。")
                    Text("橘子皮曬乾後就是**陳皮**，經過多年陳放，可以用來煲湯、做甜點，也是常見的中藥材。")
                }
                .appFont(.body)
                .foregroundStyle(.white)
                .padding()
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)

                Image("Tangerine")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .rotationEffect(.degrees(-15))
                    .padding(10)
            }
            .background(
                LinearGradient(colors: [.tangerine, Color(red: 0.8, green: 0.2, blue: 0.1)],
                               startPoint: .topLeading, endPoint: .bottomTrailing),
                in: RoundedRectangle(cornerRadius: 20)
            )
        }
    }
}

#Preview {
    CultureSection()
        .padding()
        .background(Color.pageBackground)
}
