//
//  String+Aspasia.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import Foundation

extension String {
    /// 0xffffff 형식의 색 코드를 생성한다.
    var colorCode: String? {
        let colorCode = self.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if colorCode.hasPrefix("0x") {
            return colorCode.substring(from: 2)
        } else if colorCode.hasPrefix("#") {
            return colorCode.substring(from: 1)
        } else {
            return nil
        }
    }
    
    /// index 이후 문자열을 반환한다.
    func substring(from: Int) -> String {
        return String(self[index(startIndex, offsetBy: from)...])
    }
    
    func substring(from: Int, by: Int) -> String {
        return String(self[index(startIndex, offsetBy: from)...index(startIndex, offsetBy: from + by - 1)])
    }
}
