//
//  FAAlertAction.swift
//  FAPlacemarkPicker
//
//  Created by Jesse Cox on 8/20/16.
//  Copyright © 2016 Apprhythmia LLC. All rights reserved.
//

import UIKit

protocol FAAlertActionDelegate {
    func didPerformAction(_ action: FAAlertAction)
}

public enum FAAlertActionStyle : Int {
    case `default`
    case cancel
    case destructive
}

open class FAAlertAction: NSObject {
    
    public var title: String?
    public var attributedTitle: NSAttributedString?
    public let style: FAAlertActionStyle
    public var handler: ((FAAlertAction) -> ())?
    
    var isPreferredAction = false
    var isEnabled = true
    var delegate: FAAlertActionDelegate?
    
    public init(title: String, style: FAAlertActionStyle, handler: ((FAAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = title
        button.addTarget(nil, action: #selector(self.performAction), for: .touchUpInside)
    }
    
    public init(attributedTitle: NSAttributedString, style: FAAlertActionStyle, handler: ((FAAlertAction) -> Void)? = nil) {
        self.attributedTitle = attributedTitle
        self.style = style
        self.handler = handler
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = title
        button.addTarget(nil, action: #selector(self.performAction), for: .touchUpInside)
    }
    
    @objc func performAction() {
        if let _handler = handler {
            _handler(self)
        }
        delegate?.didPerformAction(self)
    }
    
}
