#!/usr/bin/env zsh

# The destination for your AI configs
AI_CONFIG="$HOME/.config/ai"
mkdir -p "$AI_CONFIG/claude" "$AI_CONFIG/codex" "$AI_CONFIG/openclaw" "$AI_CONFIG/misc"

echo "🧹 Sweeping the crawling chaos into $AI_CONFIG..."

# --- 1. Move and Symlink Directories ---
for dir in .claude .codex .openclaw .zeroclaw .ai; do
    # Only touch it if it's a real directory (not already symlinked)
    if [[ -d "$HOME/$dir" && ! -L "$HOME/$dir" ]]; then
        
        # Determine target folder name (remove leading dot)
        target="${dir#\.}" 
        [[ "$dir" == ".ai" ]] && target="misc" 
        
        # Ensure target exists, move contents, and replace with a symlink
        mkdir -p "$AI_CONFIG/$target"
        mv "$HOME/$dir"/* "$AI_CONFIG/$target/" 2>/dev/null || true
        rm -rf "$HOME/$dir"
        ln -s "$AI_CONFIG/$target" "$HOME/$dir"
        
        echo "✅ Symlinked $dir -> $AI_CONFIG/$target"
    fi
done

# --- 2. Move and Symlink Floating Files ---
for file in .claude.json .bots; do
    if [[ -f "$HOME/$file" && ! -L "$HOME/$file" ]]; then
        
        # Route Claude files to the claude folder, everything else to misc
        target_dir="$AI_CONFIG/misc"
        [[ "$file" == *claude* ]] && target_dir="$AI_CONFIG/claude"
        
        mv "$HOME/$file" "$target_dir/$file"
        ln -s "$target_dir/$file" "$HOME/$file"
        
        echo "✅ Symlinked $file -> $target_dir/$file"
    fi
done

echo "🎉 Home directory cleaned. The tools are none the wiser."
