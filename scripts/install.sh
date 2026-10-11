#!/usr/bin/env bash
# Symlink this repo's configs into place on a new machine.
#
# Usage:
#   ./scripts/install.sh            symlink everything, back up conflicts
#   ./scripts/install.sh --dry-run  show what would happen, change nothing
#
# Anything already at the target path gets moved into
# ~/.dotfiles-backup/<timestamp>/ (preserving its relative path) before the
# symlink is created, so nothing is ever overwritten in place.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

# repo-relative path -> target path under $HOME
LINKS=(
  ".zshrc:.zshrc"
  ".config/nvim:.config/nvim"
  ".config/hypr:.config/hypr"
  ".config/ghostty:.config/ghostty"
  ".config/tmux:.config/tmux"
)

log() { printf '%s\n' "$*"; }

link_one() {
  local rel_src="$1" rel_dst="$2"
  local src="$REPO_DIR/$rel_src"
  local dst="$HOME/$rel_dst"

  if [[ ! -e "$src" ]]; then
    log "skip  $rel_dst (no $rel_src in repo)"
    return
  fi

  if [[ -L "$dst" && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
    log "ok    $rel_dst (already linked)"
    return
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    local backup_path="$BACKUP_DIR/$rel_dst"
    log "back  $rel_dst -> ${backup_path#$HOME/}"
    if ! $DRY_RUN; then
      mkdir -p "$(dirname "$backup_path")"
      mv "$dst" "$backup_path"
    fi
  fi

  log "link  $rel_dst -> ${src#$HOME/}"
  if ! $DRY_RUN; then
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
  fi
}

$DRY_RUN && log "-- dry run, nothing will be changed --"

for entry in "${LINKS[@]}"; do
  link_one "${entry%%:*}" "${entry#*:}"
done

if $DRY_RUN; then
  log ""
  log "-- post-install steps (not run in dry-run) --"
else
  log ""
  log "-- post-install: third-party plugin repos --"
fi

tpm_dst="$HOME/.config/tmux/plugins/tpm"
if [[ -d "$tpm_dst" ]]; then
  log "ok    tmux plugin manager already present"
else
  log "clone tmux plugin manager -> ${tpm_dst#$HOME/}"
  if ! $DRY_RUN; then
    git clone -q https://github.com/tmux-plugins/tpm "$tpm_dst"
  fi
  log "      (open tmux, then press prefix + I to install plugins)"
fi

shaders_dst="$HOME/.config/ghostty/shaders"
if [[ -e "$shaders_dst" ]]; then
  log "ok    ghostty cursor shaders already present"
else
  log "clone ghostty cursor shaders -> ${shaders_dst#$HOME/}"
  if ! $DRY_RUN; then
    git clone -q https://github.com/sahaj-b/ghostty-cursor-shaders "$shaders_dst"
  fi
fi

log ""
log "done. anything replaced was moved to ${BACKUP_DIR#$HOME/}"
