--Example of utilisation : 
--[[
    For the type you have 3 different type : 
    error : that will show you a red pop pup notification.
    warning : that will show you a orange pop pup notification.
    success : that will show you a green pop pup notification.

    You can find all the notification type on the client_notification file.lua
]]

-->For the e.g we will show the notification by using command : 
RegisterCommand("notif", function(source, args)
    exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = "This is a notification using html/css/js and lua.",
        type = args[1]
    })
end, false)

-->e.g with using event server-side : 
RegisterCommand("notifevent", function(source)
    TriggerServerEvent("GTA_NUI_ShowNotif_server")
end, false)


--Else you will always use the function like this : 
--[[
    exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = "Your Text, Hello World !",
        type = "success" --> Your type between error/success/warning
    })
]]