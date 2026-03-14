-- LEGION_COMMANDER_LVL6_START
{
  legcomlvl6 = {
    footprintx = 2,
    footprintz = 2,
    canresurrect = true,
    energymake = 5500,
    metalmake = 120,
    speed = 110,
    builddistance = 850,
    workertime = 6000,
    autoheal = 10000,
    health = 125000,
    buildoptions = {
      'legdeflector', 'legbombard', 'legadvestore', 'legmoho', 'legadveconv', 'legarad', 'legajam',
      'legkeres', 'legacluster', 'legamstor', 'legflak', 'legabm', 'legbastion', 'legbastiont4',
      'legnanotct2', 'legrwall', 'leglab', 'legvp', 'legap', 'legtarg', 'legsd', 'leglraa',
      'legdtl', 'legdtf', 'legministarfall', 'legstarfall', 'leggatet3', 'legperdition', 'legsilo', 'legnanotct3',
      'epic_flak', 'legendary_odin'
    },
    weapondefs = {
      machinegun = {
        accuracy = 40, areaofeffect = 16, avoidfeature = false, beamburst = true, beamdecay = 1, beamtime = 0.07,
        burst = 12, burstrate = 0.06, craterareaofeffect = 0, craterboost = 0, cratermult = 0, edgeeffectiveness = 1,
        explosiongenerator = "custom:laserhit-medium-red", firestarter = 10, impulsefactor = 0, largebeamlaser = true,
        laserflaresize = 45, name = "Apocalyptic Rapid-fire armor-piercing laser", noselfdamage = true, pulsespeed = "q8",
        range = 1500, reloadtime = 0.30, rgbcolor = "0.7 0.3 1.0", rgbcolor2 = "0.8 0.6 1.0", soundhitwet = "sizzle",
        soundstart = "lasfirerc", soundtrigger = 1, sprayangle = 300, targetborder = 0.2, thickness = 9,
        tolerance = 4500, turret = true, weapontype = "BeamLaser", weaponvelocity = 1300,
        damage = { default = 2800, vtol = 480 },
      },
      shotgunarm = {
        areaofeffect = 150, commandfire = true, avoidfeature = false, craterboost = 0, cratermult = 0, edgeeffectiveness = 0.65,
        explosiongenerator = "custom:genericshellexplosion-medium", impulsefactor = 0.8, intensity = 0.2, mygravity = 1,
        name = "Apocalyptic GaussCannon", noselfdamage = true, predictboost = 1, projectiles = 48, range = 850, reloadtime = 0.6,
        rgbcolor = "0.8 0.4 1.0", size = 6, sizeDecay = 0.044, stages = 16, alphaDecay = 0.66, soundhit = "xplomed2xs",
        soundhitwet = "splsmed", soundstart = "kroggie2xs", sprayangle = 4200, tolerance = 6000, turret = true,
        waterweapon = true, weapontimer = 2, weapontype = "Cannon", weaponvelocity = 1300, stockpile = true, stockpiletime = 1.0,
        customparams = { stockpilelimit = 100 }, damage = { default = 18000, commanders = 0 },
      },
      exp_heavyrocket = {
        areaofeffect = 110, collidefriendly = 0, collidefeature = 0, energypershot = 200, avoidfeature = 0, avoidfriendly = 0,
        burst = 10, burstrate = 0.15, cegtag = "missiletrailsmall-red", craterboost = 0, craterareaofeffect = 0, cratermult = 0,
        dance = 24, edgeeffectiveness = 0.65, explosiongenerator = "custom:burnblack", firestarter = 70, flighttime = 1.05,
        impulsefactor = 0.123, impactonly = 1, model = "catapultmissile.s3o", movingaccuracy = 600, name = "Apocalyptic Raptor Swarm",
        noselfdamage = true, range = 1100, reloadtime = 0.6, smoketrail = true, smokePeriod = 4, smoketime = 16,
        smokesize = 10.5, smokecolor = 0.5, size = 3, smokeTrailCastShadow = false, soundhit = "rockhit", soundhitwet = "splsmed",
        soundstart = "rapidrocket3", startvelocity = 200, rgbcolor = '1 0.25 0.1', trajectoryheight = 1, targetmoveerror = 0.2,
        turnrate = 7000, tracks = true, turret = true, allowNonBlockingAim = true, weaponacceleration = 850, weapontimer = 6,
        weapontype = "MissileLauncher", weaponvelocity = 1300, wobble = 3000, damage = { default = 2500 },
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
-- LEGION_COMMANDER_LVL6_END
