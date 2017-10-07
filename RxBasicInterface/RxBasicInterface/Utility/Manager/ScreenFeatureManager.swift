//
//  ScreenFeatureManager.swift
//  RxBasicInterface
//
//  Created by 陈恩湖 on 07/10/2017.
//  Copyright © 2017 Judson. All rights reserved.
//

import UIKit

enum DeviceType<T> {
    case iPhone(inch35: T, inch40: T, inch47: T, inch55: T)
    case iPad(common: T, pro: T)
}

class ScreenFeatureManager {
    
    static let shared = ScreenFeatureManager()
    
    struct DeviceDiaonal {
        static let iPhone4: Double = 3.5
        static let iPhoneSE: Double = 4.0
        static let iPhone6: Double = 4.7
        static let iPhone6Plus: Double = 5.5
    }
    
    // 屏幕规格
    enum ScreenSpecs {
        enum PhoneInch {
            case inch35, inch40, inch47, inch55
        }
        enum PadInch {
            case common, pro
        }
        case iPhone(PhoneInch), iPad(PadInch)
    }

    // 当前屏幕规格
    var screenSpecs: ScreenSpecs = .iPhone(.inch47)
    
    // 当前屏幕尺寸
    var currentDiaonal: Double = DeviceDiaonal.iPhone6
    
    fileprivate init() {
        let screenWidth = UIScreen.main.bounds.width
        switch screenWidth {
        case 320:
            if screenHeight <= 480 {
                currentDiaonal = DeviceDiaonal.iPhone4
                screenSpecs = .iPhone(.inch35)
            } else {
                currentDiaonal = DeviceDiaonal.iPhoneSE
                screenSpecs = .iPhone(.inch40)
            }
            
        case 375:
            currentDiaonal = DeviceDiaonal.iPhone6
            screenSpecs = .iPhone(.inch47)
            
        case 414:
            currentDiaonal = DeviceDiaonal.iPhone6Plus
            screenSpecs = .iPhone(.inch55)
            
        case 768:
            screenSpecs = .iPad(.common)
            
        case 1024:
            screenSpecs = .iPad(.pro)
            
        default:
            break
        }
    }
    
    /// 由屏幕大小去控制不同的视图、文字大小或者样式
    ///
    /// - Parameter type: 自定义的设备类型（尺寸）
    /// - Returns: 由传进来的值 决定返回 具体的屏幕的适配值
    func adapt<T>(toDevice type: DeviceType<T>) -> T {
        
        switch type {
        case let .iPhone(inch35, inch40, inch47, inch55):
            switch screenSpecs {
            case .iPhone(.inch35):
                return inch35
            case .iPhone(.inch40):
                return inch40
            case .iPhone(.inch47):
                return inch47
            case .iPhone(.inch55):
                return inch55
            default:
                return inch47
            }
            
        case let .iPad(common, pro):
            switch screenSpecs {
            case .iPad(.common):
                return common
            case .iPad(.pro):
                return pro
            default:
                return common
            }
        }
    }
}
