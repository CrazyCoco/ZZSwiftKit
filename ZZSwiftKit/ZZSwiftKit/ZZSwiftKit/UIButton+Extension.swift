//
//  UIButton+Extension.swift
//  ZZSwiftKit
//
//  Created by GODKILLER on 2019/4/29.
//  Copyright © 2019 ZZSwiftKit. All rights reserved.
//

import UIKit

// MARK: - Properties
extension UIButton {
    
    /// SwifterSwift: 按钮禁用状态图像;还可以从Storyboard检查。
    @IBInspectable public var imageForDisabled: UIImage? {
        get {
            return image(for: .disabled)
        }
        set {
            setImage(newValue, for: .disabled)
        }
    }
    
    /// SwifterSwift: 按钮高亮状态图像;还可以从Storyboard检查。
    @IBInspectable public var imageForHighlighted: UIImage? {
        get {
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    
    /// SwifterSwift: 按钮正常状态图像;还可以从Storyboard检查。
    @IBInspectable public var imageForNormal: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    /// SwifterSwift: 按钮选择状态图像;还可以从Storyboard检查。
    @IBInspectable public var imageForSelected: UIImage? {
        get {
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    
    /// SwifterSwift: 按钮禁用状态的标题颜色;还可以从Storyboard检查。
    @IBInspectable public var titleColorForDisabled: UIColor? {
        get {
            return titleColor(for: .disabled)
        }
        set {
            setTitleColor(newValue, for: .disabled)
        }
    }
    
    /// SwifterSwift: 按钮高亮状态的标题颜色;还可以从Storyboard检查。
    @IBInspectable public var titleColorForHighlighted: UIColor? {
        get {
            return titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }
    
    /// SwifterSwift: 按钮正常状态的标题颜色;还可以从Storyboard检查。
    @IBInspectable public var titleColorForNormal: UIColor? {
        get {
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    /// SwifterSwift: 按钮选中状态的标题颜色;还可以从Storyboard检查。
    @IBInspectable public var titleColorForSelected: UIColor? {
        get {
            return titleColor(for: .selected)
        }
        set {
            setTitleColor(newValue, for: .selected)
        }
    }
    
    /// SwifterSwift: 按钮禁用状态的标题;还可以从Storyboard检查。
    @IBInspectable public var titleForDisabled: String? {
        get {
            return title(for: .disabled)
        }
        set {
            setTitle(newValue, for: .disabled)
        }
    }
    
    /// SwifterSwift: 按钮高亮状态的标题;还可以从Storyboard检查。
    @IBInspectable public var titleForHighlighted: String? {
        get {
            return title(for: .highlighted)
        }
        set {
            setTitle(newValue, for: .highlighted)
        }
    }
    
    /// SwifterSwift: 按钮正常状态标题;还可以从Storyboard检查。
    @IBInspectable public  var titleForNormal: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    /// SwifterSwift: 按钮选择状态的标题;还可以从Storyboard检查。
    @IBInspectable public var titleForSelected: String? {
        get {
            return title(for: .selected)
        }
        set {
            setTitle(newValue, for: .selected)
        }
    }
    
}

