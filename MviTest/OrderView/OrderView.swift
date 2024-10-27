//
//  OrderView.swift
//  MviTest
//
//  Created by 이윤지 on 10/27/24.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject private var model = Order_Model()
    @State private var path = NavigationPath()
    
    private var intent: Order_Intent
    
    init() {
        let model = Order_Model()
        _model = StateObject(wrappedValue: model) //이게 젤 이해안감
        self.intent = Order_Intent(model: model)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
    
                Text("현재 상태: \(model.orderStatus)")
                    .padding()
                
               
                Button("주문하기") {
                    intent.placeOrder()
                }
                .padding()
            }
            .onChange(of: model.shouldNavigate) { shouldNavigate in
                if shouldNavigate {
                    path.append("주문성공경로") // 경로에 문자열 추가🌟
                    model.updateNavigation(false)
                }
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "주문성공경로" {
                    OrderConfirmationView()
                }
            }
            .onAppear {
                intent.setModel(model)
            }
        }
        
    }
}


#Preview {
    OrderView()
}
