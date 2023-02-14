//
//  ContentView.swift
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

import SwiftUI

// MARK: View

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Text("Hello, world!")
        }
        .padding()
        .task { viewModel.makeRequest() }
    }
}

// MARK: Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: ViewModel

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        func makeRequest() {
            let endpoint = HTTPBIN.baseURL + HTTPBIN.HTTPMethods.Post.controllerURL

            guard let url = URL(string: endpoint) else { return }

            do {
                let httpBody = try JSONEncoder().encode(HTTPBIN.HTTPMethods.Post.RequestModel(foo: 34, bar: "Istanbul", baz: 3.4))

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = httpBody

                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data {
                        do {
                            let responseModel = try JSONDecoder().decode(HTTPBIN.HTTPMethods.Post.ResponseModel.self, from: data)
                            print(responseModel) // Set Breakpoint
                        } catch {
                            print(error.localizedDescription)
                        }
                    }

                    if let response {
                        print(response)
                    }

                    if let error {
                        print(error.localizedDescription)
                    }
                }

                task.resume()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
