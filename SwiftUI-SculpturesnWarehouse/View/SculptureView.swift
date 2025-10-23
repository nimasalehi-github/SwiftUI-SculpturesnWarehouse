//
//  SculptureView.swift
//  SwiftUI-SculpturesnWarehouse
//
//  Created by Nima Salehi on 10/23/25.
//

import SwiftUI

// MARK: - نمایش یک مجسمه در UI
// View for displaying a sculpture in SwiftUI
// این ویو برای نمایش هر مجسمه در لیست یا گرید استفاده می‌شود
struct SculptureView: View {
    @ObservedObject var sculpture: Sculpture
    var tilesUsed: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sculpture.name)
                .font(.headline)
            Text("اندازه: \(sculpture.width)m x \(sculpture.height)m")
                .font(.subheadline)
            Text("آسیب پذیری: \(sculpture.fragility)")
            Text("قیمت: $\(sculpture.price, specifier: "%.2f")")
            Text("محافظ استفاده شده: \(tilesUsed)")
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.green.opacity(0.2))
        .cornerRadius(8)
    }
}

struct SculptureView_Previews: PreviewProvider {
    static var previews: some View {
        SculptureView(
            sculpture: Sculpture(name: "مجسمه A", width: 2, height: 3, fragility: 8, price: 1000),
            tilesUsed: 6
        )
    }
}
