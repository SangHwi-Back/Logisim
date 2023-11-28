//
//  Logisim_FileManagerTests.swift
//  Logisim-FileManagerTests
//
//  Created by 백상휘 on 2023/11/27.
//

import XCTest
@testable import Logisim_FileManager

final class Logisim_FileManagerTests: XCTestCase {
    func test_폴더_만들기() {
        do {
            let url = try FileManager.default
                .folderURL(folderName: "폴더만들기")
            XCTAssertTrue(url.isFileExists)
        } catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func test_폴더_가져오기() {
        do {
            let folderURL = try FileManager.default.url(
                for: .documentDirectory,
                in: .allDomainsMask,
                appropriateFor: nil,
                create: true)
                .appendingPathExtension("폴더만들기")
            
            if folderURL.isFolderExists == false {
                let _ = try FileManager.default.folderURL(folderName: "폴더만들기")
            }
            XCTAssertTrue(folderURL.isFolderExists)
        } catch {
            XCTAssertThrowsError(error)
        }
    }
}
