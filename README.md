# 🍊 橘子 Tangerine — About 頁面

用 SwiftUI 打造的橘子介紹 About 頁面 iOS App。

作業：[彼得潘的 999 道 App 謎題 #211 打造吸睛的 About 頁面](https://medium.com/p/7caca09d5131)

## 頁面內容

| 區塊 | 內容 |
|---|---|
| 主視覺 | 漸層背景、橘子插圖、「當季盛產中」標籤 |
| 快速資訊 | 產季、熱量、水分、果瓣數 |
| 起源故事 | 寬皮柑橘三千年栽種史、「Tangerine」名稱來自摩洛哥丹吉爾港 |
| 橘子的構造 | 橘子切片圖，說明外果皮、中果皮、果瓣 |
| 知名品種 | 可橫向滑動的卡片：椪柑、溫州蜜柑、茂谷柑、桶柑、克萊門氏小柑橘 |
| 台灣主要產地 | 地圖標示新竹新埔、台中東勢、嘉義竹崎 |
| 營養成分 | 每 100 公克的維生素C、維生素A、膳食纖維、鉀、糖，附進度條 |
| 挑選好橘子的秘訣 | 挑選與保存方法 |
| 吉祥、財富與傳統 | 「橘」與「吉」、農曆新年、陳皮 |
| 頁尾 | 延伸閱讀連結 |

## 作業需求

| # | 需求 | 實作 |
|---|---|---|
| 1 | VStack、HStack、ZStack、Text、Image、ScrollView | 全部使用，例如主視覺用 ZStack 疊圖，快速資訊用 HStack 排列 |
| 2 | 圖片用到 asset 跟 SF Symbol | Asset：`Tangerine`、`TangerineSlice` 向量插圖；SF Symbol：`calendar`、`flame.fill`、`leaf.fill` 等 |
| 3 | 使用多個 modifier | `padding`、`background`、`clipShape`、`shadow`、`rotationEffect`、`offset`、`foregroundStyle` 等 |
| 4 | 使用 ScrollView，畫面可以上下捲動 | 整頁垂直捲動，品種卡片另外可以橫向捲動 |
| 5 | 使用多個檔案定義 view 的型別 | `Views/` 資料夾內每個區塊一個檔案，共 12 個 view 檔案 |
| 6 | 使用 property 客製自訂的 SwiftUI view | 例如 `FactCard(fact:)`、`VarietyCard(variety:)`、`SectionHeader(symbol:title:)` |

## 加分功能

| 功能 | 實作 |
|---|---|
| 一般模式與 Dark mode | 背景與卡片顏色會隨深色模式改變；右上角 **AA** 按鈕可切換「跟隨系統／淺色／深色」 |
| Markdown 文字連結 | 頁尾「延伸閱讀」點擊即可開啟維基百科 |
| 地圖功能 | MapKit 的 `Map` 搭配 `Marker` 標示台灣產地 |
| 客製字型 | 內建 jf open 粉圓（jf-openhuninn 2.1），可在設定中切換「系統字體／圓體／粉圓體」 |
| 將圖片裁切成自訂形狀 | 自訂 `ScallopedCircle` 波浪圓形 `Shape`，用來裁切品種卡片的橘子切片圖 |

設定會用 `@AppStorage` 儲存，下次開啟 App 時保持不變。

## 專案結構

```
MyApp/
├── MyApp.swift              App 進入點
├── ContentView.swift        主頁面、設定按鈕
├── Models/
│   ├── AppSettings.swift    外觀與字體選項、appFont modifier
│   ├── TangerineData.swift  所有頁面資料
│   └── Theme.swift          顏色（支援深色模式）
├── Views/                   每個區塊各一個檔案
├── Fonts/                   jf-openhuninn-2.1.ttf
└── Assets.xcassets          橘子向量插圖
```

## 執行

用 Xcode 開啟 `Untitled Project.xcodeproj`，選擇 iPhone 模擬器後按 ⌘R。

## 授權

字型 jf open 粉圓由 [justfont](https://github.com/justfont/open-huninn-font) 以 SIL Open Font License 1.1 釋出，授權條款見 `FONT-LICENSE-jf-openhuninn.txt`。

營養數值為 USDA 資料的概略值，僅供參考。
