//
//  WeChatMomentsActivity.swift
//  SuperBoard
//
//  Created by Xuzi Zhou on 1/12/15.
//  Copyright (c) 2015 Xuzi Zhou. All rights reserved.
//

import UIKit

class WeChatMomentsActivity: WeChatActivityGeneral {
    
    override class func activityCategory() -> UIActivityCategory{
        return UIActivityCategory.Share
    }
    override func activityType() -> String? {
        return NSBundle.mainBundle().bundleIdentifier! + ".WeChatMomentsActivity"
    }
    
    override func activityTitle() -> String? {
        isSessionScene = false
        //You are free to use localizable strings like this:
        //    NSLocalizedString("WECHAT_MOMENTS",comment:"WeChat Moments")
        return "WeChat Moments"
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "wechat_moments")
    }
    
}
