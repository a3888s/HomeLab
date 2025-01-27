## Основні команди `mv` з коротким описом

Команда `mv` використовується для переміщення або перейменування файлів або директорій в Unix-подібних операційних системах, таких як Linux і macOS. Ось декілька основних команд `mv` з їх короткими описами:

1. `mv source_file destination_file`
   - Опис: Переміщує (переносить) `source_file` в `destination_file`. Якщо `destination_file` вже існує, він буде перезаписаний.

2. `mv source_file1 source_file2 ... destination_directory`
   - Опис: Переміщує кілька файлів (`source_file1`, `source_file2`, тощо) в задану `destination_directory`. Останній аргумент повинен бути директорією.

3. `mv source_directory destination_directory`
   - Опис: Переміщує `source_directory` в `destination_directory`. Якщо `destination_directory` вже існує, вміст директорії буде переміщений в цю існуючу директорію.

4. `mv source_file new_file_name`
   - Опис: Перейменовує `source_file` на `new_file_name`, залишаючи його в тому ж самому каталозі.

5. `mv -i source_file destination_file`
   - Опис: Переміщує (переносить) `source_file` в `destination_file`, але питає користувача, чи перезаписати `destination_file`, якщо він вже існує. Потрібно підтвердження.

6. `mv -u source_file destination_file`
   - Опис: Переміщує (переносить) `source_file` в `destination_file`, тільки якщо `source_file` новіший або якщо `destination_file` не існує.

7. `mv -v source_file destination_file`
   - Опис: Переміщує (переносить) `source_file` в `destination_file`, показуючи детальний вивід з кожним переміщеним файлом. Забезпечує більш докладний процес переміщення.

8. `mv --help`
   - Опис: Виводить довідку по команді `mv`, показуючи доступні прапорці (опції) та їх пояснення.

9. `mv --version`
   - Опис: Показує інформацію про версію команди `mv`.

Зверніть увагу, що деякі операційні системи можуть підтримувати додаткові опції або мати незначні відмінності у реалізації команди `mv`. Описані вище команди є загальними та широко використовуються на більшості Unix-подібних систем.
