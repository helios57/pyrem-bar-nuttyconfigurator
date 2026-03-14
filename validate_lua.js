const fs = require('fs');
const luaparse = require('luaparse');

const files = [
  'tweaks/Units_NuttyB_Evolving_Commanders_Armada.lua',
  'tweaks/Units_NuttyB_Evolving_Commanders_Cortex.lua',
  'tweaks/Units_NuttyB_Evolving_Commanders_Legion.lua'
];

for (const file of files) {
  const content = fs.readFileSync(file, 'utf8');
  // strip out configurator header lines so lua parse doesn't fail if there's a weird comment or missing return 
  // Wait, luaparse requires valid Lua. The files just contain { table } which is not valid lua.
  // We need to wrap it with "return " to make it valid lua expression that returns a table.
  const luaCode = 'return \n' + content;
  try {
    luaparse.parse(luaCode);
    console.log(`${file}: OK`);
  } catch (err) {
    console.error(`${file}: ERROR ${err.message}`);
  }
}
