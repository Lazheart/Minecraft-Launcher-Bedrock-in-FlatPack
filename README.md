
# Minecraft Bedrock Launcher (Flatpak)

Guía rápida para compilar e instalar el launcher en formato Flatpak.

## Proyecto Open Source

Este proyecto es **open source** y está abierto a contribuciones de la comunidad.
Si quieres colaborar con mejoras, correcciones o documentación, eres bienvenido.

---

## Capturas de demo

![Demo 1](demo/Screenshot%20From%202026-03-21%2023-31-22.png)

![Demo 2](demo/Screenshot%20From%202026-03-21%2023-39-26.png)

![Demo 3](demo/Screenshot%20From%202026-03-21%2023-41-18.png)

---

## Requisitos

Antes de comenzar, asegúrate de tener:

* `flatpak`
* `flatpak-builder`
* Repositorio **Flathub** configurado

---

## 1. Instalar Flatpak

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install flatpak flatpak-builder -y
```

### Arch Linux

```bash
sudo pacman -S flatpak flatpak-builder
```

---

## 2. Agregar Flathub

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

## 3. Instalar dependencias del runtime

```bash
flatpak install flathub \
  org.kde.Sdk/x86_64/5.15-22.08 \
  org.kde.Platform/x86_64/5.15-22.08 \
  io.qt.qtwebengine.BaseApp/x86_64/5.15-22.08 \
  org.freedesktop.Sdk.Extension.llvm15/x86_64/22.08 \
  -y
```

---

## 4. Compilar el proyecto

```bash
flatpak-builder build-dir org.lazheart.minecraft-launcher.yml
```

---

## 5. Instalar el launcher

```bash
flatpak-builder --user --install --force-clean build-dir org.lazheart.minecraft-launcher.yml
```

---

## 6. Ejecutar

```bash
flatpak run org.lazheart.minecraft-launcher
```

---

## Desinstalar

```bash
flatpak uninstall org.lazheart.minecraft-launcher
```

---

## Notas importantes

* Los archivos APK deben ser **propiedad del usuario**.
* Este launcher **no distribuye ni aprueba copias no autorizadas**.
* Solo se soportan APKs con arquitectura **x86_64**.

---

## Reportar errores

Si encuentras un problema o quieres reportar un bug, por favor abre un **Issue**.

Incluye la mayor cantidad de información posible:

* Log completo de la consola
* Pasos exactos para reproducir el error
* Qué resultado esperabas y qué ocurrió realmente
* Distribución de Linux y versión
* Versión de Flatpak y Flatpak Builder
* Cualquier dato adicional que ayude a reproducir el problema

Mientras más detalle incluyas, más rápido será diagnosticar y corregir el error.


---

## Recursos adicionales

* Documentación oficial de Flatpak:
  [https://flatpak.org/setup/](https://flatpak.org/setup/)

* Ejemplos de APK x86 :
  [https://readme.os/getapk_x86/](https://repoandroidopen.codeberg.page/)

---

## Licencia

Este proyecto usa la licencia **Apache 2.0**.
