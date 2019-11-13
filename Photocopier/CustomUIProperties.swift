//
//  CustomUIProperties.swift
//  Photocopier
//
//  Created by Varun Iyer on 11/12/19.
//  Copyright © 2019 ATeam. All rights reserved.
//

import UIKit

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 30) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

class RoundShadowView: UIView {
    
    let containerView = UIView()
    var _cornerRadius: CGFloat!
    var _shadowRadius: CGFloat!
    var _shadowOffset: CGSize!
    var _shadowOpacity: Float!
    var _shadowColor: CGColor!
    
    init(frame: CGRect, cornerRadius: CGFloat, shadowRadius: CGFloat, shadowOffset: CGSize, shadowOpacity: Float, shadowColor: CGColor) {
        super.init(frame: frame)
        
        _cornerRadius = cornerRadius
        _shadowRadius = shadowRadius
        _shadowOffset = shadowOffset
        _shadowOpacity = shadowOpacity
        _shadowColor = shadowColor
        
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        
        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = _shadowColor
        layer.shadowOffset = _shadowOffset
        layer.shadowOpacity = _shadowOpacity
        layer.shadowRadius = _shadowRadius
        
        // set the cornerRadius of the containerView's layer
        containerView.layer.cornerRadius = _cornerRadius
        containerView.layer.masksToBounds = true
        
        addSubview(containerView)
        
        //
        // add additional views to the containerView here
        //
        
        // add constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // pin the containerView to the edges to the view
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
