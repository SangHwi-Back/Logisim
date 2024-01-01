//
//  MainViewController.swift
//  Logisim
//
//  Created by 백상휘 on 2023/11/27.
//

import UIKit

class MainViewController: UIViewController {
    
    let menuButton: CircleButton = {
        let button = CircleButton(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)))
        button.symbol = .hamburger
        return button
    }()
    
    let menuView: MainViewSubMenuView = {
        let view = MainViewSubMenuView(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 450)))
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.makeGrid()
        
        view.addSubview(menuButton)
        menuButton.frame.origin = CGPoint(x: view.frame.width - 80, y: 20)
        menuButton.addTarget(self, action: #selector(addMenu(_:)), for: .touchUpInside)
        
        menuView.frame.origin = CGPoint(x: menuButton.frame.maxX - 300, y: menuButton.frame.maxY + 10)
        menuView.menus = [
            .init(name: "Menu1", handler: {
                let gate = ANDGate()
                gate.addGesture()
                self.view.addSubview(gate)
            }),
            .init(name: "Menu2", handler: {
                let gate = ORGate()
                gate.addGesture()
                self.view.addSubview(gate)
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func addMenu(_ sender: Any?) {
        UIView.transition(with: view, duration: 0.4, options: [.transitionCrossDissolve]) { [weak menuView, view] in
            guard let menuView, let superView = view else { return }
            
            if menuView.superview == superView {
                menuView.removeFromSuperview()
            } else {
                superView.addSubview(menuView)
            }
        }
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

private extension UIView {
    
    func addGesture() {
        addGestureRecognizer(UIPanGestureRecognizer(
            target: self,
            action: #selector(gateGesturePan(_:))))
        addGestureRecognizer(UIPinchGestureRecognizer(
            target: self,
            action: #selector(gateGesturePinch(_:))))
    }
    
    @objc
    func gateGesturePan(_ recognizer: UIPanGestureRecognizer) {
        guard let superview else { return }
        
        let translation = recognizer.translation(in: superview)
        let viewFrame = recognizer.view?.frame ?? .zero
        
        if (0..<superview.frame.width) ~= (viewFrame.maxX + translation.x) {
            recognizer.view?.center.x += translation.x
        }
        
        if (0..<superview.frame.height) ~= (viewFrame.maxY + translation.y) {
            recognizer.view?.center.y += translation.y
        }
        
        recognizer.setTranslation(.zero, in: recognizer.view)
    }
    
    @objc
    func gateGesturePinch(_ recognizer: UIPinchGestureRecognizer) {
        guard let result = recognizer.view?.transform.scaledBy(
            x: recognizer.scale,
            y: recognizer.scale)
        else {
            return
        }
        
        recognizer.view?.transform = result
        recognizer.scale = 1
    }
}
