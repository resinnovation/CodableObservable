//
//  File.swift
//  
//
//  Created by Olrik Heuser on 01.10.21.
//

import Foundation
import Combine

class ObservableTestClass<T>: ObservableObject, Codable, Equatable where T: Codable & Equatable {
    @Published var testVar: T

    init(testVar: T) {
        self.testVar = testVar
    }

    static func == (lhs: ObservableTestClass<T>, rhs: ObservableTestClass<T>) -> Bool {
        lhs.testVar == rhs.testVar
    }
}

class NonobservableTestClass<T>: Codable, Equatable where T:Codable & Equatable {
    var testVar: T

    init(testVar: T) {
        self.testVar = testVar
    }

    static func == (lhs: NonobservableTestClass<T>, rhs: NonobservableTestClass<T>) -> Bool {
        lhs.testVar == rhs.testVar
    }
}
