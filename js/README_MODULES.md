# BAR Configurator - Modular JavaScript

## Overview
The application logic is split into specialized modules for maintainability and separation of concerns. `main.js` orchestrates the initialization and data flow.

## File Structure

```
js/
├── main.js               - Application entry point and orchestrator
├── config-loader.js      - Loads JSON configurations (dynamic tweaks, modes, etc.)
├── multiplier-handler.js - Generates HP and resource multiplier commands
├── ui-generator.js       - Creates dynamic form elements from JSON config
├── ui-renderer.js        - Renders the main options UI
├── command-builder.js    - Assembles final lobby commands
├── slot-scanner.js       - Scans available tweak files
├── slot-packer.js        - Implements First-Fit Decreasing algorithm for slots
├── event-handlers.js     - Manages DOM event listeners
├── output-manager.js     - Handles text output and copy-to-clipboard
├── utils.js              - Shared utility functions
├── custom-tweaks.js      - Manages user-defined custom tweaks
├── metadata.js           - Loads metadata for tweaks
└── helpers/
    ├── defaults.js       - Default value management
    ├── priority-utils.js - Shared priority rules
    └── slot-utils.js     - Shared slot label mapping
```

## HTML Integration

Modules are loaded in `index.html` via standard `<script>` tags. Order matters for dependencies (helpers first, then core modules, then `main.js`).

## Key Responsibilities

### Initialization
1. `main.js` loads configuration via `config-loader.js`.
2. `ui-generator.js` builds the form.
3. `event-handlers.js` attaches listeners.

### Command Generation
1. `multiplier-handler.js` generates multiplier commands.
2. `command-builder.js` combines multipliers, static tweaks, and dynamic slots.
3. `slot-packer.js` allocates tweaks into 13KB slots efficiently.

### Custom Tweaks
`custom-tweaks.js` handles user input, base64 encoding/decoding, and local storage persistence.

## Testing the Configurator

- Run `start-server.bat` (Windows) or `python -m http.server` to start the local dev server.
- Use the **Rebuild** button in the UI to force a refresh of the output script generation.
- Check browser console for UI and JS module loading errors.

## Testing the Game Tweaks (Lua Specs)

We enforce strict validation of all `.lua` configs through an automated Node.js test suite before they ever hit the game lobby.

**Prerequisites:** Node.js installed locally.

```bash
# Install Jest, Luaparse, and dependencies
npm install

# Run the test suite against the tweaks/ folder
npm test
```

### What does `npm test` check?
1. **`validate_lua.test.js`**: Syntax and Semantics Check. Ensures valid Lua and bounds-checks heavy units (e.g., no Raptor squads greater than 8 units).
2. **`validate_bar_spec.test.js`**: Spring Engine Typing Schema. Uses AST parsing to ensure strings are `StringLiteral` nodes and stats are pure numeric fields, passing smoothly into the game's parser.
