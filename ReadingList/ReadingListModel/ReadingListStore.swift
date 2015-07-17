//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

import Foundation


// MARK: - File Utilities
//
let DocumentsURLs = NSFileManager.defaultManager().URLsForDirectory(
    NSSearchPathDirectory.DocumentDirectory, inDomains:
    NSSearchPathDomainMask.UserDomainMask)

func fileURLForDocument(name: String, #type: String) -> NSURL
{
    let fileURL = DocumentsURLs.first as! NSURL
    return fileURL.URLByAppendingPathComponent(name).URLByAppendingPathComponent(type)
}


// MARK: - ReadingListStore

public class ReadingListStore : NSObject
{
    let storeName: String
    let documentURL: NSURL
    
    public init(_ storeName: String)
    {
        self.storeName = storeName
        documentURL = fileURLForDocument(storeName, type: "plist")
        super.init()
    }
    
    public func readingList() -> ReadingList
    {
        var fileURL = documentURL
        
        if !NSFileManager.defaultManager().fileExistsAtPath(documentURL.path!)
        {
            let bundle = NSBundle(forClass: ReadingListStore.self)
            if let URL = bundle.URLForResource(storeName, withExtension: "plist") {
                fileURL = URL
            }
            else {
                println("\n*** WARNING: Unable to locate \(storeName) in app bundle. ***\n\n")
                abort()
            }
        }
        
        if let dict = NSDictionary(contentsOfURL: fileURL) as? [String: AnyObject] {
            return ReadingList(dictionary: dict)
        }
        else {
            println("\n*** WARNING: Unable to read file with URL \(fileURL). ***\n\n")
            abort()
        }
    }
    
    public func saveReadingList(readingList: ReadingList)
    {
        let dict: NSDictionary = readingList.dictionaryRepresentation()
        dict.writeToURL(documentURL, atomically: true)
    }
}