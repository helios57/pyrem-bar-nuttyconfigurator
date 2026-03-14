-- ARMADA_COMMANDER_LVL5_START
{
  armcomlvl5 = {
    footprintx = 2,
    footprintz = 2,
    autoheal = 3500,
    builddistance = 650,
    canresurrect = true,
    energymake = 4000,
    health = 45000,
    speed = 90,
    metalmake = 120,
    workertime = 9200,
    buildoptions = {
      'armanni', 'armpb', 'armamb', 'armmoho', 'armuwmme', 'armflak', 'armmercury',
      'armgate', 'armsd', 'armfort', 'armtarg', 'armarad', 'armamd', 'armveil',
      'armuwadvms', 'armuwadves', 'armmmkr', 'armuwmmm', 'armavp', 'armaap',
      'armalab', 'armfflak', 'armatl', 'armkraken', 'armbrtha', 'armannit3',
      'armlwall', 'armgatet3', 'armannit4', 'armnanotct3', 'epic_mercury'
    },
    customparams = {
      evolution_target = 'armcomlvl6',
      evolution_condition = 'timer_global',
      evolution_timer = 3120,
    },
    weapondefs = {
      old_armsnipe_weapon = {
        areaofeffect = 80, avoidfeature = true, avoidfriendly = true, collidefeature = true, collidefriendly = false,
        corethickness = 0.85, commandfire = true, duration = 0.12, edgeeffectiveness = 1, energypershot = 3000,
        explosiongenerator = 'custom:laserhit-large-blue', firestarter = 100, impulseboost = 0.5, impulsefactor = 1.2,
        intensity = 1.6, name = 'Legendary g2g armor-piercing rifle', range = 1400, reloadtime = 0.4,
        rgbcolor = '0.7 0.1 1.0', rgbcolor2 = '0.7 0.1 1.0', soundhit = 'sniperhit', soundhitwet = 'sizzle',
        soundstart = 'sniper3', soundtrigger = true, stockpile = true, stockpiletime = 1.5,
        customparams = { stockpilelimit = 20 }, texture1 = 'shot', texture2 = 'empty', thickness = 8,
        tolerance = 1000, turret = true, weapontype = 'LaserCannon', weaponvelocity = 4500,
        damage = { commanders = 10, default = 60000 },
      },
      ata = {
        areaofeffect = 16, avoidfeature = false, beamtime = 1.5, collidefriendly = false, corethickness = 0.6,
        edgeeffectiveness = 0.30, energypershot = 10000, explosiongenerator = 'custom:laserhit-large-blue',
        firestarter = 90, largebeamlaser = true, laserflaresize = 9, name = 'Legendary tachyon beam', noselfdamage = true,
        range = 1400, reloadtime = 10, rgbcolor = '1 0.2 1', scrollspeed = 5, soundhitwet = 'sizzle',
        soundstart = 'annigun1', soundtrigger = 1, texture3 = 'largebeam', thickness = 14, tilelength = 150,
        tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 4500,
        damage = { commanders = 480, default = 75000 },
      },
      armcomlaser = {
        areaofeffect = 14, avoidfeature = false, beamtime = 0.1, corethickness = 0.15, cylindertargeting = 1,
        edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 80, impactonly = 1,
        laserflaresize = 8.5, name = 'Rapid close-range laser', noselfdamage = true, range = 650, reloadtime = 0.3,
        rgbcolor = '0.8 0 1', soundhitwet = 'sizzle', soundstart = 'lasrcrw2', soundtrigger = 1, targetmoveerror = 0.05,
        thickness = 8, tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 1500,
        damage = { default = 2500, VTOL = 350 },
      },
    },
    weapons = {
      [1] = { def = 'armcomlaser', onlytargetcategory = 'NOTSUB', fastautoretargeting = true },
      [3] = { def = 'old_armsnipe_weapon', onlytargetcategory = 'NOTSUB' },
      [4] = { badtargetcategory = 'VTOL GROUNDSCOUT', def = 'ATA', onlytargetcategory = 'SURFACE' },
    },
  }
}
-- ARMADA_COMMANDER_LVL5_END
