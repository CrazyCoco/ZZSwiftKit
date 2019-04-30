//
//  ServiceManager.swift
//  ZZSwiftKit
//
//  Created by GODKILLER on 2019/4/29.
//  Copyright © 2019 ZZSwiftKit. All rights reserved.
//

import UIKit

import Photos
import AVFoundation
import CoreLocation
import CoreTelephony
import EventKit
import CoreBluetooth
import Contacts

public class ServiceManager: NSObject{
    
    
}

//MARK: -- 权限跳转 --
extension ServiceManager {
    ///开启权限
    public class func TurnOnServeManager() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [UIApplication.OpenExternalURLOptionsKey : Any](), completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL.init(string: UIApplication.openSettingsURLString)!)
        }
    }
    
}

//MARK: --  权限 --
extension ServiceManager {
    
    /// 是否允许获取相册权限
    public class func isAllowPhotoAlbumService() -> Bool {
        let photoAuthorStatus = PHPhotoLibrary.authorizationStatus()
        if photoAuthorStatus == PHAuthorizationStatus.authorized{
            return true
        }else{
            return false
        }
        
    }
    /// 是否允许获取相机权限
    public class func isAllowCameraService() -> Bool {
        let videoAuthStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if videoAuthStatus == AVAuthorizationStatus.authorized{
            return true
        }else{
            return false
        }
        
    }
    
    ///是否允许麦克风权限
    public class func isAllowMicrophoneService() -> Bool {
        let videoAuthStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        if videoAuthStatus == AVAuthorizationStatus.authorized{
            return true
        }else{
            return false
        }
        
    }
    
    ///定位权限
    public class func isAllowLocationService() -> Bool  {
        let result = CLLocationManager.authorizationStatus()
        if  (result == CLAuthorizationStatus.denied) ||
            (result == CLAuthorizationStatus.notDetermined) ||
            (result == CLAuthorizationStatus.restricted){
            return false
        }
        
        return true
    }
    
    ///推送权限
    public class  func isAllowNotificationService() -> Bool  {
        let setting = UIApplication.shared.currentUserNotificationSettings
        if setting?.types == UIUserNotificationType.sound {
            return false
        }
        return true
    }
    
    ///联网权限
    public class  func isAllowNetworkService() -> Bool  {
        let state = CTCellularData().restrictedState
        if state == CTCellularDataRestrictedState.notRestricted {
            return true
        }
        
        return false
    }
    
    ///日历权限
    public class func isAllowCalendarsService() -> Bool  {
        let state = EKEventStore.authorizationStatus(for: EKEntityType.event)
        if state ==  EKAuthorizationStatus.authorized{
            return true
        }
        
        return false
    }
    
    ///通讯录权限
    public class func isAllowContactsService() -> Bool  {
        let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        if status == CNAuthorizationStatus.authorized {
            return true
        }
        return false
    }
    
}
