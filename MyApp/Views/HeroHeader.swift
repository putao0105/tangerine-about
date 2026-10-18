import SwiftUI

struct HeroHeader: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(colors: [.peel, .tangerine], startPoint: .top, endPoint: .bottom)

            // Faint slices in the background for texture.
            Image("TangerineSlice")
                .resizable()
                .scaledToFit()
                .frame(width: 220)
                .opacity(0.15)
                .rotationEffect(.degrees(20))
                .offset(x: 130, y: -120)

            VStack(spacing: 8) {
                Image("Tangerine")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .shadow(color: .black.opacity(0.25), radius: 12, y: 8)

                Text("橘子")
                    .appFont(.largeTitle, weight: .heavy)
                Text("Tangerine · Citrus tangerina")
                    .appFont(.headline)
                    .opacity(0.9)

                HStack(spacing: 6) {
                    Image(systemName: "leaf.fill")
                    Text("當季盛產中")
                }
                .appFont(.subheadline, weight: .semibold)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(.white.opacity(0.25), in: Capsule())
                .padding(.top, 4)
            }
            .foregroundStyle(.white)
            .padding(.bottom, 32)
        }
        .frame(height: 420)
        .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 40, bottomTrailingRadius: 40))
    }
}

#Preview {
    HeroHeader()
}
