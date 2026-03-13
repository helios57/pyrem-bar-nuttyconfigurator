--Epic Ragnarok, Calamity, Starfall, & Bastion
--Authors: Altwaal

-- RAGNAROK_START
do
local a,b=UnitDefs or{},table.merge
a.epic_ragnarok=b(a['armvulc'],{
  name='Epic Ragnarok',
  description='Superheavy anti-armor beam weapon',
  buildtime=920000,
  maxthisunit=80,
  health=140000,
  footprintx=6,
  footprintz=6,
  metalcost=180000,
  energycost=2600000,
  energystorage = 18000,
  icontype="armvulc",
  customparams={
    i18n_en_humanname='Epic Ragnarok',
    i18n_en_tooltip='Ultimate rapid-fire laser beam blaster',
    techlevel=4
  },
  weapondefs={
    apocalypse_plasma_cannon={
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      name='Apocalypse Plasma Cannon',
      weapontype='BeamLaser',
      rgbcolor='1.0 0.2 0.1',
      camerashake=0,
      reloadtime=1,
      accuracy=10,
      areaofeffect=160,
      range=3080,
      energypershot=42000,
      turret=true,
      soundstart='lrpcshot3',
      soundhit='rflrpcexplo',
      soundhitvolume=40,
      size=8,
      impulsefactor=1.3,
      weaponvelocity=3100,
      thickness=12,
      laserflaresize=8,
      texture3="largebeam",
      tilelength=150,
      tolerance=10000,
      beamtime=0.12,
      corethickness=0.4,
      explosiongenerator='custom:tachyonshot',
      craterboost=0.15,
      cratermult=0.15,
      edgeeffectiveness=0.25,
      impactonly=1,
      noselfdamage=true,
      soundtrigger=1,
      lightintensity=0.05,
      lightradius=60,
      damage={
        default=22000,
        shields=6000,
        subs=2657
      },
      allowNonBlockingAim=true
    }
  },
  weapons={
    [1]={
      def='apocalypse_plasma_cannon'
    }
  }
})
local builders_arm = { 'armaca', 'armack', 'armacsub', 'armacv', 'armt3airaide', 'armt3aide' }

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

local function removeBuildOption(list, name)
	for i=1, #list do
		local u = a[list[i]]
		if u and u.buildoptions then
			for j=#u.buildoptions, 1, -1 do
				if u.buildoptions[j] == name then table.remove(u.buildoptions, j) end
			end
		end
	end
end

removeBuildOption(builders_arm, 'armvulc')
ensureBuildOptions(builders_arm, 'epic_ragnarok')
end
-- RAGNAROK_END

-- CALAMITY_START
do
local a,b=UnitDefs or{},table.merge
a.epic_calamity=b(a['corbuzz'],{
  name='Epic Calamity',
  description='Massive plasma siege cannon',
  maxthisunit=80,
  footprintx=6,
  footprintz=6,
  buildtime=920000,
  health=145000,
  metalcost=165000,
  energycost=2700000,
  energystorage = 18000,
  icontype="corbuzz",
  customparams={
    i18n_en_humanname='Epic Calamity',
    i18n_en_tooltip='Superheavy rapid-fire plasma onslaught',
    techlevel=4
  },
  weapondefs={
    cataclysm_plasma_howitzer={
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      impactonly=1,
      name='Cataclysm Plasma Howitzer',
      weapontype='Cannon',
      rgbcolor='0.15 0.6 0.5',
      camerashake=0,
      reloadtime=0.5,
      accuracy=10,
      areaofeffect=220,
      range=3150,
      energypershot=22000,
      turret=true,
      soundstart='lrpcshot3',
      soundhit='rflrpcexplo',
      soundhitvolume=50,
      size=12,
      impulsefactor=2.0,
      weaponvelocity=2500,
      turnrate=20000,
      thickness=18,
      laserflaresize=8,
      texture3="largebeam",
      tilelength=200,
      tolerance=10000,
      explosiongenerator='custom:tachyonshot',
      craterboost=0.15,
      cratermult=0.15,
      edgeeffectiveness=0.35,
      lightintensity=0.05,
      lightradius=60,
      damage={
        default=9000,
        shields=5490,
        subs=2350
      },
      allowNonBlockingAim=true
    }
  },
  weapons={
    [1]={
      def='cataclysm_plasma_howitzer'
    }
  }
})
local builders_cor={'coraca','corack','coracsub','coracv','cort3airaide','cort3aide'}

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

local function removeBuildOption(list, name)
	for i=1, #list do
		local u = a[list[i]]
		if u and u.buildoptions then
			for j=#u.buildoptions, 1, -1 do
				if u.buildoptions[j] == name then table.remove(u.buildoptions, j) end
			end
		end
	end
end

removeBuildOption(builders_cor, 'corbuzz')
ensureBuildOptions(builders_cor, 'epic_calamity')
end
-- CALAMITY_END

-- STARFALL_START
do
local a,b=UnitDefs or{},table.merge
a.epic_starfall=b(a['legstarfall'],{
  name='Epic Starfall',
  description='Rapid-fire ion plasma cannon',
  buildtime=920000,
  health=145000,
  metalcost=180000,
  energycost=3400000,
  maxthisunit = 80,
  collisionvolumescales='61 128 61',
  footprintx=6,
  footprintz=6,
  customparams={
    i18n_en_humanname='Epic Starfall',
    i18n_en_tooltip='Devastating rapid-fire ion plasma weaponry',
    techlevel=4,
    modelradius=150
  },
  weapondefs={
    starfire={
      accuracy=10,
      areaofeffect=256,
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      avoidground=false,
      burst=20,
      burstrate=0.10,
      sprayangle=20,
      highTrajectory=1,
      cegtaj="starfire",
      craterboost=0.1,
      cratermult=0.1,
      edgeeffectiveness=0.95,
      energypershot=36000,
      fireTolerance=364,
      tolerance=364,
      explosiongenerator="custom:starfire-explosion",
      gravityaffected="true",
      impulsefactor=0.5,
      name="Very Long-Range High-Trajectory 21-Salvo Plasma Launcher",
      noselfdamage=true,
      range=3150,
      reloadtime=8,
      rgbcolor="0.7 0.7 1.0",
      soundhit="rflrpcexplo",
      soundhitwet="splshbig",
      soundstart="lrpcshot",
      soundhitvolume=36,
      turret=true,
      weapontimer=14,
      weapontype="Cannon",
      weaponvelocity=650,
      windup = 5,
      damage={
        default=6600,
        shields=2220,
        subs=660
      },
    }
  },
  weapons={
    [1]={
      def='starfire',
      onlytargetcategory='SURFACE',
      badtargetcategory='VTOL'
    }
  }
})
local builders_leg_starfall={'legaca','legack','legacsub','legacv','legt3airaide','legt3aide'}

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

local function removeBuildOption(list, name)
	for i=1, #list do
		local u = a[list[i]]
		if u and u.buildoptions then
			for j=#u.buildoptions, 1, -1 do
				if u.buildoptions[j] == name then table.remove(u.buildoptions, j) end
			end
		end
	end
end

removeBuildOption(builders_leg_starfall, 'legstarfall')
ensureBuildOptions(builders_leg_starfall, 'epic_starfall')
end
-- STARFALL_END

-- BASTION_START
do
local a,b=UnitDefs or{},table.merge
a.epic_bastion=b(a['legbastion'],{
  name='Epic Bastion',
  description='Superheavy sweeping heat ray',
  buildtime=150000,
  footprintx=6,
  footprintz=6,
  health=70000,
  metalcost=26000,
  energycost=860000,
  energystorage = 6000,
  sightdistance=1200,
  radardistance=1740,
  paralyzemultiplier=0.4,
  customparams={
    i18n_en_humanname='Epic Bastion',
    i18n_en_tooltip='Sweeping heat ray; place on approach lanes to clear waves',
    techlevel=3
  },
  weapondefs={
    dmaw={
      weapontype="BeamLaser",
      damage={
        default=750,
        vtol=75
      },
      range=1450,
      rgbcolor="0.65 0.2 0.05",
      rgbcolor2="0.6 0.4 0.2",
      lightcolor='0.55 0.25 0.08',
      lightintensity=0.01,
      lightradius=16,
      explosiongenerator="custom:heatray-huge",
      energypershot=12000,
      reloadtime=4,
      beamtime=0.1,
      turret=true,
      weaponvelocity=1500,
      thickness=5.5,
      areaofeffect=120,
      edgeeffectiveness=0.45,
      name="Epic Bastion Ray",
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      impactonly=1,
      laserflaresize=9,
      corethickness=0.4,
      soundstart="heatray3",
      soundstartvolume=38,
      soundhitdry="",
      soundhitwet="sizzle",
      soundtrigger=1,
      firetolerance=300,
      noselfdamage=true,
      predictboost=0.3,
      proximitypriority=1,
      impulsefactor=0,
      camerashake=0,
      craterareaofeffect=0,
      craterboost=0.1,
      cratermult=0.1,
      customparams={
        sweepfire=4,--multiplier for displayed dps during the 'bonus' sweepfire stage
      },
      tracks=false,
    }
  },
  weapons={
    [1]={
      def='dmaw',
      fastautoretargeting=true
    }
  }
})
local builders_leg_bastion={'legaca','legack','legacsub','legacv','legt3airaide','legt3aide'}

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

for i=3,10 do
	builders_leg_bastion[#builders_leg_bastion+1]='legcomlvl'..i
end
ensureBuildOptions(builders_leg_bastion, 'epic_bastion')
end
-- BASTION_END

-- EPIC_ELYSIUM_START
do
local d,m=UnitDefs or{},table.merge
local e=d.leggatet3
if e then
	local function c(t)
		local n={}
		for k,v in pairs(t) do
			n[k]=type(v)=='table' and c(v) or v
		end
		return n
	end
	local function x(v,n)
		if v then
			return math.ceil(v*n)
		end
	end
	local u=c(e)
	u.name='Epic Elysium'
	u.description='Ultimate shield hub. Projects an impenetrable energy barrier.'
	u.buildtime=x(e.buildtime,1.7)
	u.health=x(e.health,2.5)
	u.metalcost=x(e.metalcost,1.7)
	u.energycost=x(e.energycost,1.7)
	u.energystorage=x(e.energystorage,1.25)
	u.footprintx=6
	u.footprintz=6
	u.icontype='leggatet3'

	local r=(e.weapondefs or{}).repulsor or{}
	local rep=c(r)
	rep.name='Epic Shield'
	rep.weapontype='Shield'

	local sh=c(r.shield or{})
	sh.power=x(sh.power,2.5)
	sh.powerregen=x(sh.powerregen,4.5)
	sh.powerregenenergy=x(sh.powerregenenergy,1.9)
	sh.radius=x(sh.radius,1.3)
	sh.startingpower=x(sh.startingpower,1.7)
	rep.shield=sh
	rep.range=x(rep.range,1.3)

	u.weapondefs={epic_shield=rep}
	u.weapons={{def='epic_shield'}}

	u.customparams=m(c(e.customparams or{}),{
		i18n_en_humanname='Epic Elysium',
		i18n_en_tooltip='Massive shield generator',
		techlevel=4,
		shield_power=sh.power,
		shield_radius=sh.radius
	})

	d.epic_elysium=u
end

local builders_leg_elysium={'legaca','legack','legacsub','legacv','legt3aide','legt3airaide'}

local function ensureBuildOptions(list, name)
	if not d[name] then return end
	for i=1, #list do
		local u = d[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

for i=3,10 do
	table.insert(builders_leg_elysium,'legcomlvl'..i)
end
ensureBuildOptions(builders_leg_elysium, 'epic_elysium')
end
-- EPIC_ELYSIUM_END

-- FORTRESS_START

do
local a,b=UnitDefs or{},table.merge
a.epic_fortress=b(a['legapopupdef'],{
  name='Epic Fortress',
  description='Superheavy EMP-resistant swarm destroyer',
  buildtime=300000,
  health=60000,
  metalcost=25200,
  energycost=315000,
  sightdistance=1500,
  customparams={
    i18n_en_humanname='Epic Fortress',
    i18n_en_tooltip='Deploys continuous plasma barrages resistant to EMP',
    techlevel=3,
    paralyzemultiplier=0.0
  },
  weapondefs={
    epic_riot_devastator={
      name='Epic Riot Devastator',
      weapontype='Cannon',
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      damage={
        default=4900
      },
      accuracy=10,
      areaofeffect=164,
      areaofeffect=220,
      edgeeffectiveness=0.50,
      range=1300,
      reloadtime=1.6,
      energypershot=2400,
      turret=true,
      weaponvelocity=900,
      camerashake=0,
      explosiongenerator='custom:genericshellexplosion-medium',
      rgbcolor='1.0 0.3 0.5',
      size=10,
      soundhitvolume=22,
      soundstartvolume=18.0,
      impulsefactor=3.2,
      craterboost=0.25,
      cratermult=0.25,
      noselfdamage=true,
      impactonly=true,
      burnblow=true,
      proximitypriority=5
    },
    epic_minigun={
      accuracy=2,
      areaofeffect=32,
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      burst = 6,
			burstrate = 0.066,
      burnblow=false,
      craterareaofeffect=0,
      craterboost=0,
      cratermult=0,
      duration=0.05,
      edgeeffectiveness=0.85,
      explosiongenerator="custom:plasmahit-sparkonly",
      falloffrate=0.15,
      firestarter=5,
      impulsefactor=2.0,
      intensity=1.2,
      name="Epic Rotary Cannons",
      noselfdamage=true,
      impactonly=true,
      ownerExpAccWeight=4.0,
      proximitypriority=6,
      range=1000,
      reloadtime=0.4,
      rgbcolor="1 0.4 0.6",
      soundhit="bimpact3",
      soundhitwet="splshbig",
      soundstart="mgun6heavy",
      soundstartvolume=6.5,
      soundtrigger=true,
      sprayangle=450,
      texture1="shot",
      texture2="empty",
      thickness=4.5,
      tolerance=3000,
      turret=true,
      weapontype="LaserCannon",
      weaponvelocity=1300,
      damage={
        default=60,
        vtol=60,
      }
    }
  },
  weapons={
    [1]={
      def='epic_riot_devastator',
      onlytargetcategory='SURFACE'
    },
    [2]={
      def='epic_minigun',
      onlytargetcategory='SURFACE'
    },
    [3]={
      def='epic_minigun',
      onlytargetcategory='SURFACE'
    }
  }
})
local builders_leg={'legaca','legack','legacsub','legacv','legt3airaide','legt3aide'}

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

for i=3,10 do
	builders_leg[#builders_leg+1]='legcomlvl'..i
end
ensureBuildOptions(builders_leg, 'epic_fortress')
end
-- FORTRESS_END

-- EPIC_AA_START
do
local a,b=UnitDefs or{},table.merge

-- Armada Epic Mercury
a.epic_mercury=b(a['armmercury'],{
  name='Epic Mercury',
  description='Legendary long-range rapid guided missiles',
  buildtime=280000,
  maxthisunit=20,
  health=130000,
  footprintx=6,
  footprintz=6,
  metalcost=160000,
  energycost=3300000,
  icontype="armmercury",
  customparams={
    i18n_en_humanname='Epic Mercury',
    i18n_en_tooltip='Ultimate long-range ultra-fast guided missile platform',
    techlevel=4
  },
  weapondefs={
    epic_advsam={
      areaofeffect=1200,
      energypershot=20000,
      explosiongenerator='custom:flak',
      flighttime=3,
      metalpershot=120,
      name='Legendary rapid-fire g2a guided missile launcher',
      range=6000,
      reloadtime=0.4,
      smoketrail=false,
      startvelocity=4000,
      weaponacceleration=2000,
      weaponvelocity=9000,
	  damage={
        default=5500,
        vtol=6500,
      }
    }
  },
  weapons={
    [1]={
      def='epic_advsam'
    }
  }
})

-- Cortex Epic Screamer
a.epic_screamer=b(a['corscreamer'],{
  name='Epic Screamer',
  description='Legendary heavy guided flak missile platform',
  buildtime=280000,
  maxthisunit=20,
  health=130000,
  footprintx=6,
  footprintz=6,
  metalcost=165000,
  energycost=3200000,
  icontype="corscreamer",
  customparams={
    i18n_en_humanname='Epic Screamer',
    i18n_en_tooltip='Ultimate heavy flak missile area-denial platform',
    techlevel=4
  },
  weapondefs={
    epic_cor_advsam={
      areaofeffect=2500,
      energypershot=20000,
      explosiongenerator='custom:flak',
      flighttime=2,
      metalpershot=200,
      name='Legendary long-range g2a guided heavy flak missile launcher',
      range=6500,
      reloadtime=0.9,
      smoketrail=false,
      startvelocity=7000,
      weaponacceleration=3000,
      weaponvelocity=12000,
	  damage={
        default=8500,
        vtol=9500,
      }
    }
  },
  weapons={
    [1]={
      def='epic_cor_advsam'
    }
  }
})

-- Legion Epic Flak
a.epic_flak=b(a['legflak'],{
  name='Epic Flak Cannon',
  description='Legendary super-heavy repeating flak cannons',
  buildtime=190000,
  maxthisunit=40,
  health=140000,
  footprintx=5,
  footprintz=5,
  metalcost=82000,
  energycost=1300000,
  icontype="legflak",
  customparams={
    i18n_en_humanname='Epic Flak Cannon',
    i18n_en_tooltip='Ultimate devastating multi-burst area-of-effect suppression',
    techlevel=4
  },
  weapondefs={
    epic_legflak_gun={
      collidefriendly=0,
      collidefeature=0,
      avoidfeature=0,
      avoidfriendly=0,
      areaofeffect=1800,
      burst=12,
	  burstrate=0.1,
      range=4500,
	  reloadtime=2.0,
      intensity=0.6,
      weaponvelocity=4500,
	  damage={
        default=2500,
        vtol=3500,
      }
    }
  },
  weapons={
    [1]={
      def='epic_legflak_gun'
    }
  }
})

local builders_arm={'armaca','armack','armacsub','armacv','armt3airaide','armt3aide'}
local builders_cor={'coraca','corack','coracsub','coracv','cort3airaide','cort3aide'}
local builders_leg={'legaca','legack','legacsub','legacv','legt3airaide','legt3aide'}

local function ensureBuildOptions(list, name)
	if not a[name] then return end
	for i=1, #list do
		local u = a[list[i]]
		if u then
			u.buildoptions = u.buildoptions or {}
			local found = false
			for j=1, #u.buildoptions do
				if u.buildoptions[j] == name then found = true; break end
			end
			if not found then table.insert(u.buildoptions, name) end
		end
	end
end

for i=3,10 do
	builders_arm[#builders_arm+1]='armcomlvl'..i
	builders_cor[#builders_cor+1]='corcomlvl'..i
	builders_leg[#builders_leg+1]='legcomlvl'..i
end

ensureBuildOptions(builders_arm, 'epic_mercury')
ensureBuildOptions(builders_cor, 'epic_screamer')
ensureBuildOptions(builders_leg, 'epic_flak')
end
-- EPIC_AA_END
