--------------------------------------------------------------
-- Custom_Script
-- Author: YuJhin
-- DateCreated: 11/26/2021 2:12:59 PM
--------------------------------------------------------------
--  Lua API Documents (Unofficial)
--  https://docs.google.com/spreadsheets/d/1hQ8zlEHl1nfjCWvKqOlkDACezu5-igfQkVcOxeE_KG0/
--------------------------------------------------------------


if ( not ExposedMembers.CustomObject ) then
    ExposedMembers.CustomObject = {};
end


function tprint(t: table)
    for k,v in pairs(t) do
        local key   = tostring(k);
        local value = tostring(v);
        print(key .. " => " .. value);
    end
end


local function SetProperties()
    local playerId = Game.GetLocalPlayer();
    local pPlayer  = Players[PlayerId];
    local pCities  = pPlayer:GetCities();

    ExposedMembers.CustomObject.PlayerId = playerId;
    ExposedMembers.CustomObject.Player   = pPlayer;
    ExposedMembers.CustomObject.Cities   = pCities;
end


function Initialization()
    SetProperties();
    Events.LocalPlayerTurnBegin (
        function () tprint(ExposedMembers.CustomObject); end
    );
end


Initialization();
