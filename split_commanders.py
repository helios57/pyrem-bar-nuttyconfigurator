import os
import re

print("Starting splitting script...")

factions = ["Armada", "Cortex", "Legion"]
markers = ["ARMADA_COMMANDER", "CORTEX_COMMANDER", "LEGION_COMMANDER"]

def ensure_braces(block):
    count = block.count('{') - block.count('}')
    while count < 0:
        if block.strip().endswith('}'):
            block = block[:block.rindex('}')]
            count += 1
        else:
            break
    while count > 0:
        block += "\n}"
        count -= 1
    return block

for faction, marker in zip(factions, markers):
    filename = f"tweaks/Units_NuttyB_Evolving_Commanders_{faction}.lua"
    if not os.path.exists(filename):
        print(f"Skipping {filename}, not found")
        continue
        
    with open(filename, "r") as f:
        content = f.read()

    # Find the chunks. A chunk starts with exactly 2 spaces `  something = {`
    pattern = r'^  ([a-zA-Z0-9_]+)\s*=\s*\{'
    matches = list(re.finditer(pattern, content, flags=re.MULTILINE))

    print(f"File {filename} matches:", [m.group(1) for m in matches])
    if not matches:
        print("No matches found!")
        continue
    
    for i, match in enumerate(matches):
        key = match.group(1)
        start_idx = match.start()
        
        # Determine the end of this chunk. It's either the start of the next match,
        # or the end of the entire table. We find the last closing brace of the file.
        # But wait, it's safer to just slice and let ensure_braces fix it.
        if i + 1 < len(matches):
            end_idx = matches[i+1].start()
            chunk_content = content[start_idx:end_idx].strip()
        else:
            chunk_content = content[start_idx:].strip()
            # Strip off outer file markers if they exist at the end
            chunk_content = re.sub(r'-- \w+_END\n*', '', chunk_content)
            chunk_content = re.sub(r'\}[\s\n]*$', '', chunk_content) # The outer table brace
            chunk_content = chunk_content.strip()

        # Determine level
        level = "Base"
        m_lvl = re.search(r'lvl(\d+)', key)
        if m_lvl:
            level = "Lvl" + m_lvl.group(1)
            
        chunk_content = ensure_braces(chunk_content)
        
        out_name = f"tweaks/Units_NuttyB_Evolving_Commanders_{faction}_{level}.lua"
        
        final_file = f"-- {marker}_{level.upper()}_START\n"
        final_file += "{\n  " + chunk_content
        
        if final_file.strip().endswith(','):
             final_file = final_file.rstrip()[:-1]
             
        final_file += "\n}\n"
        final_file += f"-- {marker}_{level.upper()}_END\n"
        
        with open(out_name, "w") as out_f:
            out_f.write(final_file)
            
        print(f"Wrote {out_name}")
        
    os.remove(filename) # Let's delete it now since it's confirmed
