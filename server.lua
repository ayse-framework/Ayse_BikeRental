AyseCore = exports["Ayse_Core"]:GetCoreObject()

RegisterNetEvent("Ayse_BikeRental:pay")
AddEventHandler("Ayse_BikeRental:pay", function(id)
    local bike = Config.cycles[id]
    if not bike then return end
    local src = source
    local player = AyseCore.Functions.GetPlayer(src)
    if player.cash >= bike.price then
        AyseCore.Functions.DeductMoney(bike.price, src, "cash")
        TriggerClientEvent("Ayse_BikeRental:confirm", src)
        return
    end
    TriggerClientEvent("Ayse_BikeRental:deny", src)
end)
