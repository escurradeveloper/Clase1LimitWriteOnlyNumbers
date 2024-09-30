//
//  ContentView.swift
//  Clase1LimitWriteOnlyNumbers
//
//  Created by Escurra Colquis on 30/09/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var phone: String = ""
    private let limit: Int = 9
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .fill(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 20))
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .padding([.leading, .trailing], 20)
                    .overlay(
                        TextField("Escribe tu número celular", text: $phone)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.black)
                            .padding([.trailing, .leading], 35)
                            .onReceive(Just(phone)) { newValue in
                                self.limitPhone(limit, newValue: newValue)
                            }
                    )
                Spacer()
            }
            .navigationTitle("Limitar solo números")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func limitPhone(_ limit: Int, newValue: String) {
        let numbers = "0123456789"
        if phone.count > limit {
            phone = String(phone.prefix(limit))
        }
        let filtered = newValue.filter { numbers.contains($0) }
        if filtered != newValue {
            phone = filtered
        }
    }
}

#Preview {
    ContentView()
}
