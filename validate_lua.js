const fs = require('fs');
const luaparse = require('luaparse');

const path = require('path');

const tweaksDir = path.join(__dirname, 'tweaks');
let filesToRun = [];

if (process.argv.length > 2) {
    filesToRun = process.argv.slice(2);
} else {
    const files = fs.readdirSync(tweaksDir);
    filesToRun = files.filter(f => f.endsWith('.lua')).map(f => path.join(tweaksDir, f));
}

for (const file of filesToRun) {
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
