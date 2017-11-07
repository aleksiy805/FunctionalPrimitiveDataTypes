//  Created by Aleksey Nikolaev.
//  Copyright © 2017 Aleksey Nikolaev. All rights reserved.
//

protocol FunctionalIntegerProtocol {
    func map<T, U>(_ transform: (T) throws -> U ) rethrows -> U?
    func flatMap<T, U>(_ transform: (T) throws -> U? ) rethrows -> U?
}

extension FunctionalIntegerProtocol {
    func map<T, U>(_ transform: (T) throws -> U ) rethrows -> U? { return try transform(self as! T) }
    func flatMap<T, U>(_ transform: (T) throws -> U? ) rethrows -> U? { return try transform(self as! T) }
}

extension UInt8: FunctionalIntegerProtocol { }
extension UInt16: FunctionalIntegerProtocol { }
extension UInt32: FunctionalIntegerProtocol { }
extension UInt64: FunctionalIntegerProtocol { }
extension UInt: FunctionalIntegerProtocol { }
extension Int8: FunctionalIntegerProtocol { }
extension Int16: FunctionalIntegerProtocol { }
extension Int32: FunctionalIntegerProtocol { }
extension Int64: FunctionalIntegerProtocol { }
extension Int: FunctionalIntegerProtocol { }

protocol FunctionalFloatProtocol {
    func map<T, U>(_ transform: (T) throws -> U ) rethrows -> U?
    func flatMap<T, U>(_ transform: (T) throws -> U? ) rethrows -> U?
}

extension FunctionalFloatProtocol where Self: BinaryFloatingPoint {
    func map<T, U>(_ transform: (T) throws -> U ) rethrows -> U? {
        return !self.isNaN && self.isFinite ? try transform(self as! T) : nil
    }
    func flatMap<T, U>(_ transform: (T) throws -> U? ) rethrows -> U? {
        return !self.isNaN && self.isFinite ? try transform(self as! T) : nil
    }
}

extension Float80: FunctionalFloatProtocol { }
extension Double: FunctionalFloatProtocol { }
extension Float: FunctionalFloatProtocol { }

protocol FunctionalBoolProtocol {
    func map<T>(_ transform: () throws -> T ) rethrows -> T?
    func flatMap<T>(_ transform: () throws -> T? ) rethrows -> T?
}

extension FunctionalBoolProtocol {
    func map<T>(_ transform: () throws -> T ) rethrows -> T? {
        return self as! Bool ? try transform() : nil
    }
    func flatMap<T>(_ transform: () throws -> T? ) rethrows -> T? {
        return self as! Bool ? try transform() : nil
    }
}

extension Bool: FunctionalBoolProtocol { }
