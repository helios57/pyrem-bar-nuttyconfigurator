-- Doom Mode
-- Themed raptor escalation with elite substitutions and rare scav cameos

-- DOOM_MODE_CORE_START
do
local defs = UnitDefs or {}
local merge = table.merge
local copy = table.copy
local pairs = pairs
local type = type
local next = next
local mmax = math.max
local mfloor = math.floor

local function scaled(value, multiplier)
    return mmax(1, mfloor(value * multiplier + 0.5))
end

local function applyWeaponTweak(weaponDef, tweak)
    if not weaponDef then
        return nil
    end

    local patched = copy and copy(weaponDef) or merge(weaponDef, {})
    if patched.damage then
        patched.damage = copy and copy(patched.damage) or merge(patched.damage, {})
    end

    for key, value in pairs(tweak) do
        if key ~= 'damageMultiplier' then
            patched[key] = value
        end
    end

    if tweak.damageMultiplier and patched.damage then
        for damageType, amount in pairs(patched.damage) do
            if type(amount) == 'number' then
                patched.damage[damageType] = scaled(amount, tweak.damageMultiplier)
            end
        end
    end

    return patched
end

local function boost(name, scale)
    local unitDef = defs[name]
    if not unitDef then
        return
    end

    local patch = {}
    if scale.health and unitDef.health then
        patch.health = scaled(unitDef.health, scale.health)
    end
    if scale.speed and unitDef.speed then
        patch.speed = scaled(unitDef.speed, scale.speed)
    end
    if scale.autoheal and unitDef.autoheal then
        patch.autoheal = scaled(unitDef.autoheal, scale.autoheal)
    end
    if scale.turnrate and unitDef.turnrate then
        patch.turnrate = scaled(unitDef.turnrate, scale.turnrate)
    end

    if next(patch) then
        defs[name] = merge(unitDef, patch)
    end
end

local function elite(source, target, label, tooltip, scale, extra, weaponTweaks)
    local base = defs[source]
    if not base or defs[target] then
        return
    end

    local patch = extra and merge({}, extra) or {}
    if scale.health and base.health then
        patch.health = scaled(base.health, scale.health)
    end
    if scale.speed and base.speed then
        patch.speed = scaled(base.speed, scale.speed)
    end
    if scale.autoheal and base.autoheal then
        patch.autoheal = scaled(base.autoheal, scale.autoheal)
    end
    if scale.turnrate and base.turnrate then
        patch.turnrate = scaled(base.turnrate, scale.turnrate)
    end

    defs[target] = merge(base, patch)
    local unitDef = defs[target]
    unitDef.name = label
    unitDef.customparams = merge(unitDef.customparams or {}, {
        i18n_en_humanname = label,
        i18n_en_tooltip = tooltip,
        subfolder = 'other/raptors',
    })

    if weaponTweaks and base.weapondefs then
        unitDef.weapondefs = unitDef.weapondefs or {}
        for weaponName, tweak in pairs(weaponTweaks) do
            if base.weapondefs[weaponName] then
                unitDef.weapondefs[weaponName] = applyWeaponTweak(base.weapondefs[weaponName], tweak)
            end
        end
    end
end

local function cap(name, limit)
    local unitDef = defs[name]
    if unitDef then
        defs[name] = merge(unitDef, { maxthisunit = limit })
    end
end

boost('raptor_land_swarmer_basic_t1_v1', { health = 1.18, speed = 1.03 })
boost('raptor_land_swarmer_basic_t2_v1', { health = 1.16, speed = 1.04 })
boost('raptor_land_assault_basic_t2_v1', { health = 1.18, speed = 1.04 })
boost('raptor_allterrain_arty_basic_t2_v1', { health = 1.2 })
boost('raptor_air_fighter_basic_t2_v1', { health = 1.14, speed = 1.05 })
boost('raptor_land_swarmer_heal_t2_v1', { health = 1.18, autoheal = 1.25 })

-- Commander 5x health boost for Doom Mode survivability
local comPrefixes = { 'armcom', 'corcom', 'legcom' }
for _, prefix in ipairs(comPrefixes) do
    boost(prefix, { health = 5 })
    for lvl = 2, 6 do
        boost(prefix .. 'lvl' .. lvl, { health = 5 })
    end
end

cap('raptor_matriarch_fire', 1)
cap('raptor_matriarch_basic', 1)
cap('raptor_queen_veryeasy', 1)
cap('armscavengerbossv2_hard', 1)
cap('scavengerbossv4_normal', 1)

elite(
    'raptor_land_swarmer_emp_t2_v1',
    'raptor_doom_shockling',
    'Shockling Prime',
    'Fast EMP vanguard that opens themed shock waves.',
    { health = 1.7, speed = 1.1 },
    { maxthisunit = 18 },
    {
        raptorparalyzersmall = {
            damageMultiplier = 1.35,
            paralyzetime = 8,
            rgbcolor = '0.85 0.65 1.0',
            rgbcolor2 = '0.35 1.0 1.0',
        },
    }
)

elite(
    'raptor_land_assault_emp_t2_v1',
    'raptor_doom_shockmaw',
    'Shockmaw Alpha',
    'Heavy control predator that anchors EMP stampedes.',
    { health = 2.1, speed = 1.08 },
    { maxthisunit = 10 },
    {
        raptorparalyzerbig = {
            damageMultiplier = 1.45,
            paralyzetime = 12,
            areaofeffect = 120,
            rgbcolor = '0.8 0.55 1.0',
            rgbcolor2 = '0.4 0.9 1.0',
        },
    }
)

elite(
    'raptor_allterrain_arty_emp_t4_v1',
    'raptor_doom_ionmortar',
    'Ion Mortar',
    'Long-range paralyzer siege beast for nightmare pressure spikes.',
    { health = 1.65 },
    { maxthisunit = 6 },
    {
        goolauncher = {
            damageMultiplier = 1.4,
            areaofeffect = 192,
            paralyzetime = 12,
            rgbcolor = '0.75 0.75 1.0',
            rgbcolor2 = '0.4 1.0 1.0',
        },
    }
)

elite(
    'raptor_air_bomber_emp_t2_v1',
    'raptor_doom_stormwing',
    'Stormwing',
    'Fast disruption bomber that turns air raids into doom signals.',
    { health = 1.55, speed = 1.08 },
    { maxthisunit = 8 },
    {
        weapon = {
            damageMultiplier = 1.3,
            areaofeffect = 192,
            paralyzetime = 11,
        },
    }
)

elite(
    'raptor_land_swarmer_acids_t2_v1',
    'raptor_doom_blightling',
    'Blightling',
    'Acid runner bred for corrosive swarm themes.',
    { health = 1.65, speed = 1.12 },
    { maxthisunit = 18 }
)

elite(
    'raptor_matriarch_acid',
    'raptor_doom_blightmatron',
    'Blight Matron',
    'Corrosive apex matriarch that headlines acid bloom waves.',
    { health = 1.25, speed = 1.06 },
    { maxthisunit = 2 }
)

elite(
    'raptor_land_assault_basic_t4_v1',
    'raptor_doom_cindermaw',
    'Cindermaw',
    'Pyro-bruiser used for close-range stampede waves.',
    { health = 1.5, speed = 1.08 },
    { maxthisunit = 12 }
)

elite(
    'raptor_land_swarmer_brood_t4_v1',
    'raptor_doom_broodguard',
    'Broodguard',
    'Tankier brood escort that keeps themed pushes cohesive.',
    { health = 1.7, speed = 1.04 },
    { maxthisunit = 10 }
)

elite(
    'raptor_matriarch_electric',
    'raptor_doom_shiverqueen',
    'Shiver Queen',
    'Nightmare EMP matriarch that freezes frontlines in place.',
    { health = 1.22, speed = 1.05 },
    { maxthisunit = 2 },
    {
        goo = { damageMultiplier = 1.35, paralyzetime = 15 },
        melee = { damageMultiplier = 1.3, paralyzetime = 15 },
        spike_emp_blob = { damageMultiplier = 1.25, paralyzetime = 15 },
    }
)
end

-- DOOM_MODE_CORE_END

-- DOOM_MODE_WAVES_START
do
local defs = UnitDefs or {}
local merge = table.merge

local function squad(minAnger, maxAnger, behavior, amount, rarity, weight, distance, chance)
    local originalAmount = amount or 1
    local adjustedAmount = math.max(1, math.floor(originalAmount / 2))
    local compMult = originalAmount / adjustedAmount

    return {
        raptorcustomsquad = true,
        raptorsquadunitsamount = adjustedAmount,
        raptorsquadminanger = minAnger,
        raptorsquadmaxanger = maxAnger,
        raptorsquadweight = weight or 1,
        raptorsquadrarity = rarity or 'basic',
        raptorsquadbehavior = behavior or 'berserk',
        raptorsquadbehaviordistance = distance or 500,
        raptorsquadbehaviorchance = chance or 0.75,
        _doom_comp_mult = compMult,
    }
end

local function assignSquad(name, params, label, tooltip)
    local unitDef = defs[name]
    if not unitDef then
        return
    end

    local compMult = params._doom_comp_mult or 1
    params._doom_comp_mult = nil

    local custom = merge(unitDef.customparams or {}, params)
    if label then
        custom.i18n_en_humanname = label
    end
    if tooltip then
        custom.i18n_en_tooltip = tooltip
    end
    unitDef.customparams = custom

    if compMult > 1.01 then
        if unitDef.health then
            unitDef.health = math.floor(unitDef.health * compMult + 0.5)
        end
        if unitDef.weapondefs then
            for _, wdef in pairs(unitDef.weapondefs) do
                if wdef.damage then
                    for k, v in pairs(wdef.damage) do
                        if type(v) == "number" then
                            wdef.damage[k] = math.floor(v * compMult + 0.5)
                        end
                    end
                end
            end
        end
    end
end

assignSquad('raptor_land_assault_basic_t2_v1', squad(0, 18, 'berserk', 6, 'basic', 7, 500, 0.82))
assignSquad('raptor_land_swarmer_basic_t2_v1', squad(4, 18, 'raider', 7, 'basic', 9, 500, 0.8))
assignSquad('raptor_land_swarmer_emp_t2_v1', squad(12, 26, 'raider', 5, 'basic', 8, 500, 0.78), 'Shock Swarmer', 'Fast control packs that signal Doom Mode is ramping.')
assignSquad('raptor_doom_shockling', squad(18, 34, 'raider', 6, 'special', 6, 550, 0.8))
assignSquad('raptor_allterrain_arty_emp_t2_v1', squad(20, 38, 'artillery', 4, 'special', 4, 1600, 0.72), 'Shock Mortar', 'EMP siege support for shock-themed waves.')
assignSquad('raptor_doom_shockmaw', squad(28, 48, 'berserk', 3, 'special', 3, 600, 0.82))
assignSquad('raptor_doom_ionmortar', squad(58, 92, 'artillery', 2, 'special', 2, 2200, 0.68))

assignSquad('raptor_land_swarmer_acids_t2_v1', squad(10, 24, 'raider', 6, 'basic', 8, 500, 0.8), 'Blight Swarmer', 'Corrosive flankers that make acid bloom waves feel unfair in the right way.')
assignSquad('raptor_doom_blightling', squad(18, 36, 'raider', 7, 'special', 6, 550, 0.8))
assignSquad('raptor_allterrain_arty_acid_t2_v1', squad(22, 42, 'artillery', 4, 'special', 3, 1800, 0.72), 'Blight Mortar', 'Acid artillery used in bloom-themed pressure waves.')
assignSquad('raptor_doom_blightmatron', squad(52, 82, 'berserk', 1, 'special', 2, 650, 0.6))

assignSquad('raptor_land_swarmer_fire_t2_v1', squad(14, 30, 'berserk', 5, 'basic', 6, 500, 0.78), 'Cinder Swarmer', 'Pyro rushers for stampede waves.')
assignSquad('raptor_land_assault_basic_t4_v1', squad(24, 45, 'berserk', 4, 'special', 4, 550, 0.76), 'Stampede Brawler', 'Heavy bruisers that replace raw count with raw panic.')
assignSquad('raptor_doom_cindermaw', squad(30, 58, 'berserk', 3, 'special', 3, 600, 0.82))

assignSquad('raptor_land_swarmer_heal_t2_v1', squad(16, 40, 'raider', 6, 'basic', 3, 500, 0.66), 'Brood Healer', 'Support wave that keeps brutal pushes alive longer.')
assignSquad('raptor_land_swarmer_heal_t3_v1', squad(30, 60, 'raider', 4, 'special', 2, 600, 0.7), 'Brood Shepherd', 'Higher-tier support that turns attrition into a losing trade.')
assignSquad('raptor_land_swarmer_brood_t4_v1', squad(44, 78, 'raider', 8, 'special', 3, 550, 0.74), 'Brood Stampede', 'Hatchling avalanche used as a themed transition into nightmare waves.')
assignSquad('raptor_doom_broodguard', squad(36, 70, 'berserk', 5, 'special', 2, 600, 0.72))

assignSquad('raptor_air_fighter_basic_t2_v1', squad(12, 26, 'raider', 7, 'basic', 5, 700, 0.72), 'Shrieker Flight', 'Air cover that keeps anti-swarm defenses honest.')
assignSquad('raptor_air_bomber_basic_t2_v1', squad(24, 45, 'artillery', 4, 'special', 3, 1200, 0.7), 'Ruin Bombardiers', 'Themed bombing run that punishes static greed.')
assignSquad('raptor_doom_stormwing', squad(32, 55, 'raider', 4, 'special', 2, 900, 0.72))

assignSquad('raptor_matriarch_fire', squad(56, 90, 'berserk', 1, 'special', 2, 650, 0.52), 'Pyro Matron', 'Rare theme boss for cinder stampedes.')
assignSquad('raptor_matriarch_basic', squad(60, 92, 'berserk', 1, 'special', 2, 650, 0.52), 'Matron of Ruin', 'Late-wave centerpiece that adds weight without adding clutter.')
assignSquad('raptor_doom_shiverqueen', squad(62, 95, 'berserk', 1, 'special', 2, 700, 0.5))
assignSquad('raptor_queen_veryeasy', squad(88, 120, 'berserk', 1, 'special', 1, 700, 0.34), 'Doom Queenling', 'Nightmare signature wave with a queen-led spearhead.')
assignSquad('armscavengerbossv2_hard', squad(78, 102, 'artillery', 1, 'special', 1, 1500, 0.34), 'Scav Harbinger', 'Rare scav cameo commander that arrives as a themed siege escort.')
assignSquad('scavengerbossv4_normal', squad(92, 130, 'berserk', 1, 'special', 1, 900, 0.28), 'Scav Nightmare Core', 'Rare hybrid endgame cameo that turns one wave into an event.')
end

-- DOOM_MODE_WAVES_END
