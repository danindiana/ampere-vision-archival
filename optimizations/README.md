# Efficiency Optimizations
## Resolving the Ampere High-Idle Power Draw

This folder documents the specific surgical optimizations applied to the RTX 3080 to reduce its idle power consumption in a multi-monitor/compute environment.

### 📊 Performance Impact

![Power Comparison](assets/power_comparison.png)

By manually overriding the P-state logic and locking the GDDR6X memory to its minimum frequency, we achieved a **64% reduction** in power draw.

### ⚙️ Implementation: The Toggle Logic

The `gpu_power_toggle.sh` script (located in the root) manages the transitions between these states:

![Optimization Logic](assets/optimization_logic.png)

### 🛠 Applied Commands
1. **Persistence Daemon:** `sudo systemctl enable --now nvidia-persistenced`
2. **Persistence Mode:** `sudo nvidia-smi -pm 1 -i 1`
3. **Memory Lock:** `sudo nvidia-smi -lmc 405 -i 1`
4. **Core Lock:** `sudo nvidia-smi -lgc 210 -i 1`
5. **Power Capping:** `sudo nvidia-smi -pl 250 -i 1`
