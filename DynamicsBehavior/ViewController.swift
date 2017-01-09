//
//  ViewController.swift
//  DynamicsBehavior
//
//  Created by Shengkun Wei on 1/8/17.
//  Copyright © 2017 amy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    
    @IBOutlet weak var groundView: UIView!
    var ball: UIView!
    var animator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = UIView(frame: CGRect(x: 100, y: 600, width: 50, height: 50))
        
        ball.layer.cornerRadius = 25
        ball.backgroundColor = UIColor.red
        
        view.addSubview(ball)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        addGravity()
        
    }
    
    func addGravity() {
        let gravity = UIGravityBehavior(items: [ball])
        animator.addBehavior(gravity)
        
        
        let collision = UICollisionBehavior(items: [ball])
        collision.addBoundary(withIdentifier: NSNumber(value: 1), from: groundView.frame.origin, to: CGPoint(x: groundView.frame.origin.x + groundView.frame.width, y: groundView.frame.origin.y))
        
        collision.collisionDelegate = self
        
        animator.addBehavior(collision)
        
        
        let ballBehavior = UIDynamicItemBehavior(items: [ball])
        ballBehavior.elasticity = 0.8
        animator.addBehavior(ballBehavior)
        
        
        
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if NSNumber(value: 1).isEqual(identifier) {
            ball.backgroundColor = UIColor.green
        }
    }

}

