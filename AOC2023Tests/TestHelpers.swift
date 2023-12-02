//
//  TestHelpers.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 01/12/2023.
//

import Foundation

class TestHelpers {
    static func readFile(named name: String) throws -> String {
        let testBundle = Bundle(for: Self.self)
        let fileUrl = testBundle.url(forResource: name, withExtension: "txt")!
        let contents = try Data(contentsOf: fileUrl)
        print(fileUrl)
        return String(data: contents, encoding: .utf8)!

//        let fileUrl = URL(fileURLWithPath: FileManager.default.currentDirectoryPath.appending(name))
    }


}

