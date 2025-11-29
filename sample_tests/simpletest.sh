#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd -- "$SCRIPT_DIR/.." && pwd)

# Output directory for generated G-code files. Defaults to a temp folder to avoid dirtying the repo.
OUTPUT_DIR=${OUTPUT_DIR:-$(mktemp -d -t bricklayers-XXXXXX)}

mkdir -p "$OUTPUT_DIR"
echo "Writing test outputs to: $OUTPUT_DIR" >&2

python3 "$REPO_ROOT/bricklayers.py" "$REPO_ROOT/sample_gcode/Sample_BrickLayersChallengeSimple_5walls.gcode" \
        -outputFile "$OUTPUT_DIR/SampleBrickLayersChallengeSimple_5walls_brick.gcode" \
        -extrusionMultiplier 1.05 \
        -verbosity 1

python3 "$REPO_ROOT/bricklayers.py" "$REPO_ROOT/sample_gcode/Sample_3DBenchy_5walls_classic.gcode" \
        -outputFolder "$OUTPUT_DIR" \
        -outputFilePostfix _brick \
        -extrusionMultiplier 1.05 \
        -startAtLayer 3 \
        -ignoreLayers \
        -ignoreLayersFromTo \
        -enabled 1 \
        -verbosity 2
