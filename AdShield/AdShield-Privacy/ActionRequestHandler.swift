//
//  ActionRequestHandler.swift
//  AdShield-Privacy
//
//  Created by Adam Gluck on 9/7/15.
//  Copyright © 2015 AdShield. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("privacyList", withExtension: "json"))!
    
        let item = NSExtensionItem()
        item.attachments = [attachment]
    
        print("begin")
        context.completeRequestReturningItems([item]) { (expired) -> Void in
            if expired == true {
                print("expired")
            } else {
                print("not expired")
            }
        }
    }
    
}
