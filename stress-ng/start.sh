#!/bin/sh

_cpu_nr=${STRESS_CPU_NR:-2}
_sync_file_nr=${STRESS_SYNC_FILE_NR:-1}
_cache_nr=${STRESS_CACHE_NR:-1}
_vm_nr=${STRESS_VM_NR:-2}
echo "Stressing with CPUS ${_cpu_nr}, sync files ${_sync_file_nr}, caches ${_cache_nr} and VMs ${_vm_nr}"
/stress-ng --cpu "${_cpu_nr}" --sync-file "${_sync_file_nr}" --cache "${_cache_nr}" --vm "${_vm_nr}" &

_mem_percent=${STRESS_FILL_MEM_PERCENT:-90}
echo "Filling memory to $(( _mem_percent ))"
/stress-ng --vm-bytes "$(awk '/MemAvailable/{printf "%d\n", $2 * 0.'"$(( _mem_percent / 10))"';}' < /proc/meminfo)"k --vm-keep -m 1 &

while true;do sleep 10; done
