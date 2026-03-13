const fs = require('fs');
const path = require('path');
const luaparse = require('luaparse');

const TWEAKS_DIR = path.join(__dirname, '../tweaks');

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

describe('Lua Tweaks Validation', () => {
    const files = fs.readdirSync(TWEAKS_DIR).filter(f => f.endsWith('.lua'));

    test.each(files)('File %s should have valid syntax and respect limits', (file) => {
        const filePath = path.join(TWEAKS_DIR, file);
        const code = fs.readFileSync(filePath, 'utf8');
        
        // 1. Syntax Check
        let ast;
        try {
            let parseCode = code.replace(/^--.*$/gm, '').trim();
            if (parseCode.startsWith('{')) {
                parseCode = 'return ' + parseCode;
            }
            ast = luaparse.parse(parseCode, { comments: false, scope: true });
        } catch (e) {
            throw new Error(`Syntax Error in ${file} at line ${e.line}, col ${e.column}: ${e.message}`);
        }

        // 2. Semantic Checks (Limits)
        const MAX_SPAWNS_COUNT = 8;
        const MAX_SQUAD_AMOUNT = 8;
        const MAX_BURST = 30; // Cap large bursts like DMAW
        
        traverse(ast, (node) => {
            if (node.type === 'TableKeyString' && node.key && node.key.type === 'Identifier') {
                const keyName = node.key.name;
                if (keyName === 'spawns_count' && node.value.type === 'NumericLiteral') {
                    if (node.value.value > MAX_SPAWNS_COUNT) {
                        throw new Error(`spawns_count exceeded in ${file}: ${node.value.value} > ${MAX_SPAWNS_COUNT}`);
                    }
                }
                if (keyName === 'raptorsquadunitsamount' && node.value.type === 'NumericLiteral') {
                    if (node.value.value > MAX_SQUAD_AMOUNT) {
                        throw new Error(`raptorsquadunitsamount exceeded in ${file}: ${node.value.value} > ${MAX_SQUAD_AMOUNT}`);
                    }
                }
                if (keyName === 'burst' && node.value.type === 'NumericLiteral') {
                    if (node.value.value > MAX_BURST) {
                        throw new Error(`burst exceeded in ${file}: ${node.value.value} > ${MAX_BURST}`);
                    }
                }
            }
        });
        
        // Regex fallback for dynamically constructed squad parameters
        const lines = code.split('\n');
        lines.forEach((line, index) => {
            const squadMatch = line.match(/squad\([^,]+,\s*[^,]+,\s*'[^']+',\s*(\d+)/);
            if (squadMatch) {
                const count = parseInt(squadMatch[1], 10);
                if (count > MAX_SQUAD_AMOUNT) {
                    throw new Error(`Squad amount exceeded in ${file} at line ${index + 1}: ${count} > ${MAX_SQUAD_AMOUNT}`);
                }
            }
        });
    });
});
