//
//  FileManager+Extensions.swift
//  Logisim-FileManager
//
//  Created by 백상휘 on 2023/11/28.
//

import Foundation

public enum FileManagerError: Error {
    case docListNotExists, folderNotExists, groupListNotExists, createDictionaryFailed, fileNotExists
    
}

extension FileManager {
    
    public func docListURL(folderName: String) throws -> [URL] {
        do {
            let folderURL = try FileManager.default.folderURL(folderName: folderName)
            
            let urls = try FileManager.default.contentsOfDirectory(atPath: folderURL.relativePath)
            
            return urls
                .sorted(by: {$0 < $1})
                .compactMap(URL.init(string:))
        } catch {
            throw FileManagerError.docListNotExists
        }
    }
    
    public func folderURL(folderName: String) throws -> URL {
        do {
            let result = try FileManager.default.url(
                for: .documentDirectory,
                in: .allDomainsMask,
                appropriateFor: nil,
                create: true)
                .appendingPathExtension(folderName)
            
            if FileManager.default.fileExists(atPath: result.relativePath) == false {
                try FileManager.default.createDirectory(
                    at: result,
                    withIntermediateDirectories: false)
            }
            
            return result
        } catch {
            throw FileManagerError.folderNotExists
        }
    }
    
    public func groupList() throws -> [URL] {
        do {
            let groupURL = try FileManager.default.url(
                for: .userDirectory,
                in: .allDomainsMask,
                appropriateFor: nil,
                create: true)
            
            if FileManager.default.fileExists(atPath: groupURL.relativePath) == false {
                try FileManager.default.createDirectory(
                    at: groupURL,
                    withIntermediateDirectories: false)
            }
            
            return try FileManager.default
                .contentsOfDirectory(atPath: groupURL.relativePath)
                .sorted(by: {$0 < $1})
                .compactMap(URL.init(string:))
            
        } catch {
            throw FileManagerError.groupListNotExists
        }
    }
    
    @discardableResult
    public func makeDirectoryIfNotExists(at url: URL) throws -> Bool {
        let isExists = url.isFileExists
        
        if isExists == false {
            
            do {
                try FileManager.default.createDirectory(
                    at: url,
                    withIntermediateDirectories: false)
            } catch {
                throw FileManagerError.createDictionaryFailed
            }
            
            return url.isFileExists
        } else {
            return isExists
        }
    }
    
    public func fetch(at url: URL) throws -> Data {
        guard let data = FileManager.default.contents(atPath: url.relativePath) else {
            throw FileManagerError.docListNotExists
        }
        
        return data
    }
}

extension URL {
    public var isFileExists: Bool {
        FileManager.default.fileExists(atPath: self.relativePath)
    }
    
    public var isFolderExists: Bool {
        var result = ObjCBool(false)
        FileManager.default.fileExists(atPath: self.relativePath, isDirectory: .some(&result))
        
        return result.boolValue
    }
}
