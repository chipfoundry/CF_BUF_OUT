#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_buf_out_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_BUF_OUT.v" \
  "$ROOT/verify/beh_model/CF_BUF_OUT_core.v" \
  "$ROOT/verify/beh_model/tb_CF_BUF_OUT.v"
vvp "$OUT"
