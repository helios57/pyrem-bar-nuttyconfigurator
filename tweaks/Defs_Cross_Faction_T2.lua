-- Cross Faction T2
-- Decoded from tweakdata.txt line 4

--Cross Faction Tax 70%
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
-- CROSS_FACTION_START
do
local unitDefs,taxMultiplier,tierTwoFactories,taxedDefs,language,suffix,labelSuffix=UnitDefs or{},1.7,{}, {},Json.decode(VFS.LoadFile('language/en/units.json')),'_taxed',' (Taxed)'

local function ensureBuildOption(builderName, optionName, optionSource)
	local builder = unitDefs[builderName]
	local optionDef = optionSource and optionSource[optionName] or unitDefs[optionName]
	if not builder or not optionDef or not optionName then
		return
	end

	builder.buildoptions = builder.buildoptions or {}
	for i = 1, #builder.buildoptions do
		if builder.buildoptions[i] == optionName then
			return
		end
	end

	builder.buildoptions[#builder.buildoptions + 1] = optionName
end

local smatch = string.match
local ssub = string.sub
local tmerge = table.merge
local tmergeInPlace = table.mergeInPlace or table.merge
local pairs = pairs
local ipairs = ipairs
local factions = {'arm', 'cor', 'leg'}

local buildersList = {}

for unitName,def in pairs(unitDefs)do
	-- Aggregate builders first so we don't have to sweep unitDefs a second time
	if def.buildoptions then
		buildersList[unitName] = def
	end

	if def.customparams and def.customparams.subfolder and(smatch(def.customparams.subfolder, 'Fact') or smatch(def.customparams.subfolder, 'Lab')) and def.customparams.techlevel==2 then
		local humanName=language and language.units.names[unitName]or unitName
		tierTwoFactories[unitName]=true
		taxedDefs[unitName..suffix]=tmerge(def,{
			energycost=def.energycost*taxMultiplier,
			icontype=unitName,
			metalcost=def.metalcost*taxMultiplier,
			name=humanName..' (Taxed)',
			customparams={
				i18n_en_humanname=humanName..labelSuffix,
				i18n_en_tooltip=language and language.units.descriptions[unitName]or unitName
			}
		})
	end
end

for builderName,builder in pairs(buildersList)do
	for _,optionName in ipairs(builder.buildoptions)do
		if tierTwoFactories[optionName] then
			for _,factionPrefix in ipairs(factions)do
				local taxedName=factionPrefix..ssub(optionName, 4)..suffix
				if ssub(optionName, 1, 3)~=factionPrefix and taxedDefs[taxedName] then
					ensureBuildOption(builderName,taxedName,taxedDefs)
				end
			end
		end
	end
end

tmergeInPlace(unitDefs,taxedDefs)
end
-- CROSS_FACTION_END
