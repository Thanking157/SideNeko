#!/bin/sh
#
# SideNeko on-device bootstrap
# Copyright (C) 2026 thanking157
#

set -eu

BASE="${SIDENEKO_BOOTSTRAP_BASE:-https://thanking157.github.io/SideNeko/bootstrap}"
IPA="${SIDENEKO_IPA:-https://github.com/Thanking157/SideNeko/releases/latest/download/SideNeko.ipa}"
DIR="$HOME/.sideneko/bin"
BIN="$DIR/sideneko-bootstrap"
PART="$BIN.part"
SUM="$BIN.sha256"

fetch() {
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$1" -o "$2"
  else
    wget -qO "$2" "$1"
  fi
}

fail() {
  echo "SideNeko bootstrap: $1" >&2
  exit 1
}

case "$(uname -m)" in
  aarch64 | arm64) ;;
  *) fail "請在 iPhone／iPad 的 Open Minis 內執行這個指令。" ;;
esac

mkdir -p "$DIR"
echo "正在下載 SideNeko bootstrap…"
fetch "$BASE/sideneko-bootstrap-aarch64.sha256" "$SUM" || fail "無法下載校驗碼。"
fetch "$BASE/sideneko-bootstrap-aarch64" "$PART" || fail "無法下載安裝器。"

EXPECTED="$(awk '{print $1}' "$SUM")"
ACTUAL="$(sha256sum "$PART" | awk '{print $1}')"
[ -n "$EXPECTED" ] || fail "校驗碼是空的。"
[ "$ACTUAL" = "$EXPECTED" ] || fail "下載內容校驗失敗，已停止執行。"

chmod 755 "$PART"
mv "$PART" "$BIN"
ln -sf "$BIN" /usr/local/bin/sideneko-bootstrap 2>/dev/null || true
echo "下載完成，準備簽署 SideNeko ฅ^•ﻌ•^ฅ"

if [ -t 0 ]; then
  exec "$BIN" --ipa "$IPA" "$@"
elif [ -r /dev/tty ] && (: </dev/tty) 2>/dev/null; then
  exec "$BIN" --ipa "$IPA" "$@" </dev/tty
else
  exec "$BIN" --ipa "$IPA" "$@"
fi
