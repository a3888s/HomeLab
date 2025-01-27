## Основні команди `cp` з коротким описом

Команда `cp` використовується для копіювання файлів або директорій в Unix-подібних операційних системах, таких як Linux і macOS. Ось декілька основних команд `cp` з їх короткими описами:

1. `cp source_file destination_file`
   - Опис: Копіює `source_file` в `destination_file`. Якщо `destination_file` вже існує, він буде перезаписаний.

2. `cp source_file1 source_file2 ... destination_directory`
   - Опис: Копіює кілька файлів (`source_file1`, `source_file2`, тощо) в задану `destination_directory`. Останній аргумент повинен бути директорією.

3. `cp -r source_directory destination_directory`
   - Опис: Рекурсивно копіює вміст `source_directory` в `destination_directory`. Використовується для копіювання директорій.

4. `cp -i source_file destination_file`
   - Опис: Копіює `source_file` в `destination_file`, але питає користувача, чи перезаписати `destination_file`, якщо він вже існує. Потрібно підтвердження.

5. `cp -u source_file destination_file`
   - Опис: Копіює `source_file` в `destination_file`, тільки якщо `source_file` новіший або якщо `destination_file` не існує.

6. `cp -v source_file destination_file`
   - Опис: Копіює `source_file` в `destination_file`, показуючи детальний вивід з кожним скопійованим файлом. Забезпечує більш докладний процес копіювання.

7. `cp --help`
   - Опис: Виводить довідку по команді `cp`, показуючи доступні прапорці (опції) та їх пояснення.

8. `cp --version`
   - Опис: Показує інформацію про версію команди `cp`.

Зверніть увагу, що реалізація `cp` може дещо відрізнятися в різних операційних системах. Ці команди є загальними та широко використовуються, але можуть бути деякі різниці в операційних системах та їх версіях.
