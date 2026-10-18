import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 10) {
            // Markdown links: tapping the text opens the page in Safari.
            VStack(spacing: 4) {
                Text("延伸閱讀")
                    .appFont(.footnote, weight: .semibold)
                Text("[維基百科：橘](https://zh.wikipedia.org/wiki/%E6%A9%98) · [Wikipedia: Tangerine](https://en.wikipedia.org/wiki/Tangerine)")
                    .appFont(.footnote)
            }
            .tint(Color.tangerine)

            HStack(spacing: 4) {
                Text("用")
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.tangerine)
                Text("獻給我最愛的水果")
            }
            .appFont(.footnote)
            Text("營養數值僅供參考。")
                .appFont(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    FooterView()
}
