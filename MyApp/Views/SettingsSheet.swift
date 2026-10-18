import SwiftUI

struct SettingsSheet: View {
    @Binding var appearance: AppearanceChoice
    @Binding var font: AppFontChoice
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("外觀") {
                    Picker("外觀", selection: $appearance) {
                        ForEach(AppearanceChoice.allCases) { choice in
                            Label(choice.title, systemImage: choice.symbol)
                                .tag(choice)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }

                Section("字體") {
                    Picker("字體", selection: $font) {
                        ForEach(AppFontChoice.allCases) { choice in
                            Text(choice.title)
                                .font(choice.font(.body, weight: nil))
                                .tag(choice)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }

                Section("預覽") {
                    Text("橘子是我最愛的水果，冬天正是當季！")
                        .font(font.font(.body, weight: nil))
                }
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("完成") { dismiss() }
                }
            }
        }
        .tint(Color.tangerine)
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    SettingsSheet(appearance: .constant(.system), font: .constant(.huninn))
}
