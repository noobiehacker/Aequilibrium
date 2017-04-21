//
//  Extensions.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/21/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}
