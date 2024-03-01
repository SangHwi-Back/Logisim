//
//  CommonGate.swift
//  Logisim-Element
//
//  Created by 백상휘 on 2024/03/01.
//

import UIKit

public class CommonGate: UIView, GateProtocol {
    public var gateViewFrame: CGRect?
    public override var frame: CGRect {
        didSet {
            self.gateViewFrame = frame
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setClearFrame(frame)
    }
    
    public init(origin: CGPoint, withInset: Bool = true) {
        let frame = CGRect.gateFrame(origin: origin, withInset: withInset)
        super.init(frame: frame)
        setClearFrame(frame)
    }
    
    public convenience init(withInset: Bool) {
        self.init(frame: CGRect.gateFrame(withInset: withInset))
    }
    
    private func setClearFrame(_ frame: CGRect) {
        self.frame = frame
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
