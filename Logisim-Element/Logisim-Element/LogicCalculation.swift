//
//  LogicCalculation.swift
//  Logisim-Element
//
//  Created by 백상휘 on 3/26/24.
//

import Foundation

protocol LogicCalculation {
    func calculate(_ inputs: GateInput...) -> GateInput
    func calculateInLogicGate(_ inputL: GateInput, _ inputR: GateInput) -> GateInput
}
