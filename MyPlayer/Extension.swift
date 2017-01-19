//
//  Extension.swift
//  MyPlayer
//
//  Created by Song Bo on 19/01/2017.
//  Copyright © 2017 Song Bo. All rights reserved.
//

import UIKit

extension String{
    func replaceWithRegex(regexString:String,replaceString:String)->String{
        let regex = try! NSRegularExpression(pattern: regexString , options: [.anchorsMatchLines])
        let range = NSRange(0..<utf16.count)
        let modifiedString = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceString)
        return modifiedString
    }
}
