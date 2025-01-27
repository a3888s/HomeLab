#!/bin/bash

# Додайте цей рядок у початок скрипта
exec 2>> /tmp/shutdown_vm_errors.log

# Функція для вимкнення віртуальних машин
shutdown_vms() {
    for vmid in "$@"; do
        echo "Вимикаю віртуальну машину з ID $vmid"
        /usr/sbin/qm shutdown $vmid
        sleep 3m # Затримка 3 хвилин перед наступним вимкненням
    done
}

# Функція для вимкнення кластера Proxmox
shutdown_proxmox_cluster() {
    echo "Вимикаю Proxmox"
    /usr/sbin/shutdown
}

# Викликаємо функції для вимкнення віртуальних машин та кластера Proxmox
shutdown_vms 121 120 103 102 101 100
shutdown_proxmox_cluster

