
-- Forms a mtapi response table (Given status, errormessage, and value)
mtapi.mkresponse = function (status, errormessage, returnresult)
    if status == nil then
        status = false
    end
    if errormessage == nil then
        errormessage = ""
    end
    return {success=status, errmsg=errormessage, value= returnresult}
end

-- Alias for mkresponse
mtapi.makeresponse = mtapi.mkresponse
mtapi.mkresp = mtapi.mkresponse

-- Checks if the mtapi response table is a good response
mtapi.okresponse = function (resp)
    if resp.success ~= nil then
        return resp.success
    end
    return false
end

-- Alias for okresponse
mtapi.okayresponse = mtapi.okresponse
mtapi.okresp = mtapi.okresponse
mtapi.okayresp = mtapi.okresponse
