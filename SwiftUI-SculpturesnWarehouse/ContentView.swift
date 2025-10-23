//
//  ContentView.swift
//  SwiftUI-SculpturesnWarehouse
//
//  Created by Nima Salehi on 10/23/25.
//

import SwiftUI

// MARK: - ویو اصلی برنامه
// Main View showing list of sculptures and their arrangement
struct ContentView: View {
    @StateObject var warehouse = Warehouse()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // گرفتن نتیجه چیدمان
                    let arrangement = warehouse.arrangeSculptures()
                    ForEach(arrangement, id: \.0.id) { item in
                        SculptureView(sculpture: item.0, tilesUsed: item.1)
                    }
                }
                
                Button(action: addSampleSculptures) {
                    Text("اضافه کردن نمونه مجسمه‌ها")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("چیدمان انباری")
        }
    }
    
    // تابع افزودن مجسمه نمونه برای تست
    func addSampleSculptures() {
        warehouse.addSculpture(Sculpture(name: "مجسمه A", width: 2.0, height: 3.0, fragility: 8, price: 1000))
        warehouse.addSculpture(Sculpture(name: "مجسمه B", width: 1.5, height: 2.0, fragility: 5, price: 500))
        warehouse.addSculpture(Sculpture(name: "مجسمه C", width: 3.0, height: 3.0, fragility: 9, price: 2000))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

