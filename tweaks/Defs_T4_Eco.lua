-- T4_ECO_START
do

local unitDefs = UnitDefs or {}
local merge = table.merge
local factions = {'arm', 'cor', 'leg'}
local legendaryScale = 2.0
local converterFootprint = 6
local fusionFootprint = 12

local function getConverterBaseName(faction)
	if faction == 'leg' then
		return 'legadveconvt3'
	end
	return faction .. 'mmkrt3'
end

local function getFusionBaseName(faction)
	return faction .. 'afust3'
end

local function makeYardmap(footprintx, footprintz)
	if not footprintx or not footprintz then return nil end
	return string.rep('o', footprintx * footprintz)
end

local function buildCustomParams(baseCustom, overrides)
	local customparams = merge(baseCustom or {}, overrides or {})
	if customparams then
		return customparams
	end
	return {}
end

local function cloneIfMissing(baseName, newName, overrides)
	local baseDef = unitDefs[baseName]
	if not baseDef or unitDefs[newName] then return end

	local newDef = merge(baseDef, overrides or {})
	newDef.customparams = newDef.customparams or {}
	unitDefs[newName] = newDef
end

local function scaled(value, multiplier)
	if value then
		return math.ceil(value * multiplier)
	end
	return nil
end

local function ensureBuildOptions(list, name)
	if not unitDefs[name] then return end
	for i = 1, #list do
		local u = unitDefs[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j = 1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

for _, faction in ipairs(factions) do
	local converterBaseName = getConverterBaseName(faction)
	local converterBase = unitDefs[converterBaseName]

	if converterBase then
		local baseCustom = converterBase.customparams or {}
		local legendaryConverterName = converterBaseName .. '_200'

		cloneIfMissing(converterBaseName, legendaryConverterName, {
			description = 'Legendary Energy Converter by Jackie',
			metalcost = scaled(converterBase.metalcost, legendaryScale),
			energycost = scaled(converterBase.energycost, legendaryScale),
			buildtime = scaled(converterBase.buildtime, legendaryScale),
			health = scaled(converterBase.health, legendaryScale * 6),
			customparams = buildCustomParams(baseCustom, {
				energyconv_capacity = scaled(baseCustom.energyconv_capacity, 2),
				energyconv_efficiency = 0.022,
				i18n_en_humanname = 'Legendary Energy Converter',
				i18n_en_tooltip = 'Convert 12k energy to 264m/s by Jackie (Extremely Explosive)'
			}),
			name = 'Legendary Energy Converter',
			buildpic = converterBase.buildpic,
			objectname = converterBase.objectname,
			footprintx = converterFootprint,
			footprintz = converterFootprint,
			yardmap = makeYardmap(converterFootprint, converterFootprint),
			script = converterBase.script,
			activatewhenbuilt = converterBase.activatewhenbuilt,
			sightdistance = converterBase.sightdistance,
			seismicsignature = converterBase.seismicsignature,
			idleautoheal = converterBase.idleautoheal,
			idletime = converterBase.idletime,
			maxslope = converterBase.maxslope,
			maxwaterdepth = converterBase.maxwaterdepth,
			maxacc = converterBase.maxacc,
			maxdec = converterBase.maxdec,
			explodeas = 'fusionExplosion',
			selfdestructas = 'fusionExplosion',
			corpse = converterBase.corpse,
			canrepeat = converterBase.canrepeat
		})

		if unitDefs[legendaryConverterName] then
			unitDefs[legendaryConverterName].customparams = unitDefs[legendaryConverterName].customparams or {}
		end
	end

	local fusionBaseName = getFusionBaseName(faction)
	local fusionBase = unitDefs[fusionBaseName]

	if fusionBase then
		local baseCustom = fusionBase.customparams or {}
		local legendaryFusionName = fusionBaseName .. '_200'

		cloneIfMissing(fusionBaseName, legendaryFusionName, {
			buildtime = scaled(fusionBase.buildtime, 1.8),
			name = 'Legendary Fusion Reactor',
			description = 'Legendary Fusion Reactor by Jackie (Extremely Explosive)',
			metalcost = scaled(fusionBase.metalcost, legendaryScale),
			energycost = scaled(fusionBase.energycost, legendaryScale),
			energymake = scaled(fusionBase.energymake, 2.4),
			energystorage = scaled(fusionBase.energystorage, 6.0),
			health = scaled(fusionBase.health, legendaryScale * 3),
			buildpic = fusionBase.buildpic,
			collisionvolumeoffsets = fusionBase.collisionvolumeoffsets,
			collisionvolumescales = fusionBase.collisionvolumescales,
			collisionvolumetype = fusionBase.collisionvolumetype,
			damagemodifier = 0.95,
			buildangle = fusionBase.buildangle,
			objectname = fusionBase.objectname,
			footprintx = fusionFootprint,
			footprintz = fusionFootprint,
			yardmap = makeYardmap(fusionFootprint, fusionFootprint),
			script = fusionBase.script,
			activatewhenbuilt = fusionBase.activatewhenbuilt,
			sightdistance = fusionBase.sightdistance,
			seismicsignature = fusionBase.seismicsignature,
			idleautoheal = scaled(fusionBase.idleautoheal, 6),
			idletime = fusionBase.idletime,
			maxslope = fusionBase.maxslope,
			maxwaterdepth = fusionBase.maxwaterdepth,
			maxacc = fusionBase.maxacc,
			maxdec = fusionBase.maxdec,
			explodeas = 'ScavComBossExplo',
			selfdestructas = 'ScavComBossExplo',
			corpse = fusionBase.corpse,
			canrepeat = fusionBase.canrepeat,
			customparams = buildCustomParams(baseCustom, {
				buildinggrounddecaldecayspeed = 30,
				buildinggrounddecalsizex = 18,
				buildinggrounddecalsizey = 18,
				removestop = true,
				removewait = true,
				techlevel = 3,
				unitgroup = 'energy',
				usebuildinggrounddecal = true,
				i18n_en_humanname = 'Legendary Fusion Reactor',
				i18n_en_tooltip = 'Convert 12k energy to 264m/s by Jackie (Extremely Explosive)'
			}),
			sfxtypes = {
				pieceexplosiongenerators = {
					[1] = 'deathceg2',
					[2] = 'deathceg3',
					[3] = 'deathceg4'
				}
			},
			sounds = {
				canceldestruct = 'cancel2',
				underattack = 'warning1',
				count = {'count6', 'count5', 'count4', 'count3', 'count2', 'count1'},
				select = {'fusion2'}
			}
		})

		if unitDefs[legendaryFusionName] then
			unitDefs[legendaryFusionName].customparams = unitDefs[legendaryFusionName].customparams or {}
		end
	end

	local groundBuilderName = faction .. 't3aide'
	local airBuilderName = faction .. 't3airaide'
	local optionNames = {
		converterBaseName .. '_200',
		fusionBaseName .. '_200'
	}

	for _, optionName in ipairs(optionNames) do
		ensureBuildOptions({groundBuilderName, airBuilderName}, optionName)
	end
end

for _, builderName in ipairs({'armack', 'armaca', 'armacv', 'corack', 'coraca', 'coracv', 'legack', 'legaca', 'legacv'}) do
	local builder = unitDefs[builderName]
	if builder then
		local factionPrefix = builderName:sub(1, 3)
		ensureBuildOptions({builderName}, getConverterBaseName(factionPrefix) .. '_200')
		ensureBuildOptions({builderName}, getFusionBaseName(factionPrefix) .. '_200')
	end
end
end

-- T4_ECO_END
