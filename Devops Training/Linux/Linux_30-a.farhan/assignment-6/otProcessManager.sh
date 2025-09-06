#!/usr/bin/bash

case "$1" in
    topProcess)
        get_top_processes "$2" "$3"
        ;;
    killLeastPriorityProcess)
        kill_least_priority_process
        ;;
    RunningDurationProcess)
        running_duration "$2"
        ;;
    listOrphanProcess)
        list_orphan_processes
        ;;
    listZoombieProcess)
        list_zombie_processes
        ;;
    killProcess)
        kill_process "$2"
        ;;
    ListWaitingProcess)
        list_waiting_processes
        ;;
    *)
        echo "Usage:"
        echo "./otProcessManager topProcess <n> <memory|cpu>"
        echo "./otProcessManager killLeastPriorityProcess"
        echo "./otProcessManager RunningDurationProcess <processName|processID>"
        echo "./otProcessManager listOrphanProcess"
        echo "./otProcessManager listZoombieProcess"
        echo "./otProcessManager killProcess <processName|processID>"
        echo "./otProcessManager ListWaitingProcess"
        ;;
esac
