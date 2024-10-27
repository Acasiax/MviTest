//
//  OrderModelActionsProtocol.swift
//  MviTest
//
//  Created by 이윤지 on 10/27/24.
//

import Foundation

protocol Order_Model_Actions_Protocol: AnyObject {
    
    func updateOrderStatus(_ status: String)
    func updateNavigation(_ isShowNavigate: Bool)
    
}
