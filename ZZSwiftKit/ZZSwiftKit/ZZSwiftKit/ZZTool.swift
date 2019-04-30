//
//  ZZTool.swift
//  ZZSwiftKit
//
//  Created by GODKILLER on 2019/4/29.
//  Copyright © 2019 ZZSwiftKit. All rights reserved.
//

import UIKit

public class ZZTool: NSObject {
    
    /// 根据date获取时间戳
    ///
    /// - Parameter date: 时间
    /// - Returns: 时间戳
    public class func getTimeStampWithDate(date: Date) -> String {
        
        let timeInterval:TimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
        
    }
    
    
    /// 根据date获取指定格式时间字符串
    ///
    /// - Parameters:
    ///   - date: 时间
    ///   - formatter: 时间格式
    /// - Returns: 指定格式字符串
    public class func getTimeStringWithDateAndFormatter(date: Date,formatter: String) -> String {
        
        let dateFormatter = DateFormatter()
        // 时间格式："hh:mm aa dd/MM/YYYY"等
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
        
    }
    
    
    /// 根据时间戳获取指定格式时间
    ///
    /// - Parameters:
    ///   - timeStamp: 时间戳
    ///   - formatter: 格式
    /// - Returns: 指定格式时间字符串
    public class func getTimeStringWithTimeStampAndFormatter(timeStamp: String,formatter: String) -> String {
        
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(Int(timeStamp)!)
        let date = NSDate(timeIntervalSince1970: timeInterval)
        
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = formatter
        return "\(dformatter.string(from: date as Date))"
        
    }
    
    
    /// 根据时间戳获取周几
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 返回周几
    public  class func getWeek(timeStamp: String) -> String {
        
        let time = Double(timeStamp)!
        let date = NSDate.init(timeIntervalSinceReferenceDate: time)
        let gregorian = NSCalendar.init(calendarIdentifier: .gregorian)
        let weekdayComponents = gregorian?.components(.weekday, from: date as Date)
        let weekday = weekdayComponents?.weekday
        
        var weekStr: String = ""
        
        if (weekday == 1) {
            weekStr = "星期日";
        }else if (weekday == 2){
            weekStr = "星期一";
        }else if (weekday == 3){
            weekStr = "星期二";
        }else if (weekday == 4){
            weekStr = "星期三";
        }else if (weekday == 5){
            weekStr = "星期四";
        }else if (weekday == 6){
            weekStr = "星期五";
        }else if (weekday == 7){
            weekStr = "星期六";
        }
        
        return weekStr
        
    }
    
    
    /// 根据字符串生成二维码图片
    ///
    /// - Parameters:
    ///   - QRCodeString: QRCodeString description
    ///   - logo: logo description
    ///   - size: size description
    /// - Returns: return value description
    public class func generateQRImage(QRCodeString: String, logo: UIImage?, size: CGSize = CGSize(width: 200, height: 200)) -> UIImage? {
        guard let data = QRCodeString.data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        let imageFilter = CIFilter(name: "CIQRCodeGenerator")
        imageFilter?.setValue(data, forKey: "inputMessage")
        imageFilter?.setValue("H", forKey: "inputCorrectionLevel")
        let ciImage = imageFilter?.outputImage
        
        // 创建颜色滤镜
        let colorFilter = CIFilter(name: "CIFalseColor")
        colorFilter?.setDefaults()
        colorFilter?.setValue(ciImage, forKey: "inputImage")
        colorFilter?.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        colorFilter?.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        
        // 返回二维码图片
        let qrImage = UIImage(ciImage: (colorFilter?.outputImage)!)
        let imageRect = size.width > size.height ?
            CGRect(x: (size.width - size.height) / 2, y: 0, width: size.height, height: size.height) :
            CGRect(x: 0, y: (size.height - size.width) / 2, width: size.width, height: size.width)
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        qrImage.draw(in: imageRect)
        if logo != nil {
            let logoSize = size.width > size.height ?
                CGSize(width: size.height * 0.25, height: size.height * 0.25) :
                CGSize(width: size.width * 0.25, height: size.width * 0.25)
            logo?.draw(in: CGRect(x: (imageRect.size.width - logoSize.width) / 2, y: (imageRect.size.height - logoSize.height) / 2, width: logoSize.width, height: logoSize.height))
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
