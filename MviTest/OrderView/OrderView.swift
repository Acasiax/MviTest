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
        //StateObject로 관리하기 위해서
        //self.model = Order_Model()은 State로 관리가 안되는 것으로 알고 있습니다.
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
                    //개인적이니 생각이지만 model에 직접적으로 접근을 해서 값을 변경시키면 안된다고 생각합니다
                    //그래서 Binding을 하지 않고 완전히 단방향으로 가야하나 고민중이기도 하고요
                    
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

//

#Preview {
    OrderView()
}
