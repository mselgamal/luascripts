
M = {}
function M.inbound_INVITE(msg)
  local from = msg:getHeader("From")
  local ext = string.match(from,":(.+)@")
  msg:removeHeader("Remote-Party-ID") // this line is not needed if there is no RPID in the invite
  if ext == "<insert target calling number>" then
    local tempfrom = string.match(from,"(<.+>.+)")
    local from_with_calling_name = "\"<insert calling name>\" " .. tempfrom
    msg:modifyHeader("From",from_with_calling_name)
  end
end
return M
