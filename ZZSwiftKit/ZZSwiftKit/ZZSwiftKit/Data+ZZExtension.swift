//
//  Data+ZZExtension.swift
//  ZZKit
//
//  Created by GODKILLER on 2019/4/28.
//  Copyright © 2019 ZZKit. All rights reserved.
//

import UIKit

// MARK: - Properties
public extension Data {
    
    /// SwifterSwift: Return data as an array of bytes.
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
}

// MARK: - Methods
public extension Data {
    
    /// SwifterSwift: String by encoding Data using the given encoding (if applicable).
    ///
    /// - Parameter encoding: encoding.
    /// - Returns: String by encoding Data using the given encoding (if applicable).
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
}
