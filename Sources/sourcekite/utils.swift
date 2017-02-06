import Foundation

func debugLog(
    _ message: String, 
    filename: String = #file, 
    function: String = #function, 
    line: Int = #line) {
    #if DEBUG
        //https://bugs.swift.org/browse/SR-3662
        // NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
        print("|||[\((NSString(string: filename)).lastPathComponent):\(line)] \(function) - \(message)")
    #endif
}