# NuttyB Configurator

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Lua Support](https://img.shields.io/badge/lua-5.1-blue)
![Spring Engine](https://img.shields.io/badge/engine-spring-orange)

The **NuttyB Configurator** is an integrated web application used to dynamically generate configuration files (`.lua` scripts) for Beyond All Reason (BAR) tweaks. Through a user-friendly UI component, server hosts can mix and match game-changing modes—such as Doom Mode, Epic Units, Mini-Bosses—while respecting the strict 13KB custom parameter limits per lobby slot via an intelligent First-Fit Decreasing packing algorithm.

---

## 🌟 Tweak Modules Overview

The Configurator features an extensive library of modular injects that radically transform the scale and pacing of BAR lobbys. Some of the major overhauls include:
- **Evolving Commanders (Up to Level 6)**: Commanders automatically level up globally over time, culminating in Level 6 "Apocalyptic" variants boasting up to 125,000 HP, 8000-power shields, darkmatter payload D-Guns, and Tracking Raptor swarms.
- **Epic Tier 4 Anti-Air**: Introduces Legendary-tier SAM lines (Epic Mercury, Epic Screamer, Epic Flak) tailored to shut down T4 Aircraft Swarms with devastating AoE bursts and tracking tachyon lasers.
- **Doom Mode & Mini-Bosses**: Scripts like Juggernaut-waves, Scavenger Boss spawns, or Raptorial swarms for PvE challenges.
- **Expansive Economy**: T3/T4 super-structures, cross-faction tech unlocking, and hyper-taxed mass fabricators.

---

## 🚀 Quick Start

To launch the web configurator locally, you can use the built-in scripts or run a manual local server.

### Option 1: Using the Quick Start Script (Windows)
```bash
# Double-click start-server.bat in your file explorer
# Or launch directly from your terminal:
./start-server.bat
```

### Option 2: Manual Python Server (Cross-platform)
```bash
# Navigate to the project root
cd bar-configurator

# Start the built-in Python HTTP server
python -m http.server 8080
```
Open [http://localhost:8080](http://localhost:8080) in your web browser.

---

## 🛠️ Project Structure

The project has been split into a highly modular structure to make adding new scripts and UI elements as seamless as possible:

```text
bar-configurator/
├── index.html              # Main HTML shell
├── start-server.bat        # Quick start script for local server
├── package.json            # Node.js dependencies for the Lua test suite
├── css/
│   ├── base.css            # CSS variables + global styles
│   ├── layout.css          # Shell/layout styling
│   └── styles.css          # Component styles (imports base/layout)
├── js/
│   ├── main.js             # Application entry point and orchestrator
│   └── README_MODULES.md   # Detailed breakdown of JS module logic
├── partials/
│   ├── config-tab.html     # Configuration tab content
│   ├── custom-tab.html     # Custom tweaks tab content
│   └── links-tab.html      # Links tab content
├── tweaks/                 # Raw Beyond All Reason (BAR) .lua scripts
└── tests/                  # Automated CI test suites for Lua AST validation
```

### Modifying the Configurator:
- **Styles**: Edit `css/base.css`, `css/layout.css`, and `css/styles.css`.
- **Tab Content**: Edit the `.html` files in the `partials/` folder.
- **JavaScript Core**: Application logic is spread across modules in the `js/` folder. Start reading at `js/main.js` and `js/README_MODULES.md`.
- **Game Scripts**: Any adjustments to actual game unit stats and spawns should be made in the `tweaks/` folder.

---

## 🧪 Validating Game Mod Scripts (Testing)

The `tweaks/` folder contains pure Lua scripts intended for the Spring Engine. To ensure that these scripts never break game lobbies or cause server overloads due to excessive unit-spawning, we run an automated **Node.js Test Suite** against their Abstract Syntax Trees (AST).

**To run the validation test suite:**
```bash
# Install Jest and Luaparse
npm install

# Run the syntactic and schema validations
npm test
```

This ensures full BAR Engine compatibility and performance safety. For detailed testing mechanics, see [js/README_MODULES.md](js/README_MODULES.md).

---

## 🔗 External Resources

Looking for gameplay guides, widgets, or community links?
See **[links.md](links.md)** for a curated collection of NuttyB resources.
