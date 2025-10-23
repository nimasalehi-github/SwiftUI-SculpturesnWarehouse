//
//  Sculpture.swift
//  SwiftUI-SculpturesnWarehouse
//
//  Created by Nima Salehi on 10/23/25.
//

import Foundation

// MARK: - کلاس Sculpture
// Class representing a sculpture
// این کلاس نمایانگر هر مجسمه است و ویژگی‌های آن را نگه می‌دارد
class Sculpture: Identifiable, ObservableObject {
    var id = UUID()            // شناسه یکتا برای هر مجسمه (برای SwiftUI و لیست‌ها)
    @Published var name: String    // نام مجسمه
    @Published var width: Double   // عرض مجسمه (متر)
    @Published var height: Double  // طول مجسمه (متر)
    @Published var fragility: Int  // درجه آسیب پذیری (1-10)
    @Published var price: Double   // قیمت مجسمه
    
    init(name: String, width: Double, height: Double, fragility: Int, price: Double) {
        self.name = name
        self.width = width
        self.height = height
        self.fragility = fragility
        self.price = price
    }
    
    // تابع محاسبه تعداد محافظ مورد نیاز برای این مجسمه
    func requiredTiles() -> Int {
        let area = width * height
        return Int(ceil(area)) // هر محافظ 1x1 متر است
    }
}
