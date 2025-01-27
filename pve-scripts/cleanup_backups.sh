#!/bin/bash

# Шлях до папки з бекапами
backup_dir="/mnt/pve/pve_backups/dump"

# Перевірка наявності папки з бекапами
if [ ! -d "$backup_dir" ]; then
    echo "Папка з бекапами не знайдена: $backup_dir"
    exit 1
fi

# Перейти в папку з бекапами
cd "$backup_dir" || exit

# Перебір файлів в папці
for file in *; do
    # Перевірка, чи файл є регулярним файлом
    if [ -f "$file" ]; then
        # Отримання дати з імені файлу (формат: yyyy_mm_dd)
        date_str=$(echo "$file" | grep -oE '[0-9]{4}_[0-9]{2}_[0-9]{2}' | sed 's/_/-/g')

        # Переведення дати в секунди
        file_date=$(date -d "$date_str" +%s)
        current_date=$(date +%s)

        # Обчислення різниці між поточною датою та датою файлу в днях
        diff_days=$(( ($current_date - $file_date) / (60 * 60 * 24) ))

        # Перевірка, чи бекап старіший або дорівнює 2 дням
        if [ $diff_days -le 2 ]; then
            echo "Видаляю старий бекап: $file"
            rm "$file"
        fi
    fi
done
