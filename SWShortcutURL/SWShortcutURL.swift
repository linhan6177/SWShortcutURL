//
//  SWShortcutURL.swift
//  Basic
//
//  Created by linhan on 16/4/14.
//  Copyright © 2016年 linhan. All rights reserved.
//

import Foundation
import UIKit

protocol OpenEnableURL
{
    var URL:String{get}
}

extension OpenEnableURL
{
    func open()
    {
        let Application = UIApplication.sharedApplication()
        guard let url = NSURL(string:URL) where Application.canOpenURL(url) else{
            return
        }
        Application.openURL(url)
    }
}

protocol SWShortcutURLName
{
    var name:String{get}
}

extension SWShortcutURLName where Self:RawRepresentable,Self.RawValue == String
{
    var name:String{
        return self.rawValue
    }
}

enum SWShortcutURL:OpenEnableURL
{
    enum Setting:String,OpenEnableURL,SWShortcutURLName
    {
        /** General **/
        enum General:String,OpenEnableURL,SWShortcutURLName
        {
            case Root
            case About
            case Date
            case Accessibility
            
            var URL:String{
                switch self {
                case Root: return "prefs:root=General"
                case About: return "\(Root.URL)&path=About"
                case Date: return "\(Root.URL)&path=DATE_AND_TIME"
                case Accessibility: return "\(Root.URL)&path=ACCESSIBILITY"
                }
            }
            
            var name:String{
                switch self {
                case Root: return "通用"
                case Accessibility: return "辅助功能"
                default: return rawValue
                }
            }
            
        }
        
        /** Privacy **/
        enum Privacy:String,OpenEnableURL,SWShortcutURLName
        {
            case Root
            case Photos
            case Camera
            case Contact
            case Microphone
            
            var URL:String{
                switch self {
                case Root: return "prefs:root=Privacy"
                case Photos: return "\(Root.URL)&path=PHOTOS"
                case Camera: return "\(Root.URL)&path=CAMERA"
                case Contact: return "\(Root.URL)&path=CONTACTS"
                case Microphone: return "\(Root.URL)&path=MICROPHONE"
                }
            }
            
            var name:String{
                switch self {
                case Root: return "隐私"
                case Photos: return "相册"
                case Camera: return "相机"
                case Contact: return "通讯录"
                case Microphone: return "麦克风"
                }
            }
        }
        
        case Root
        case Photos
        case Bluetooth
        case Notification
        case Location
        case Sounds
        
        var URL:String{
            switch self {
            case Root: return "prefs:root"
            case Bluetooth: return "prefs:root=Bluetooth"
            case Photos: return "prefs:root=Photos"
            case Notification: return "prefs:root=NOTIFICATIONS_ID"
            case Location: return "prefs:root=LOCATION_SERVICES"
            case Sounds: return "prefs:root=Sounds"
            
            default: return ""
            }
        }
    }
    
    case PhoneCall(number:String)
    case Mail(addressee:String)
    case SMS(number:String)
    case Safari(url:String)
    
    var URL:String{
        switch self {
        case PhoneCall(let number): return "tel://\(number)"
        case SMS(let number): return "sms://\(number)"
        case Mail(let addressee): return "mailto://\(addressee)"
        case Safari(let url): return url
        }
    }
    
    var name:String{
        switch self {
        case PhoneCall(let number): return "拨打\(number)"
        case SMS(let number): return "发短信到\(number)"
        case Mail(let addressee): return "发邮件到\(addressee)"
        case Safari(let url): return "Safari中打开\(url)"
        }
    }
    
    
    //let shortURL = "app-settings:"
    //let shortURL = "prefs:root=LOCATION_SERVICES"
    //let shortURL = "prefs:root=NOTIFICATIONS_ID&path=com.miu.ios"
    
    
}