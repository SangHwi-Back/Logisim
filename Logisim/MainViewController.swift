//
//  MainViewController.swift
//  Logisim
//
//  Created by 백상휘 on 2023/11/27.
//

import UIKit

class MainViewController: UIViewController {
    
    let buttonStackView: UIStackView = {
        return UIStackView().toNormalStack()
    }()
    
    let addANDGateButton: UIButton = {
        return UIButton().toNormalButton(as: "+ AND")
    }()
    
    let addORGateButton: UIButton = {
        return UIButton().toNormalButton(as: "+ OR")
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.makeGrid()
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(addANDGateButton)
        buttonStackView.addArrangedSubview(addORGateButton)
        addANDGateButton.addTarget(self, action: #selector(addANDGate), for: .touchUpInside)
        addORGateButton.addTarget(self, action: #selector(addORGate), for: .touchUpInside)
        
        buttonStackView.frame.origin.y = view.frame.maxY - 60
        buttonStackView.frame.size = CGSize(width: 180, height: 60)
        buttonStackView.center.x = view.center.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc 
    func addANDGate(_ sender: Any) {
        let gate = AndGate(frame: .init(origin: .init(x: 100, y: 100), size: .init(width: 86, height: 61)))
        gate.addGestureRecognizer(UIPanGestureRecognizer(
            target: self,
            action: #selector(gateGesturePan(_:))))
        
        self.view.addSubview(gate)
    }
    
    @objc 
    func addORGate(_ sender: Any) {
        let gate = ORGate(frame: .init(origin: .init(x: 200, y: 200), size: .init(width: 86, height: 61)))
        gate.addGestureRecognizer(UIPanGestureRecognizer(
            target: self,
            action: #selector(gateGesturePan(_:))))
        
        self.view.addSubview(gate)
    }
    
    @objc
    func gateGesturePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let viewFrame = recognizer.view?.frame ?? .zero
        
        if (0..<view.frame.width) ~= (viewFrame.maxX + translation.x) {
            recognizer.view?.center.x += translation.x
        }
        
        if (0..<view.frame.height) ~= (viewFrame.maxY + translation.y) {
            recognizer.view?.center.y += translation.y
        }
        
        recognizer.setTranslation(.zero, in: recognizer.view)
    }
}

private extension UIButton {
    func toNormalButton(as title: String) -> UIButton {
        frame.size = .init(width: 80, height: 55)
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        return self
    }
}

private extension UIStackView {
    func toNormalStack() -> UIStackView {
        spacing = 10
        axis = .horizontal
        distribution = .fillEqually
        backgroundColor = .lightGray
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        return self
    }
}
