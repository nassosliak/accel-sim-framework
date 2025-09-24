#!/bin/bash
# cleanup_and_replace.sh
# This script cleans simulation runs, clears logs, and replaces config files.

set -e  # exit on error

BASE_DIR="/accel-sim-framework"
CFG_DIR="$BASE_DIR/gpu-simulator/configs/tested-cfgs/SM7_QV100/configs/rodinia3.1"
GPGPU_CFG_DIR="$BASE_DIR/gpu-simulator/gpgpu-sim/configs/tested-cfgs/SM7_QV100/configs/rodinia3.1"
NEW_CONFIG="$BASE_DIR/gpu-simulator/configs/tested-cfgs/SM7_QV100/config2.config"

echo "Removing sim_run_11.1/"
rm -rf "$BASE_DIR/sim_run_11.1/"

echo "Clearing procman logs..."
rm -f "$BASE_DIR/util/job_launching/procman/"*

echo "Clearing logfiles..."
rm -f "$BASE_DIR/util/job_launching/logfiles/"*

echo "Replacing trace.config files..."
find /accel-sim-framework/gpu-simulator/configs/tested-cfgs/SM7_QV100/configs/rodinia3.1 -type f -name "trace.config" -exec cp /accel-sim-framework/gpu-simulator/configs/tested-cfgs/SM7_QV100/config2.config {} \;

echo "Replacing gpgpusim.config files..."
find /accel-sim-framework/gpu-simulator/gpgpu-sim/configs/tested-cfgs/SM7_QV100/configs/rodinia3.1 -type f -name "gpgpusim.config" -exec cp /accel-sim-framework/gpu-simulator/gpgpu-sim/configs/tested-cfgs/SM7_QV100/config2.config {} \;

echo "Done!"
