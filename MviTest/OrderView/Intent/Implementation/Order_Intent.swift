//
//  OrderIntent.swift
//  MviTest
//
//  Created by 이윤지 on 10/27/24.
//

import Foundation

final class Order_Intent: Order_Intent_Protocol {
    
    private weak var model: Order_Model_Actions_Protocol?
    
    init(model: Order_Model_Actions_Protocol? = nil) {
        self.model = model
    }
    
    func setModel(_ model: Order_Model_Actions_Protocol) {
        self.model = model
    }
    
    func placeOrder() {
        model?.updateOrderStatus("주문 완료")
        model?.updateNavigation(true)
    }
    
}
