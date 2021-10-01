//
//  File.swift
//  
//
//  Created by Olrik Heuser on 01.10.21.
//

import Foundation

class ComplexObject: Codable, Equatable {

    var stringA: String
    var stringB: String

    init(stringA: String, stringB: String) {
        self.stringA = stringA
        self.stringB = stringB
    }

    static func == (lhs: ComplexObject, rhs: ComplexObject) -> Bool {
        lhs.stringA == rhs.stringA && lhs.stringB == rhs.stringB
    }
}
