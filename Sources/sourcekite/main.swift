import sourcekitd
#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

//assumption:single-thread
//unicode:测试

enum ParsingState {
    case endRequest
    case startRequestContent    
}

func printResponse(forRequest reqid: Int, _ resp: sourcekitd_response_t) -> Bool  {
    print(reqid) 
    let IsError = sourcekitd_response_is_error(resp)
    // if (IsError) {//TODO
    // sourcekitd_response_description_dump(resp)
    // } else {
    let respCStr:UnsafeMutablePointer<Int8>! = 
        sourcekitd_response_description_copy(resp)
    let rsp = String(cString: respCStr)
    print(rsp)
    // }
    print("")
    
    fflush(stdout)//workaround for swift print
    sourcekitd_response_dispose(resp)
    free(respCStr)
    return IsError
}

debugLog("sourcekitd_initialize")
sourcekitd_initialize()

var (hasError, requestContent, reqid, state) = 
    (false,   "",            -1,   ParsingState.endRequest)
while let input = readLine() {
    debugLog("state: \(state)")
    debugLog("input: \(input)")
    debugLog("input length: \(input.lengthOfBytes(using: String.Encoding.utf8))")
    switch state {
    case .endRequest:
        guard let id = Int(input) else {
            debugLog("wrong format for reqid")
            hasError = true
            break 
        }
        reqid = id
        state = .startRequestContent
    case .startRequestContent:
        if input == "" {
            debugLog("requestContent: \(requestContent)")
            let req: sourcekitd_object_t =
                sourcekitd_request_create_from_yaml(requestContent, nil);
            let resp: sourcekitd_response_t = sourcekitd_send_request_sync(req)
            hasError = printResponse(forRequest: reqid, resp)
            debugLog("hasError: \(hasError)")
            //reset all state
            (hasError, requestContent, reqid, state) = 
                (false,   "",            -1,   ParsingState.endRequest)
        } else {
            requestContent += input
        }
    default://TODO endSession, should not used
        debugLog("sourcekite session ended.")
        sourcekitd_shutdown()
        break
    }
}//FIXME


sourcekitd_shutdown()

