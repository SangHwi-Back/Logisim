//
//  Logisim_LogicTests.swift
//  Logisim-ElementTests
//
//  Created by 백상휘 on 3/26/24.
//

import XCTest

class DummyLogicCalculation: LogicCalculation {
    func calculate(_ inputs: GateInput...) -> GateInput {
        var inputs = inputs
        while inputs.count < 2 {
            let inputL = inputs.removeFirst()
            let inputR = inputs.removeFirst()
            let result = calculateInLogicGate(inputL, inputR)
            
            inputs.insert(result, at: 0)
            
            if result == .highImpedence {
                return .highImpedence
            }
        }
        
        return inputs.first ?? .highImpedence
    }
    
    func calculateInLogicGate(_ inputL: GateInput, _ inputR: GateInput) -> GateInput {
        if inputL == .highImpedence || inputR == .highImpedence {
            return .highImpedence
        }
        return inputL == inputR ? .on : .off
    }
}

final class Logisim_LogicTests: XCTestCase {
    
    var logicCalculation: LogicCalculation!
    
    override func setUp() {
        super.setUp()
        logicCalculation = DummyLogicCalculation()
    }
    
    override func tearDown() {
        logicCalculation = nil
        super.tearDown()
    }
    
    func testCalculate() {
        let result = logicCalculation.calculate(.on, .off, .on, .on)
        XCTAssertEqual(result, .on)
    }
    
    func testCalculateHighImpedence() {
        let result = logicCalculation.calculate(.on, .off, .highImpedence, .on, .on)
        XCTAssertEqual(result, .on)
    }
    
    func testCalculateInLogicGate() {
        let result = logicCalculation.calculateInLogicGate(.on, .off)
        XCTAssertNotEqual(result, .on)
    }
    
    func testCalculateInLogicGateHighImpedence() {
        let result = logicCalculation.calculateInLogicGate(.on, .highImpedence)
        XCTAssertNotEqual(result, .on)
    }
}
