//
//  OrderModel.swift
//  MviTest
//
//  Created by 이윤지 on 10/27/24.
//

import Foundation

final class Order_Model: ObservableObject {
    
    @Published var orderStatus: String = "주문 전"
    @Published var shouldNavigate: Bool = false
    
}


extension Order_Model: Order_Model_Actions_Protocol {
    
    func updateOrderStatus(_ status: String) {
        orderStatus = status
    }
    
    func updateNavigation(_ shouldNavigate: Bool) {
        self.shouldNavigate = shouldNavigate
    }
    
}


