//
//  UIView.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import UIKit

extension UIView {
    
    func gradientXY(leftColor: UIColor =  .white , rightColor: UIColor = .red) {
        let gradientLayer = CAGradientLayer()
        if let subLayer = layer.sublayers {
            subLayer.forEach { layer in
                if let layer = layer as? CAGradientLayer {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: frame.width,
                                     height: frame.height)
        
        gradientLayer.colors = [leftColor.cgColor,
                                rightColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0.0,1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)//(gradientLayer)
    }
    
}
