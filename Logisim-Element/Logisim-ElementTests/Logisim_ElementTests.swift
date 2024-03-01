//
//  Logisim_ElementTests.swift
//  Logisim-ElementTests
//
//  Created by 백상휘 on 2023/11/27.
//

import XCTest
@testable import Logisim_Element

final class Logisim_ElementTests: XCTestCase {
    func test_gateSize() throws {
        let andGate = ANDGate(withInset: true), orGate = ORGate(withInset: true)
        
        XCTAssertEqual(andGate.frame.size, CGSize.gateSize)
        XCTAssertEqual(orGate.frame.size, CGSize.gateSize)
    }
    
    func test_gateOrigin() throws {
        var andGate: GateProtocol = ANDGate(withInset: true), orGate: GateProtocol = ORGate(withInset: true)
        
        if let andGateOrigin = andGate.gateOrigin, let orGateOrigin = orGate.gateOrigin {
            XCTAssertEqual(andGateOrigin.x, CGFloat.commonInsetValue)
            XCTAssertEqual(andGateOrigin.y, CGFloat.commonInsetValue)
            XCTAssertEqual(orGateOrigin.x, CGFloat.commonInsetValue)
            XCTAssertEqual(orGateOrigin.y, CGFloat.commonInsetValue)
        } else {
            XCTFail()
        }
        
        andGate = ANDGate(withInset: false)
        orGate = ORGate(withInset: false)
        
        if let andGateOrigin = andGate.gateOrigin, let orGateOrigin = orGate.gateOrigin {
            XCTAssertEqual(andGateOrigin.x, 0)
            XCTAssertEqual(andGateOrigin.y, 0)
            XCTAssertEqual(orGateOrigin.x, 0)
            XCTAssertEqual(orGateOrigin.y, 0)
        } else {
            XCTFail()
        }
    }
}
