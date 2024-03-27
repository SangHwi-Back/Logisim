//
//  BlinkingModel.swift
//  Logisim-Element
//
//  Created by 백상휘 on 3/27/24.
//

import Foundation
import Combine

public class BlinkingModel {
    @Published public var status: BlinkingStatus = .next
    
    lazy var timer: Timer = Timer(
        timeInterval: 1.6,
        repeats: true
    ) { [weak self] _ in
        let status = self?.status.toggleValue() ?? .next
        self?.status = status
    }
    
    public init() {
        RunLoop.main.add(timer, forMode: .default)
    }
    
    public func enableBlinking() { timer.fire() }
    public func stopBlinking() { timer.invalidate() }
}

public enum BlinkingStatus: CGFloat {
    case previous
    case next
    
    public var alpha: CGFloat {
        switch self {
        case .previous: return 0.5
        case .next: return 0.0
        }
    }
    
    func toggleValue() -> Self {
        return self == .previous ? .next : .previous
    }
}
