//
//  PowerGenerator.swift
//  Logisim
//
//  Created by 백상휘 on 3/27/24.
//

import UIKit
import Combine

class PowerGenerator: UIView {
    let model = PowerGeneratorModel()
    var cancellables = Set<AnyCancellable>()
    
    override init(frame: CGRect) {
        super.init(
            frame: frame == .zero
            ? CGRect(x: 20, y: 20, width: 55, height: 55)
            : frame
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.setCircle()
        layer.backgroundColor = UIColor.green.cgColor
        clipsToBounds = true
        
        model.$greenStatus
            .sink { [weak self] status in
                UIView.animate(withDuration: 0.8) {
                    self?.layer.backgroundColor = UIColor(red: status.alpha, green: 1, blue: status.alpha, alpha: 1.0).cgColor
                }
            }.store(in: &cancellables)
    }
    
    func switchBlinking(_ isOn: Bool) {
        if isOn {
            model.enableBlinking()
        } else {
            model.stopBlinking()
        }
    }
}

class PowerGeneratorModel {
    @Published var greenStatus: GreenStatus = .next
    
    lazy var timer: Timer = Timer(timeInterval: 1.6, repeats: true) { [weak self] _ in
        let status = self?.greenStatus.toggleValue() ?? .next
        self?.greenStatus = status
    }
    
    init() {
        RunLoop.main.add(timer, forMode: .default)
    }
    
    
    func enableBlinking() {
        timer.fire()
    }
    
    func stopBlinking() {
        timer.invalidate()
    }
}

enum GreenStatus: CGFloat {
    case previous
    case next
    
    var alpha: CGFloat {
        switch self {
        case .previous: return 0.5
        case .next: return 0.0
        }
    }
    
    func toggleValue() -> Self {
        return self == .previous ? .next : .previous
    }
}
