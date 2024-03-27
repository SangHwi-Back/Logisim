//
//  Logisim_ElementTests.swift
//  Logisim-ElementTests
//
//  Created by 백상휘 on 2023/11/27.
//

import XCTest
@testable import Logisim_Element

final class Logisim_ElementTests: XCTestCase {
    private var blinkingModel: BlinkingModel!
    private var andGate: ANDGate!
    private var orGate: ORGate!
    
    private var andGateNoInset: ANDGate!
    private var orGateNoInset: ORGate!
    
    override func setUp() {
        super.setUp()
        blinkingModel = BlinkingModel()
        andGate = ANDGate(withInset: true)
        orGate = ORGate(withInset: true)
    }
    
    override func tearDown() {
        blinkingModel = nil
        andGate = nil
        orGate = nil
        super.tearDown()
    }
    
    func test_gateSize() throws {
        XCTAssertEqual(andGate.frame.size, CGSize.gateSize)
        XCTAssertEqual(orGate.frame.size, CGSize.gateSize)
    }
    
    func test_gateOrigin() throws {
        let andGate: GateProtocol = self.andGate
        let orGate: GateProtocol = self.orGate
        
        if let andGateOrigin = andGate.gateOrigin, let orGateOrigin = orGate.gateOrigin {
            XCTAssertEqual(andGateOrigin.x, CGFloat.commonInsetValue)
            XCTAssertEqual(andGateOrigin.y, CGFloat.commonInsetValue)
            XCTAssertEqual(orGateOrigin.x, CGFloat.commonInsetValue)
            XCTAssertEqual(orGateOrigin.y, CGFloat.commonInsetValue)
        } else {
            XCTFail()
        }
        
        let andGateNoInset = ANDGate(withInset: false)
        let orGateNoInset = ORGate(withInset: false)
        
        if let andGateOrigin = andGateNoInset.gateOrigin, let orGateOrigin = orGateNoInset.gateOrigin {
            XCTAssertEqual(andGateOrigin.x, 0)
            XCTAssertEqual(andGateOrigin.y, 0)
            XCTAssertEqual(orGateOrigin.x, 0)
            XCTAssertEqual(orGateOrigin.y, 0)
        } else {
            XCTFail()
        }
    }
    
    func testEnableBlinking() {
        blinkingModel.enableBlinking()
        XCTAssert(blinkingModel.timer.isValid, "Timer should be valid after calling enableBlinking")
        blinkingModel.stopBlinking()
        XCTAssertFalse(blinkingModel.timer.isValid, "Timer should be invalid after calling stopBlinking")
    }
    
    func testToggleValue() {
        let initialStatus = blinkingModel.status
        let toggledStatus = initialStatus.toggleValue()
        XCTAssertNotEqual(initialStatus, toggledStatus, "toggleValue should change the status")
    }
}
