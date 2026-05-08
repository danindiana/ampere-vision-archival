#!/bin/bash

# GPU Power Management Toggle Script
# Targets the RTX 3080 (GPU 1)

GPU_ID=1

if [ "$1" == "eco" ]; then
    echo "Switching to ECO mode..."
    sudo nvidia-smi -pm 1 -i $GPU_ID
    sudo nvidia-smi -pl 200 -i $GPU_ID
    sudo nvidia-smi -lmc 405 -i $GPU_ID
    sudo nvidia-smi -lgc 210 -i $GPU_ID
    echo "ECO mode active (~44W idle)."
elif [ "$1" == "perf" ]; then
    echo "Switching to PERFORMANCE mode..."
    sudo nvidia-smi -pm 1 -i $GPU_ID
    sudo nvidia-smi -pl 340 -i $GPU_ID
    sudo nvidia-smi -rmc -i $GPU_ID
    sudo nvidia-smi -rgc -i $GPU_ID
    echo "PERFORMANCE mode active (Automatic clock management)."
else
    echo "Usage: $0 [eco|perf]"
fi
