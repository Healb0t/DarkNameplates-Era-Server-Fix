local events = {
    'NAME_PLATE_UNIT_ADDED'
}

local AddElements = function(plate)
    for _, v in pairs({plate.healthBar.border:GetRegions()}) do
        v:SetVertexColor(0.0627450980392157, 0.0627450980392157, 0.0627450980392157)
    end
end

local OnEvent = function(self, event, ...)
    if event == 'NAME_PLATE_UNIT_ADDED' then
        local base = ...
        local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(base, issecure());

        AddElements(namePlateFrameBase.UnitFrame)
    end
end

local  e = CreateFrame'Frame'
for _, v in pairs(events) do e:RegisterEvent(v) end
e:SetScript('OnEvent', OnEvent)
