//
//  GateProtocol.swift
//  Logisim
//
//  Created by 백상휘 on 2024/02/04.
//

import Foundation

public protocol GateProtocol {
    var gateViewFrame: CGRect? { get }
}

extension GateProtocol {
    func setClearFrame(_ frame: CGRect) {}
    
    public var insettedOrigin: CGRect? {
        gateViewFrame?.withGateInset
    }
}

extension GateProtocol {
    var gateOrigin: CGPoint? {
        gateViewFrame?.origin
    }
    var gateSize: CGSize? {
        gateViewFrame?.size
    }
}
