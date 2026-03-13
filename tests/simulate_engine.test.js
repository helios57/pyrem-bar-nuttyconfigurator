const fs = require('fs');
const path = require('path');
const { LuaFactory } = require('wasmoon');

const TWEAKS_DIR = path.join(__dirname, '../tweaks');

const springEngineMocks = `
-- Mocks for Spring Engine standard library additions
table.merge = function(t1, t2)
    if not t1 then t1 = {} end
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        if type(v) == "table" and type(t1[k]) == "table" then
            table.merge(t1[k], v)
        else
            t1[k] = v
        end
    end
    return t1
end

table.mergeInPlace = table.merge

table.copy = function(t)
    if type(t) ~= "table" then return t end
    local u = {}
    for k, v in pairs(t) do 
        u[k] = table.copy(v) 
    end
    return u
end

table.contains = function(t, v) 
    if not t then return false end
    for _, val in pairs(t) do
        if val == v then return true end
    end
    return false
end

Json = {
    decode = function(str) return {
        units = { names = {}, descriptions = {} }
    } end
}

VFS = {
    LoadFile = function(str) return "{}" end
}

Spring = {
    GetModOptions = function() return {
        raptor_spawncountmult = 3,
        raptor_queentimemult = 1.3,
        raptor_queen_count = 1
    } end,
    Utilities = {
        Gametype = {
            IsRaptors = function() return true end
        }
    },
    GetTeamList = function() 
        -- Mocking a game with 12 players and 2 raptor AI
        local t = {}
        for i=1,14 do table.insert(t, i) end
        return t
    end
}

UnitDefs = setmetatable({}, {
    __index = function(t, k)
        local fallback = {
            health = 1000,
            metalcost = 100,
            energycost = 100,
            buildtime = 100,
            speed = 50,
            name = k,
            weapons = {},
            weapondefs = {},
            customparams = {},
            buildoptions = {}
        }
        t[k] = fallback
        return fallback
    end
})

WeaponDefs = setmetatable({}, {
    __index = function(t, k)
        local fallback = {
            damage = {default = 10},
            name = k,
            customparams = {}
        }
        t[k] = fallback
        return fallback
    end
})

FeatureDefs = setmetatable({}, {
    __index = function(t, k)
        local fallback = {
            metal = 100,
            energy = 0
        }
        t[k] = fallback
        return fallback
    end
})
`;

describe('Spring Engine Lua Execution Simulation', () => {
    let lua;

    beforeAll(async () => {
        // Initialize the WebAssembly Lua 5.3 engine
        const factory = new LuaFactory();
        lua = await factory.createEngine();
        
        // Inject Spring globals
        await lua.doString(springEngineMocks);
    });

    afterAll(() => {
        if (lua) {
            lua.global.close();
        }
    });

    const files = fs.readdirSync(TWEAKS_DIR).filter(f => f.endsWith('.lua'));

    test.each(files)('File %s should compile and run without throwing global reference errors', async (file) => {
        const filePath = path.join(TWEAKS_DIR, file);
        const code = fs.readFileSync(filePath, 'utf8');
        
        let executeCode = code.replace(/^--.*$/gm, '').trim();
        if (executeCode.startsWith('{')) {
            executeCode = 'return ' + executeCode;
        }

        try {
            // Attempt to purely compile and execute the tweak exactly as Spring would
            await lua.doString(executeCode);
        } catch (e) {
            throw new Error("Runtime execution failed in " + file + ": " + e.message);
        }
    });
});
