//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class PlaygroundController : UIViewController {
    
    var animator: UIDynamicAnimator!
    var control: UIControl!
    let dAngle: CGFloat = CGFloat(40 * M_PI / 180.0)
    var currentAngle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        control = UIControl(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        control.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        view.addSubview(control)
        
        let layer = CALayer()
        layer.contents = createImage(size: control.bounds.size).cgImage
        layer.frame = control.bounds
        control.layer.addSublayer(layer)
        
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [control])
        animator.addBehavior(gravity)
        
        let collission = UICollisionBehavior(items: [control])
        collission.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collission)
        control.addTarget(self, action: #selector(PlaygroundController.boxTaped(sender:)),
                          for: .touchUpInside)
    }
    
    @objc func boxTaped(sender: UIControl) {
        let antigravity = UIPushBehavior(items: [control], mode: .instantaneous)
        antigravity.active = true
        antigravity.magnitude = 7
        antigravity.angle = -CGFloat(M_PI_2)
        animator.addBehavior(antigravity)
        
        currentAngle += dAngle
        if currentAngle > CGFloat(2 * M_PI) {
            currentAngle -= CGFloat(2 * M_PI)
        }
        
        let layer = control.layer.sublayers![0]
        layer.setAffineTransform(CGAffineTransform(rotationAngle: currentAngle))
    }
    
    func createImage(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setStroke()
        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setFill()
        
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: size.width / 2.0, y: size.height))
        
        path.fill()
        path.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}

let controller = PlaygroundController()
controller.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
PlaygroundPage.current.liveView = controller

