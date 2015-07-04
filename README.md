# WeChatActivities-in-iOS-8-with-Swift

#### Test environment: Xcode 6.1, iOS 8.1
My app using this project: https://itunes.apple.com/app/superboard/id951480740?mt=8

Some screenshots:
![iPhone in Chinese](https://raw.githubusercontent.com/xuzizhou/WeChatActivities-in-iOS-8-with-Swift/master/iphone-1.png)
![iPhone in English](https://raw.githubusercontent.com/xuzizhou/WeChatActivities-in-iOS-8-with-Swift/master/iphone-2.png)
![iPad](https://raw.githubusercontent.com/xuzizhou/WeChatActivities-in-iOS-8-with-Swift/master/ipad-1.png)

## Getting started

####I suppose you are developing iOS app in Xcode 6 with Swift. If you are looking for Object-C code, check elsewhere.

###Get a developer account at WeChat(微信) and register your app in order to get an AppID from WeChat(微信).
    * For Chinese developers: https://open.weixin.qq.com/
    * For developers from other countries: http://dev.wechat.com/

###Include WeChatActivities-in-iOS-8-with-Swift
   * Add the directory "/WeChatSharing" to your project
   * Add the WeChat and Moments icons (in /Images.xcassets) into your Xcode assets
      * wechat_moments (朋友圈)
      * wechat_session (微信)

###Tune your project
   * Link WeChat SDK and other required resources
    ![Add Resouces](https://raw.githubusercontent.com/xuzizhou/WeChatActivities-in-iOS-8-with-Swift/master/add-resources-screenshot.png)
    * Add bridging header and import WeChat API header file ("WXApi.h") 
    ```
    #import "WXApi.h"
    ```
    * Register WeChat API to your project by add the following code into AppDelegate.swift
    
```
func application(application: UIApplication, 
               didFinishLaunchingWithOptions 
               launchOptions: [NSObject: AnyObject]?) -> Bool {
   //use your AppID from dev.wechat.com to replace YOUR_WECHAT_APPID
   WXApi.registerApp("YOUR_WECHAT_APPID")  
   // Override point for customization after application launch.
   return true
}
```
###Include WeChat sharing into UIActivityView
```
// look for "applicationActivities"
let activityView = UIActivityViewController(
                        activityItems: [image!,"WeChat Sharing", appURL!], 
                        applicationActivities: [WeChatSessionActivity(), WeChatMomentsActivity()]) 
self.presentViewController(activityView, 
                           animated: true, 
                           completion: nil)
```
