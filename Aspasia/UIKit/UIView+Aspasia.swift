//
//  UIView+Aspasia.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/25.
//

import UIKit

extension UIView {
    /// 최상위 UITabBarController
    /// 최상위 ViewController가 TabBarController라면 한 단계 더 탐색한다.
    var rootTapBarController: UITabBarController? {
        guard let window = self.window else {
            return nil
        }
        
        return window.rootViewController as? UITabBarController
    }
    
    /// 최상위 UINavigationController
    var rootNavigationController: UINavigationController? {
        guard let window = self.window else {
            return nil
        }
        
        if let rootTabBarController = window.rootViewController as? UITabBarController {
            return rootTabBarController.selectedViewController as? UINavigationController
        } else {
            return window.rootViewController as? UINavigationController
        }
    }
}
