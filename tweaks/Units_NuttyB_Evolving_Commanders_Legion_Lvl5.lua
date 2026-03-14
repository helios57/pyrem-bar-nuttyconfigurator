-- LEGION_COMMANDER_LVL5_START
{
  legcomlvl5 = {
    footprintx = 2,
    footprintz = 2,
    canresurrect = true,
    energymake = 3800,
    metalmake = 90,
    speed = 105,
    builddistance = 650,
    workertime = 3500,
    autoheal = 6500,
    health = 85000,
    buildoptions = {
      'legdeflector', 'legbombard', 'legadvestore', 'legmoho', 'legadveconv', 'legarad', 'legajam',
      'legkeres', 'legacluster', 'legamstor', 'legflak', 'legabm', 'legbastion', 'legbastiont4',
      'legnanotct2', 'legrwall', 'leglab', 'legvp', 'legap', 'legtarg', 'legsd', 'leglraa',
      'legdtl', 'legdtf', 'legministarfall', 'legstarfall', 'leggatet3', 'legperdition', 'legsilo', 'legnanotct3',
      'epic_flak'
    },
    customparams = {
      evolution_target = 'legcomlvl6',
      evolution_condition = 'timer_global',
      evolution_timer = 3120,
    },
    weapondefs = {
      machinegun = {
        accuracy = 60, areaofeffect = 12, avoidfeature = false, beamburst = true, beamdecay = 1, beamtime = 0.07,
        burst = 8, burstrate = 0.08, craterareaofeffect = 0, craterboost = 0, cratermult = 0, edgeeffectiveness = 1,
        explosiongenerator = "custom:laserhit-medium-red", firestarter = 10, impulsefactor = 0, largebeamlaser = true,
        laserflaresize = 35, name = "Heavy Rapid-fire armor-piercing laser", noselfdamage = true, pulsespeed = "q8",
        range = 1300, reloadtime = 0.40, rgbcolor = "0.7 0.3 1.0", rgbcolor2 = "0.8 0.6 1.0", soundhitwet = "sizzle",
        soundstart = "lasfirerc", soundtrigger = 1, sprayangle = 400, targetborder = 0.2, thickness = 7,
        tolerance = 4500, turret = true, weapontype = "BeamLaser", weaponvelocity = 1100,
        damage = { default = 2000, vtol = 280 },
      },
      shotgunarm = {
        areaofeffect = 130, commandfire = true, avoidfeature = false, craterboost = 0, cratermult = 0, edgeeffectiveness = 0.65,
        explosiongenerator = "custom:genericshellexplosion-medium", impulsefactor = 0.8, intensity = 0.2, mygravity = 1,
        name = "Heavy GaussCannon", noselfdamage = true, predictboost = 1, projectiles = 32, range = 750, reloadtime = 0.8,
        rgbcolor = "0.8 0.4 1.0", size = 5, sizeDecay = 0.044, stages = 16, alphaDecay = 0.66, soundhit = "xplomed2xs",
        soundhitwet = "splsmed", soundstart = "kroggie2xs", sprayangle = 3800, tolerance = 6000, turret = true,
        waterweapon = true, weapontimer = 2, weapontype = "Cannon", weaponvelocity = 1100, stockpile = true, stockpiletime = 1.5,
        customparams = { stockpilelimit = 75 }, damage = { default = 13000, commanders = 0 },
      },
      exp_heavyrocket = {
        areaofeffect = 90, collidefriendly = 0, collidefeature = 0, energypershot = 150, avoidfeature = 0, avoidfriendly = 0,
        burst = 6, burstrate = 0.2, cegtag = "missiletrailsmall-red", craterboost = 0, craterareaofeffect = 0, cratermult = 0,
        dance = 24, edgeeffectiveness = 0.65, explosiongenerator = "custom:burnblack", firestarter = 70, flighttime = 1.05,
        impulsefactor = 0.123, impactonly = 1, model = "catapultmissile.s3o", movingaccuracy = 600, name = "Raptor Barrage",
        noselfdamage = true, range = 900, reloadtime = 0.8, smoketrail = true, smokePeriod = 4, smoketime = 16,
        smokesize = 9.5, smokecolor = 0.5, size = 2.5, smokeTrailCastShadow = false, soundhit = "rockhit", soundhitwet = "splsmed",
        soundstart = "rapidrocket3", startvelocity = 185, rgbcolor = '1 0.25 0.1', trajectoryheight = 1, targetmoveerror = 0.2,
        turnrate = 6000, tracks = true, turret = true, allowNonBlockingAim = true, weaponacceleration = 750, weapontimer = 6,
        weapontype = "MissileLauncher", weaponvelocity = 1100, wobble = 2500, damage = { default = 1800 },
        customparams = { exclude_preaim = true, overrange_distance = 777, projectile_destruction_method = "descend" },
      },
    },
    weapons = {
      [1] = { def = 'machinegun', onlytargetcategory = 'NOTSUB', fastautoretargeting = true },
      [3] = { def = 'shotgunarm', onlytargetcategory = 'WEAPON' },
      [5] = { def = 'exp_heavyrocket', onlytargetcategory = 'SURFACE' },
    },
  }
}
-- LEGION_COMMANDER_LVL5_END
