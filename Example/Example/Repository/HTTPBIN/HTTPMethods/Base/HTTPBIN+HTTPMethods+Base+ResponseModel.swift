//
//  HTTPBIN+HTTPMethods+Base+ResponseModel.swift
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

// MARK: BaseResponseModel

extension HTTPBIN.HTTPMethods.Base {
    class ResponseModel: Decodable {
        // swiftformat:disable all
        let args:    [String: String]
        let headers: [String: String]
        let origin:  String
        let url:     String
        // swiftformat:enable all

        // MARK: Decodable

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // swiftformat:disable all
            args    = try container.decode([String: String].self, forKey: .args)
            headers = try container.decode([String: String].self, forKey: .headers)
            origin  = try container.decode(String.self, forKey: .origin)
            url     = try container.decode(String.self, forKey: .url)
            // swiftformat:enable all
        }
    }
}

// MARK: CodingKeys

private extension HTTPBIN.HTTPMethods.Base.ResponseModel {
    enum CodingKeys: String, CodingKey {
        case args
        case headers
        case origin
        case url
    }
}
