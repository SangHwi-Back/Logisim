//
//  PowerGenerator.swift
//  Logisim
//
//  Created by 백상휘 on 3/27/24.
//

import UIKit
import Combine
import Logisim_Element

class PowerGenerator: UIView {
    private var cancellables = Set<AnyCancellable>()
    private let blinkingModel = BlinkingModel()
    
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
        
        blinkingModel.$status
            .sink { [weak self] status in
                UIView.animate(withDuration: 0.8) {
                    self?.layer.backgroundColor = UIColor(red: status.alpha, green: 1, blue: status.alpha, alpha: 1.0).cgColor
                }
            }.store(in: &cancellables)
    }
    
    func switchBlinking(_ isOn: Bool) {
        if isOn {
            blinkingModel.enableBlinking()
        } else {
            blinkingModel.stopBlinking()
        }
    }
}
