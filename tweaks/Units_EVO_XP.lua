-- EVO_XP_START
local smatch = string.match
local pairs = pairs
for name, ud in pairs(UnitDefs) do
	if smatch(name, 'comlvl%d') or smatch(name, 'armcom') or smatch(name, 'corcom') or smatch(name, 'legcom') then
		ud.customparams = ud.customparams or {}
		ud.customparams.inheritxpratemultiplier = 0.5
		ud.customparams.childreninheritxp = 'TURRET MOBILEBUILT'
		ud.customparams.parentsinheritxp = 'TURRET MOBILEBUILT'
	end
end
-- EVO_XP_END
