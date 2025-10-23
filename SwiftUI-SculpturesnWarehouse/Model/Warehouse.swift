//
//  Warehouse.swift
//  SwiftUI-SculpturesnWarehouse
//
//  Created by Nima Salehi on 10/23/25.
//

import Foundation

// MARK: - کلاس Warehouse
// Class representing the warehouse and managing sculptures
// این کلاس مسئول چیدمان مجسمه‌ها و مدیریت محافظ‌ها است
class Warehouse: ObservableObject {
    let size: Double = 44.0        // اندازه دیوار انباری (مربع 44 متر)
    let maxTiles: Int = 300        // تعداد محافظ‌های موجود
    @Published var sculptures: [Sculpture] = []  // لیست مجسمه‌ها
    
    // تابع افزودن مجسمه به انبار
    func addSculpture(_ sculpture: Sculpture) {
        sculptures.append(sculpture)
    }
    
    // تابع ساده برای چیدمان مجسمه‌ها
    func arrangeSculptures() -> [(Sculpture, Int)] {
        var remainingTiles = maxTiles
        var arrangement: [(Sculpture, Int)] = []
        
        // چیدمان بر اساس اندازه و آسیب پذیری
        let sortedSculptures = sculptures.sorted {
            $0.fragility > $1.fragility // اول مجسمه‌های آسیب پذیرتر
        }
        
        for sculpture in sortedSculptures {
            let neededTiles = sculpture.requiredTiles()
            if neededTiles <= remainingTiles {
                remainingTiles -= neededTiles
                arrangement.append((sculpture, neededTiles))
            } else {
                // محافظ کافی نیست، نمی‌توانیم این مجسمه را کامل بچینیم
                arrangement.append((sculpture, remainingTiles))
                remainingTiles = 0
            }
        }
        return arrangement
    }
}
