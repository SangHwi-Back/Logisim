//
//  MainViewController.swift
//  Logisim
//
//  Created by 백상휘 on 2023/11/27.
//

import UIKit

class MainViewController: UIViewController {
    private let gateSize = CGSize(width: 100, height: 100)
    private var lastResponderGate: GateProtocol?
    
    let menuButton: CircleButton = {
        let button = CircleButton(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)))
        button.symbol = .hamburger
        return button
    }()
    
    let menuView = MainViewSubMenuView()
    
    var insetLastGate: CGRect {
        let origin = lastResponderGate?.gateViewFrame?.insettedOrigin ?? .zero
        return CGRect(origin: origin, size: gateSize)
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.makeGrid()
        
        view.addSubview(menuButton)
        menuButton.frame.origin = CGPoint(x: view.frame.width - 80, y: 20)
        menuButton.addTarget(self, action: #selector(addMenu(_:)), for: .touchUpInside)
        
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.topAnchor
            .constraint(equalTo: menuButton.bottomAnchor, constant: 10).isActive = true
        menuView.trailingAnchor
            .constraint(equalTo: menuButton.trailingAnchor).isActive = true
        menuView.heightAnchor
            .constraint(greaterThanOrEqualToConstant: 200).isActive = true
        menuView.widthAnchor
            .constraint(greaterThanOrEqualToConstant: 300).isActive = true
        menuView.isHidden = true
        
        menuView.menus = [
            .init(category: .gate(.OR), name: "OR", handler: { [weak self] in
                guard let self = self else { return }
                self.addGate(ANDGate(frame: self.insetLastGate))
            }),
            .init(category: .gate(.AND), name: "AND", handler: { [weak self] in
                guard let self = self else { return }
                self.addGate(ORGate(frame: self.insetLastGate))
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func addMenu(_ sender: Any?) {
        toggleMenuViewHidden()
    }
    
    private func toggleMenuViewHidden() {
        UIView.transition(
            with: view,
            duration: 0.4,
            options: [.transitionCrossDissolve]
        ) { [weak menuView] in
            menuView?.isHidden = !(menuView?.isHidden ?? false)
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        lastResponderGate = self.view.subviews.first(where: { $0.isFirstResponder }) as? GateProtocol
        return true
    }
    
    private func addGate(_ gate: any GateProtocol) {
        self.lastResponderGate = gate
        if let v = gate as? UIView {
            v.addGesture(self)
            self.view.addSubview(v)
        }
    }
}

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if menuView.isHidden == false {
            toggleMenuViewHidden()
        }
        return true
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

private extension CGRect {
    var insettedOrigin: CGPoint {
        insetBy(dx: 10, dy: 10).origin
    }
}

private extension UIView {
    
    func addGesture(_ delegate: UIGestureRecognizerDelegate? = nil) {
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(gateGesturePan(_:)))
        panGesture.delegate = delegate
        addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(
            target: self,
            action: #selector(gateGesturePinch(_:)))
        pinchGesture.delegate = delegate
        addGestureRecognizer(pinchGesture)
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
