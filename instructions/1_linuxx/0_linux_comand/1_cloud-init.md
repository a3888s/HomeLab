# Linux Crash Cource (Ubuntu)
## Getting Started with cloud-init

Cloud-init є технологією для налаштування та ініціалізації віртуальних машин у хмарних середовищах. Вона розроблена для автоматизації процесу налаштування новостворених віртуальних машин або контейнерів, щоб вони були готові до використання після їх створення.
Cloud-init працює у різних хмарних платформах, таких як Amazon Web Services (AWS), Google Cloud Platform (GCP), Microsoft Azure, OpenStack та інші. Вона також може використовуватися для налаштування віртуальних машин у локальних віртуалізаційних середовищах.
Основні можливості Cloud-init включають:
- налаштування мережі: Встановлення мережевих інтерфейсів, IP-адрес, DNS, маршрутів тощо.
- інтеграція з обліковими записами користувачів: Створення або налаштування облікових записів користувачів та їх публічних ключів для SSH.
- наалаштування SSH: Додавання SSH-ключів для автентифікації зовнішніх користувачів.
- налаштування хмарних метаданих: Отримання даних з метаданих хмарної платформи, таких як ідентифікатори віртуальних машин, регіони тощо.
- виконання скриптів: Cloud-init може виконувати користувацькі скрипти або команди для додаткового налаштування віртуальної машини.
- монтаж дисків: Можливість монтувати додаткові диски або файлові системи під час старту віртуальної машини.
- конфігурація пакетів: Встановлення та оновлення пакетів під час ініціалізації.

Cloud-init використовує конфігураційні файли, які можна задати під час створення віртуальної машини або передати через інші механізми (наприклад, за допомогою метаданих хмари). Ці файли визначають налаштування та дії, які будуть виконані під час ініціалізації системи. Cloud-init потім автоматично застосовує ці налаштування під час першого запуску віртуальної машини.
За допомогою Cloud-init користувачі можуть автоматизувати багато задач налаштування та підготовки середовища для роботи з віртуальними машинами в хмарному середовищі.

1. Перевірка встановлення **cloud-init**
  ```
  dpkg --get-selections | grep cloud-init
  ```
2. Встановлення **cloud-init**
  ```
  sudo apt install cloud-init
  ```
3. Видалення **cloud-init**
  ```
  sudo apt remove --purge cloud-init
  ```
4. Створюємо резервну копію файлу **cloud.cfg**
  ```
  cd /etc/cloud
  ```
  ```
  cp cloud.cfg cloud.cfg.bak
  ```
5. Редагуємо файл **cloud.cfg**
  ```
  sudo nano cloud.cfg
  ```
  - видалення непотрібних сервісів
    - **byobu**
    - **puppet**
    - **chef**
    - **mcollective**
    - **salt-minion**
  - конфігурація параметрів користувача за замовчуванням
    ```
    users:
    #  - default
    ```
    ```
    #   default_user:
    #     name: ubuntu
    #     lock_passwd: True
    #     gecos: Ubuntu
    #     groups: [adm, audio, cdrom, dialout, dip, floppy, lxd, netdev, plugdev, sudo, video]
    #     sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    #     shell: /bin/bash
    ```
6. Створення хеш паролю для користувача
  - пошук команди **mkpasswd**
    ```
    which mkpasswd
    ```
  - якщо не встановлений пакет whois
    ```
    apt search whois
    ```
    ```
    sudo apt install whois
    ```
    ```
    mkpasswd -m sha-512
    ```
  - вводимо параль для нового користувача
  - отримуємо хеш пароль користувача
    ```
    $6$UXjsZtO34UQhU5Bs$XUczXey8f6NArMLCLQchhlDuYKx4O7jUhnI69MVzs47lOQtaquTEt6kOFV0hr2vwt5QQGe5i2.y4GQ/s6b0Ox.
    ```
7. Конфігурування параметрів файлу **cloud.cfg**
  - відкриваємо файл **cloud.cfg**
    ```
    sudo nano cloud.cfg
    ```
  - створюємо параметри конфігурації нового користувача
    ```
        users:
    #  - default
       - name: a3888s
         lock_passwd: False
         passwd: $6$UXjsZtO34UQhU5Bs$XUczXey8f6NArMLCLQchhlDuYKx4O7jUhnI69MVzs47lOQtaquTEt6kOFV0hr2vwt5QQGe5i2.y4GQ/s6b0Ox.
         gecos: A3888S
    #    ssh_authorized_keys:
    #    groups:
         sudo: ["ALL=(ALL) NOPASSWD:ALL"]
         shell: /bin/bash
    ```
    ```
    preserve_hostname: false
    hostname: myhostname.mydomain.com
    manage_etc_hosts: true
    ```
  - налаштування часового поясу
    ```
    - timezone "Europe/Kiev"
    ```
  - створення файлу початку роботи серверу
    ```
    bootcmd:
      - date > /etc/birth_certificate
    ```
  - створення списку завантаження пакетів
    ```
    packages:
      - git
      - tmux
      - vim-nox
    ```
8. Cтворення файлу **99-fake_cloud.cfg**
   ```
   #configure cloud-init for NoCloud
   datasource_list: [ NoCloud, None ]
   datasource:
   NoCloud:
     fs_label: system-boot
   ```
9. Видалення символічну ссилку **99-default.link -> /dev/null**
   ```
   ls -l /etc/systemd/network/
   ```
   ```
   sudo rm /etc/systemd/network/99-default.link
   ```
10. Cкидання хмарної ініціалізації
    ```
    sudo cloud-init clean
    ```
11. Запуск ініціалізації
    ```
    sudo cloud-init init
    ```
