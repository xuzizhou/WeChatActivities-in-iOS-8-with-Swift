//
//  WeChatActivityGeneral.swift
//  SuperBoard
//
//  Created by Xuzi Zhou on 1/12/15.
//  Copyright (c) 2015 Xuzi Zhou. All rights reserved.
//

import UIKit

class WeChatActivityGeneral: UIActivity {
    var text:String!
    var url:NSURL!
    var image:UIImage!
    var isSessionScene = true
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        var req:SendMessageToWXReq!
        if WXApi.isWXAppInstalled() && WXApi.isWXAppSupportApi() {
            for item in activityItems {
                if item is UIImage {
                    return true
                }
                if item is String {
                    return true
                }
                if item is NSURL {
                    return true
                }
            }
        }
        return false
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for item in activityItems {
            if item is UIImage {
                image = item as! UIImage
            }
            if item is String {
                text = item as! String
            }
            if item is NSURL {
                url = item as! NSURL
            }
        }
    }
    
    override func performActivity() {
        var req = SendMessageToWXReq()
        // If you are sharing text-only messages, make req.bText=true and pick the correct WX message class
        req.bText = false
        req.message = WXMediaMessage()
        if isSessionScene {
            req.scene = WXSceneSession.value
        } else {
            req.scene = WXSceneTimeline.value
        }

        req.message.title = text
        req.message.description = "https://itunes.apple.com/app/superboard/id951480740?mt=8"
        
        // set the size of thumbnail image from original UIImage data
        var width = 240.0 as CGFloat
        var height = width*image.size.height/image.size.width
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        image.drawInRect(CGRectMake(0, 0, width, height))
        req.message.setThumbImage(UIGraphicsGetImageFromCurrentImageContext())
        UIGraphicsEndImageContext()
        
        var imageObject = WXImageObject()
        imageObject.imageData = UIImageJPEGRepresentation(image, 1)
        req.message.mediaObject = imageObject
        WXApi.sendReq(req)
        self.activityDidFinish(true)
    }
}
