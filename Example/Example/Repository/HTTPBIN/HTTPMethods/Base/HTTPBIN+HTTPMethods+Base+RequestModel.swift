//
//  HTTPBIN+HTTPMethods+Base+RequestModel.swift
//  Example
//
//  Copyright (c) 2023 Bahadır A. Güder
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

// MARK: BaseRequestModel

extension HTTPBIN.HTTPMethods.Base {
    class RequestModel: Encodable {
        // swiftformat:disable all
        let foo: Int
        let bar: String
        // swiftformat:enable all

        // MARK: Initializer

        init(
            // swiftformat:disable all
            foo: Int,
            bar: String
            // swiftformat:enable all
        ) {
            // swiftformat:disable all
            self.foo = foo
            self.bar = bar
            // swiftformat:enable all
        }

        // MARK: Encodable

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // swiftformat:disable all
            try container.encode(foo, forKey: .foo)
            try container.encode(bar, forKey: .bar)
            // swiftformat:enable all
        }
    }
}

// MARK: CodingKeys

private extension HTTPBIN.HTTPMethods.Base.RequestModel {
    enum CodingKeys: String, CodingKey {
        case foo
        case bar
    }
}
