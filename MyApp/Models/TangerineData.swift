import Foundation
import CoreLocation

struct QuickFact: Identifiable {
    let id = UUID()
    let symbol: String
    let value: String
    let label: String
}

struct Variety: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let season: String
    let note: String
}

struct Nutrient: Identifiable {
    let id = UUID()
    let name: String
    let amount: String
    /// Share of the bar to fill (0...1), relative to a typical daily value.
    let fraction: Double
}

struct Tip: Identifiable {
    let id = UUID()
    let symbol: String
    let text: String
}

struct GrowingRegion: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
    let coordinate: CLLocationCoordinate2D
}

enum TangerineData {
    static let facts = [
        QuickFact(symbol: "calendar", value: "10–3月", label: "產季"),
        QuickFact(symbol: "flame.fill", value: "53 大卡", label: "每100公克"),
        QuickFact(symbol: "drop.fill", value: "85%", label: "水分"),
        QuickFact(symbol: "circle.grid.3x3.fill", value: "約10瓣", label: "果瓣"),
    ]

    static let varieties = [
        Variety(name: "椪柑", englishName: "Ponkan", season: "10月 – 12月",
                note: "果皮蓬鬆好剝，香甜多汁。"),
        Variety(name: "溫州蜜柑", englishName: "Satsuma", season: "10月 – 12月",
                note: "原產日本，幾乎無籽，皮薄、味道溫和。"),
        Variety(name: "茂谷柑", englishName: "Murcott", season: "1月 – 3月",
                note: "橘子與柳橙的雜交種，汁多味濃。"),
        Variety(name: "桶柑", englishName: "Tankan", season: "1月 – 3月",
                note: "過年必備水果，果肉紮實、酸甜適中。"),
        Variety(name: "克萊門氏小柑橘", englishName: "Clementine", season: "11月 – 1月",
                note: "小巧無籽、容易剝皮，便當裡的經典水果。"),
    ]

    // Approximate values per 100 g of raw mandarin (USDA).
    static let nutrients = [
        Nutrient(name: "維生素C", amount: "26.7 毫克", fraction: 0.30),
        Nutrient(name: "維生素A", amount: "34 微克", fraction: 0.04),
        Nutrient(name: "膳食纖維", amount: "1.8 公克", fraction: 0.06),
        Nutrient(name: "鉀", amount: "166 毫克", fraction: 0.04),
        Nutrient(name: "糖", amount: "10.6 公克", fraction: 0.21),
    ]

    static let pickingTips = [
        Tip(symbol: "scalemass.fill", text: "挑拿起來有重量感的，越重代表越多汁。"),
        Tip(symbol: "sparkles", text: "選表皮有光澤、顏色橙亮，沒有軟爛或發霉的果實。"),
        Tip(symbol: "nose.fill", text: "成熟的橘子即使隔著果皮，也能聞到香甜的柑橘味。"),
        Tip(symbol: "thermometer.snowflake", text: "常溫可放約一週，冷藏可保存二到三週。"),
    ]

    static let regions = [
        GrowingRegion(name: "新竹新埔", specialty: "椪柑、桶柑",
                      coordinate: CLLocationCoordinate2D(latitude: 24.83, longitude: 121.08)),
        GrowingRegion(name: "台中東勢", specialty: "椪柑、茂谷柑",
                      coordinate: CLLocationCoordinate2D(latitude: 24.26, longitude: 120.83)),
        GrowingRegion(name: "嘉義竹崎", specialty: "椪柑",
                      coordinate: CLLocationCoordinate2D(latitude: 23.52, longitude: 120.55)),
    ]
}
