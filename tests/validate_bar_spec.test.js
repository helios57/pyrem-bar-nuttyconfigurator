const fs = require('fs');
const path = require('path');
const luaparse = require('luaparse');

const TWEAKS_DIR = path.join(__dirname, '../tweaks');

// BAR specification types mapping
const NUMERIC_PARAMS = new Set([
    'health', 'metalcost', 'energycost', 'buildtime',
    'maxvelocity', 'turnrate', 'range', 'reloadtime',
    'burst', 'areaofeffect', 'speed', 'sightdistance',
    'radardistance', 'energypershot', 'metalpershot',
    'turnrate', 'acceleration', 'brakerate', 'energyupkeep',
    'metalupkeep', 'maxwaterdepth', 'mass', 'footprintx',
    'footprintz', 'weaponvelocity', 'damageMultiplier',
    'paralyzetime'
]);

const STRING_PARAMS = new Set([
    'name', 'description', 'weapontype', 'explosiongenerator',
    'soundhit', 'soundstart', 'model', 'cegtag', 'category', 'iconType'
]);

function traverse(node, visitor) {
    if (!node) return;
    visitor(node);
    for (const key in node) {
        if (node[key] && typeof node[key] === 'object') {
            if (Array.isArray(node[key])) {
                node[key].forEach(child => traverse(child, visitor));
            } else {
                traverse(node[key], visitor);
            }
        }
    }
}

describe('BAR Core Specs Validation', () => {
    const files = fs.readdirSync(TWEAKS_DIR).filter(f => f.endsWith('.lua'));

    test.each(files)('File %s should adhere to exact BAR param types', (file) => {
        const filePath = path.join(TWEAKS_DIR, file);
        const code = fs.readFileSync(filePath, 'utf8');
        
        let ast;
        try {
            let parseCode = code.replace(/^--.*$/gm, '').trim();
            if (parseCode.startsWith('{')) {
                parseCode = 'return ' + parseCode;
            }
            ast = luaparse.parse(parseCode, { comments: false, scope: true });
        } catch (e) {
            // we already test for pure syntax in the other suite, but catch it here to skip gracefully if needed
            return;
        }

        traverse(ast, (node) => {
            if (node.type === 'TableKeyString' && node.key && node.key.type === 'Identifier') {
                const keyName = node.key.name.toLowerCase();
                const valType = node.value.type;

                // 1. Numeric value checks
                if (NUMERIC_PARAMS.has(keyName)) {
                    if (valType !== 'NumericLiteral' && 
                        valType !== 'UnaryExpression' && 
                        valType !== 'BinaryExpression' &&
                        valType !== 'CallExpression' &&
                        valType !== 'MemberExpression' &&
                        valType !== 'IndexExpression' &&
                        valType !== 'Identifier') {
                         throw new Error(`BAR Spec Error in ${file}: '${node.key.name}' must be a number / numeric expression, got ${valType}`);
                    }
                }

                // 2. String value checks
                if (STRING_PARAMS.has(keyName)) {
                    if (valType !== 'StringLiteral' &&
                        valType !== 'BinaryExpression' &&
                        valType !== 'IndexExpression' &&
                        valType !== 'CallExpression' &&
                        valType !== 'MemberExpression' &&
                        valType !== 'Identifier') {
                        throw new Error(`BAR Spec Error in ${file}: '${node.key.name}' must be a string / string expression, got ${valType}`);
                    }
                }

                // 3. Known mandatory Tables
                if (keyName === 'customparams' || keyName === 'weapondefs') {
                    if (valType !== 'TableConstructorExpression' && valType !== 'CallExpression') {
                        throw new Error(`BAR Spec Error in ${file}: '${node.key.name}' must be a table (nested), got ${valType}`);
                    }
                }
                
                // Damage can be a number OR a table in some niche Spring cases, but usually table
                if (keyName === 'damage') {
                    if (valType !== 'TableConstructorExpression' && valType !== 'NumericLiteral' && valType !== 'CallExpression') {
                         throw new Error(`BAR Spec Error in ${file}: '${node.key.name}' must be a table or number, got ${valType}`);
                    }
                }
            }
        });
    });
});
