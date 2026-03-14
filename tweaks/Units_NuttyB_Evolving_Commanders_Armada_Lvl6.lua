-- ARMADA_COMMANDER_LVL6_START
{
  armcomlvl6 = {
    footprintx = 2,
    footprintz = 2,
    autoheal = 6000,
    builddistance = 850,
    canresurrect = true,
    energymake = 5000,
    health = 65000,
    speed = 98,
    metalmake = 160,
    workertime = 12000,
    buildoptions = {
      'armanni', 'armpb', 'armamb', 'armmoho', 'armuwmme', 'armflak', 'armmercury',
      'armgate', 'armsd', 'armfort', 'armtarg', 'armarad', 'armamd', 'armveil',
      'armuwadvms', 'armuwadves', 'armmmkr', 'armuwmmm', 'armavp', 'armaap',
      'armalab', 'armfflak', 'armatl', 'armkraken', 'armbrtha', 'armannit3',
      'armlwall', 'armgatet3', 'armannit4', 'armnanotct3', 'epic_mercury', 'legendary_pulsar'
    },
    weapondefs = {
      old_armsnipe_weapon = {
        areaofeffect = 96, avoidfeature = true, avoidfriendly = true, collidefeature = true, collidefriendly = false,
        corethickness = 0.95, commandfire = true, duration = 0.12, edgeeffectiveness = 1, energypershot = 4000,
        explosiongenerator = 'custom:laserhit-large-blue', firestarter = 100, impulseboost = 0.6, impulsefactor = 1.4,
        intensity = 2.0, name = 'Apocalyptic g2g armor-piercing rifle', range = 1600, reloadtime = 0.25,
        rgbcolor = '1.0 0.1 1.0', rgbcolor2 = '1.0 0.1 1.0', soundhit = 'sniperhit', soundhitwet = 'sizzle',
        soundstart = 'sniper3', soundtrigger = true, stockpile = true, stockpiletime = 1.0,
        customparams = { stockpilelimit = 30 }, texture1 = 'shot', texture2 = 'empty', thickness = 10,
        tolerance = 1000, turret = true, weapontype = 'LaserCannon', weaponvelocity = 6000,
        damage = { commanders = 10, default = 85000 },
      },
      ata = {
        areaofeffect = 20, avoidfeature = false, beamtime = 2.0, collidefriendly = false, corethickness = 0.75,
        edgeeffectiveness = 0.30, energypershot = 15000, explosiongenerator = 'custom:laserhit-large-blue',
        firestarter = 90, largebeamlaser = true, laserflaresize = 12, name = 'Apocalyptic tachyon beam', noselfdamage = true,
        range = 1700, reloadtime = 8, rgbcolor = '1 0.4 1', scrollspeed = 5, soundhitwet = 'sizzle',
        soundstart = 'annigun1', soundtrigger = 1, texture3 = 'largebeam', thickness = 18, tilelength = 150,
        tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 6000,
        damage = { commanders = 480, default = 110000 },
      },
      armcomlaser = {
        areaofeffect = 16, avoidfeature = false, beamtime = 0.1, corethickness = 0.2, cylindertargeting = 1,
        edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 80, impactonly = 1,
        laserflaresize = 10, name = 'Ultra-rapid close-range laser', noselfdamage = true, range = 750, reloadtime = 0.15,
        rgbcolor = '1.0 0 1', soundhitwet = 'sizzle', soundstart = 'lasrcrw2', soundtrigger = 1, targetmoveerror = 0.05,
        thickness = 10, tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 2000,
        damage = { default = 3500, VTOL = 550 },
      },
    },
    weapons = {
      [1] = { def = 'armcomlaser', onlytargetcategory = 'NOTSUB', fastautoretargeting = true },
      [3] = { def = 'old_armsnipe_weapon', onlytargetcategory = 'NOTSUB' },
      [4] = { badtargetcategory = 'VTOL GROUNDSCOUT', def = 'ATA', onlytargetcategory = 'SURFACE' },
    },
  }
}
-- ARMADA_COMMANDER_LVL6_END
