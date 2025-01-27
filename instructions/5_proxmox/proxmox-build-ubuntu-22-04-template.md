# Створення шаблону віртуальної машини Proxmox

## Cloud Ubuntu 22.04

1. Створюємо віртуальну машину в proxmox
  - General
    - Node: **pve-1**
    - VM ID: **900**
    - Name: **server_name**
  - OS
    - **Do not use any media**
  - System
    - Qemu Agent: **True**
  - Disk
    - scsi0: **remove**
  - CPU: **default**
  - Memory: **1024**
  - Network: **default**


2. Створюємо хмарний накопичувач

   <sub>_**900 -> Hardware -> Add -> CloudInit Drive**_</sub>

  - Bus/Device: **IDE 0**
  - Storage: **local-lvm**

    
3. Налаштування хмарного накопичувача
   
   <sub>_900 -> Cloud-Init_</sub>

   - User: **_your_user_name_**
   - Password: your_password
   - DNS domain: default
   - DNS serves: default
   - SSH public key: your_ssh_public_key
   - Upgrade packages: default
   - IP Config (net0): ip=dhcp
   - Click button: **Regenerate Image**
  

4. Підключення cloud ubuntu 2204 в териіналі node: proxmox
   - connect to ssh root@proxmox
   - копіюємо посилання на образ cloud ubuntu 2204
     ```
     https://cloud-images.ubuntu.com/minimal/releases/jammy/release/
     ```
   - завантажуємо файл .img
     ```
     wget https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img
     ```
   - створюємо vga consol
     ```
     qm set 900 --serial0 socket --vga serial0
     ```
   - перейменування файлу образу
     ```
     mv ubuntu-22.04-minimal-cloudimg-amd64.img ubuntu-22.04.qcow2
     ```
   - змінюємо розмір диску
     ```
     qemu-img resize ubuntu-22.04.qcow2 32G
     ```
   - імпортуємо диск в proxmox
     ```
     qm importdisk 900 ubuntu-22.04.qcow2 local-lvm
     ```
   - редагуємо імпортований диск в web proxmox

     <sub>_900 -> Hardware -> Unused Disk 0 -> Edit_</sub>

     - Discard: True
     - SSD emulation: True
     - click submit **Add**

    - редагуємо параметри завантаження системи
  
      <sub>_900 -> Optipns -> Boot Order -> Edit_</sub>

      - scsi0: True
      - #: 2
      - click button **Ok**
     
    - вмикаємо запуск системи після завантаження
  
      <sub>_900 -> Optipns -> Start at boot -> Edit_</sub>

      - Start at boot: True
      - click button: **Ok**
     
5. Створюємо шаблон
   - click button: **Convert to template**

  
6. Створюємо віртуальну машину із шаблону
   - click button **Clone**
   - Mode: **Full Clone**
   - VM ID: your id
   - Name: Your name
   - click button: **Clone**

7. Запускаємо машину та вводимо облікові дані

8. Встановлюємо оновлення
   ```
   sudo apt update && sudo apt dist-upgrade
   ```

9. Встановлюємо QEMU Agent
   ```
   sudo apt install qemu-guest-agent
   ```
   ```
   sudo systemctl start qemu-guest-agent.service
   ```
   ```
   sudo systemctl status qemu-guest-agent.service
   ```
10. Відкриваємо доступ sshd
    ```
    sudo su
    ```
    ```
    cd /etc/ssh
    ```
    ```
    nano sshd_config
    ```
    ```
    PasswordAuthentication yes
    ```
