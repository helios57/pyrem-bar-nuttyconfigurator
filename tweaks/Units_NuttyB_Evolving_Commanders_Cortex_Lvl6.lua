-- CORTEX_COMMANDER_LVL6_START
{
  corcomlvl6 = {
    footprintx = 2,
    footprintz = 2,
    speed = 90,
    health = 95000,
    energymake = 5000,
    metalmake = 110,
    autoheal = 8000,
    workertime = 7000,
    builddistance = 850,
    buildoptions = {
      'corfus', 'corafus', 'corageo', 'corbhmth', 'cormoho', 'cormexp', 'cormmkr',
      'coruwadves', 'coruwadvms', 'corarad', 'corshroud', 'corfort', 'corlab',
      'cortarg', 'corsd', 'corgate', 'cortoast', 'corvipe', 'cordoom', 'corflak',
      'corscreamer', 'corvp', 'corfmd', 'corap', 'corint', 'corplat', 'corsy',
      'coruwmme', 'coruwmmm', 'corenaa', 'corfdoom', 'coratl', 'coruwfus',
      'corjugg', 'corshiva', 'corsumo', 'corgol', 'corkorg', 'cornanotc2plat',
      'cornanotct2', 'cornecro', 'cordoomt3', 'corhllllt', 'cormaw', 'cormwall',
      'corgatet3', 'legendary_bulwark', 'cornanotct3', 'epic_screamer'
    },
    customparams = {
      shield_power = 8000,
      shield_radius = 400,
    },
    weapondefs = {
      CORCOMLASER = {
        areaofeffect = 20, avoidfeature = false, beamtime = 0.1, corethickness = 0.2, cylindertargeting = 1,
        edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 70, impactonly = 1,
        laserflaresize = 8, name = 'J7Laser Mk. III', noselfdamage = true, range = 1400, reloadtime = 0.2,
        rgbcolor = '0.9 0 1', soundhitwet = 'sizzle', soundstart = 'lasrfir1', soundtrigger = 1, targetmoveerror = 0.05,
        thickness = 5, tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 1500,
        damage = { default = 8500, subs = 5 },
      },
      disintegratorxl = {
        areaofeffect = 205, avoidfeature = false, avoidfriendly = true, commandfire = true, edgeeffectiveness = 1,
        explosiongenerator = 'custom:burnblackbiggest', firestarter = 100, intensity = 6,
        name = 'Apocalyptic Photon-Disruptor', noexplode = true, noselfdamage = true, range = 850, reloadtime = 0.75,
        rgbcolor = '1.0 0.1 1.0', size = 12, soundhit = 'xplomas2', soundhitwet = 'sizzlexs', soundstart = 'disigun1',
        soundtrigger = true, tolerance = 10000, turret = true, weapontimer = 4.2, weapontype = 'DGun', weaponvelocity = 800,
        damage = { commanders = 0, default = 80000, scavboss = 1000, raptors = 40000 },
      },
      corcomeyelaser = {
        areaofeffect = 12, avoidfeature = false, avoidfriendly = true, beamtime = 0.033, corethickness = 0.55,
        camerashake = 0.1, edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 90,
        laserflaresize = 4, name = 'Apocalyptic EyeLaser', noselfdamage = true, range = 1200, reloadtime = 0.033,
        rgbcolor = '0 1 0.5', rgbcolor2 = '1.0 0 0', scrollspeed = 5, soundhitdry = 'flamhit1', soundhitwet = 'sizzle',
        soundstart = 'heatray3burn', soundstartvolume = 6, soundtrigger = 1, thickness = 4.5, turret = true,
        weapontype = 'BeamLaser', weaponvelocity = 2500,
        damage = { default = 750 },
      },
    },
    weapons = {
      [1] = { def = 'CORCOMLASER', onlytargetcategory = 'NOTSUB', fastautoretargeting = true },
      [3] = { badtargetcategory = 'VTOL', def = 'disintegratorxl', onlytargetcategory = 'SURFACE' },
      [5] = { badtargetcategory = 'VTOL GROUNDSCOUT', def = 'corcomeyelaser', onlytargetcategory = 'SURFACE' },
    },
  }
}
-- CORTEX_COMMANDER_LVL6_END
