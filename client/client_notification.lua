local t_alert = 
{
    "error", --> Will print error by default if the parametre is empty.
    "warning",
    "success"
}

RegisterNetEvent("GTA_NUI_ShowNotif_client")
AddEventHandler("GTA_NUI_ShowNotif_client",function(data_text, data_type)
    exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = data_text,
        type = data_type --> Your type between error/success/warning
    })
end)

--> This is the main function of the notification :
function GTA_NUI_ShowNotification(setup)
    local text = setup.text or " "
    local config_alert = setup.type or t_alert[1]
    local typeAlert = t_alert[config_alert]

    SendNUIMessage({
        type = "notification_main",
        activate = true,
        data_type = config_alert,
        data_text = text
    })
end


--> CallBack Main from NUI : used to add the sound.
RegisterNUICallback("main", function()
    -->"blop" = the file .ogg used to play the sound.
    -->"0.3" = the limit volume of the sound.
    TriggerServerEvent("InteractSound_SV:PlayOnSource", 'blop', 0.3) --> play sound.
end)


--> CallBack Error from NUI : used to exit the nui + show the data error.
RegisterNUICallback("error", function()
    print("NUI WANTED ERROR : Text empty or type notif not valid.")
end)