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
        return "WeChat Moments"
            //NSLocalizedString("WeChat Moments", tableName: "WeChatSharing", bundle: <#NSBundle#>, value: <#String#>, comment: <#String#>)
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "wechat_moments")
    }
    
}
