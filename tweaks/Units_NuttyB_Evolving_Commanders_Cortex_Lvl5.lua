-- CORTEX_COMMANDER_LVL5_START
{
  corcomlvl5 = {
    footprintx = 2,
    footprintz = 2,
    speed = 85,
    health = 75000,
    energymake = 3500,
    metalmake = 80,
    autoheal = 5000,
    workertime = 4500,
    builddistance = 650,
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
      evolution_target = 'corcomlvl6',
      evolution_condition = 'timer_global',
      evolution_timer = 3120,
      shield_power = 4000,
      shield_radius = 250,
    },
    weapondefs = {
      CORCOMLASER = {
        areaofeffect = 16, avoidfeature = false, beamtime = 0.1, corethickness = 0.15, cylindertargeting = 1,
        edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 70, impactonly = 1,
        laserflaresize = 6.5, name = 'J7Laser Mk. II', noselfdamage = true, range = 1200, reloadtime = 0.3,
        rgbcolor = '0.7 0 1', soundhitwet = 'sizzle', soundstart = 'lasrfir1', soundtrigger = 1, targetmoveerror = 0.05,
        thickness = 4, tolerance = 10000, turret = true, weapontype = 'BeamLaser', weaponvelocity = 1200,
        damage = { default = 5500, subs = 5 },
      },
      disintegratorxl = {
        areaofeffect = 150, avoidfeature = false, avoidfriendly = true, commandfire = true, edgeeffectiveness = 1,
        explosiongenerator = 'custom:burnblackbiggest', firestarter = 100, intensity = 4,
        name = 'Darkmatter Photon-Disruptor Mk. II', noexplode = true, noselfdamage = true, range = 650, reloadtime = 1,
        rgbcolor = '0.8 0.1 1.0', size = 8.5, soundhit = 'xplomas2', soundhitwet = 'sizzlexs', soundstart = 'disigun1',
        soundtrigger = true, tolerance = 10000, turret = true, weapontimer = 4.2, weapontype = 'DGun', weaponvelocity = 600,
        damage = { commanders = 0, default = 40000, scavboss = 1000, raptors = 20000 },
      },
      corcomeyelaser = {
        areaofeffect = 8, avoidfeature = false, avoidfriendly = true, beamtime = 0.033, corethickness = 0.45,
        camerashake = 0.1, edgeeffectiveness = 1, explosiongenerator = 'custom:laserhit-small-red', firestarter = 90,
        laserflaresize = 3, name = 'Heavy EyeLaser', noselfdamage = true, range = 1000, reloadtime = 0.033,
        rgbcolor = '0 1 0', rgbcolor2 = '0.8 0 0', scrollspeed = 5, soundhitdry = 'flamhit1', soundhitwet = 'sizzle',
        soundstart = 'heatray3burn', soundstartvolume = 6, soundtrigger = 1, thickness = 3.5, turret = true,
        weapontype = 'BeamLaser', weaponvelocity = 2000,
        damage = { default = 385 },
      },
    },
    weapons = {
      [1] = { def = 'CORCOMLASER', onlytargetcategory = 'NOTSUB', fastautoretargeting = true },
      [3] = { badtargetcategory = 'VTOL', def = 'disintegratorxl', onlytargetcategory = 'SURFACE' },
      [5] = { badtargetcategory = 'VTOL GROUNDSCOUT', def = 'corcomeyelaser', onlytargetcategory = 'SURFACE' },
    },
  }
}
-- CORTEX_COMMANDER_LVL5_END
