import SwiftUI
import MapKit

struct GrowingMapSection: View {
    let regions: [GrowingRegion]

    // Centered on central Taiwan so all growing regions are visible.
    private let taiwan = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.15, longitude: 120.85),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 1.6)
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(symbol: "map.fill", title: "台灣主要產地")

            Map(initialPosition: .region(taiwan)) {
                ForEach(regions) { region in
                    Marker(region.name, systemImage: "leaf.fill", coordinate: region.coordinate)
                        .tint(Color.tangerine)
                }
            }
            .frame(height: 260)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Card {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(regions) { region in
                        RegionRow(region: region)
                    }
                }
            }
        }
    }
}

struct RegionRow: View {
    let region: GrowingRegion

    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .foregroundStyle(Color.tangerine)
            Text(region.name)
                .appFont(.subheadline, weight: .semibold)
            Spacer()
            Text(region.specialty)
                .appFont(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    GrowingMapSection(regions: TangerineData.regions)
        .padding()
        .background(Color.pageBackground)
}
