//
//  ToastsManager.swift
//  TokopediaAssignment
//
//  Created by megha on 1/19/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

extension Theme {
    
    var title : String {
        switch self {
        case .error: return "Error"
        case .info: return "Info"
        case .warning: return "Warning"
        case .success: return "Success"
        }
    }
}
extension NSObject {
    
    func makeToast(text : String?,type : Theme,time : Double = 0.5){
        let view = MessageView.viewFromNib(layout: .messageView)
        
        // Theme message elements with the warning style.
        view.configureTheme(type)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        view.button?.isHidden = true
        view.configureContent(title: type.title, body: /text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "OK") { (button) in
            SwiftMessages.hide()
        }
        SwiftMessages.defaultConfig.presentationStyle = .top
        
        SwiftMessages.defaultConfig.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        
        // Disable the default auto-hiding behavior.
        SwiftMessages.defaultConfig.duration = .seconds(seconds: time)
        
        // Dim the background like a popover view. Hide when the background is tapped.
        SwiftMessages.defaultConfig.dimMode = .none
        
        // Disable the interactive pan-to-hide gesture.
        SwiftMessages.defaultConfig.interactiveHide = true
        
        // Show message with default config.
        SwiftMessages.show(view: view)
        
        // Customize config using the default as a base.
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: time)
        SwiftMessages.defaultConfig.eventListeners.append { (event) in

        }
        // Show the message.
        SwiftMessages.show(config: config, view: view)
    }
    
}

