import SwiftUI
import Playgrounds

struct ContentView: View {
    // Saved so the choices stay the same the next time the app opens.
    @AppStorage("appearance") private var appearance: AppearanceChoice = .system
    @AppStorage("appFont") private var font: AppFontChoice = .system
    @State private var showingSettings = false

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                HeroHeader()

                VStack(alignment: .leading, spacing: 32) {
                    QuickFactsRow(facts: TangerineData.facts)
                    OriginSection()
                    AnatomySection()
                    VarietiesSection(varieties: TangerineData.varieties)
                    GrowingMapSection(regions: TangerineData.regions)
                    NutritionSection(nutrients: TangerineData.nutrients)
                    PickingSection(tips: TangerineData.pickingTips)
                    CultureSection()
                }
                .padding(.horizontal)

                FooterView()
            }
        }
        .background(Color.pageBackground)
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .topTrailing) {
            Button {
                showingSettings = true
            } label: {
                Image(systemName: "textformat.size")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(Color.tangerine)
                    .frame(width: 44, height: 44)
                    .background(.regularMaterial, in: Circle())
            }
            .accessibilityLabel("外觀與字體設定")
            .padding(.trailing)
        }
        .sheet(isPresented: $showingSettings) {
            SettingsSheet(appearance: $appearance, font: $font)
        }
        .environment(\.appFont, font)
        .preferredColorScheme(appearance.colorScheme)
    }
}

#Preview("一般模式") {
    ContentView()
}

#Preview("深色模式") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Playground {
    _ = 1 + 2
}
